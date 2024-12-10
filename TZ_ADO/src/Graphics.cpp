#include "Runner.h"

bool Runner::initSDL(){
    if (SDL_Init(SDL_INIT_EVERYTHING) > 0){
        cout << "SDL_Init failed with error: " << SDL_GetError() << endl;
        return false;
    }

    SDL_GameControllerEventState(SDL_ENABLE);
    
    //030000000d0f0000f600000001000000,Lic Pro Controller,a:b0,b:b1,x:b2,y:b3,back:b8,guide:b12,start:b9,leftshoulder:b4,rightshoulder:b5,dpup:h0.1,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,lefttrigger:b6,righttrigger:b7,platform:Mac OS X
    
    for (int i = 0; i < SDL_NumJoysticks(); i++){
        if (SDL_IsGameController(i)){
            controller = SDL_GameControllerOpen(i);
            break;
        }
    }

    return true;
}

bool Runner::initApp(){
    //- Init SDL
    if (!initSDL()){
        shutdownApp();
        return false;
    }

    constexpr int my_screen_width = 1512;
    constexpr int my_screen_height = 916;


    //- Init main app
    window = SDL_CreateWindow(
        "Approx Distance Oracle",
        SDL_WINDOWPOS_CENTERED,
        SDL_WINDOWPOS_CENTERED,
        my_screen_width,
        my_screen_height, 
        SDL_WINDOW_OPENGL
    );

    SDL_SetWindowFullscreen(window, SDL_WINDOW_FULLSCREEN_DESKTOP);

    
    if (window == nullptr){
        cout << "Unable to create window. Error: "<< SDL_GetError() << endl;
        shutdownApp();
        return false;
    }
    
    updateScreen();

    if (!(renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_PRESENTVSYNC))){
        cout << "Unable to create renderer. Error: "<< SDL_GetError() << endl;
        shutdownApp();
    }

    SDL_SetRenderDrawBlendMode(renderer, SDL_BLENDMODE_BLEND);

    string path = "./sprites/Points_SZ2.png";

    point_sprites = Spritesheet(path.c_str(), renderer, 16, 16);

    controller_used = (bool)controller;

    font1 = FC_CreateFont();
    
    if (!FC_LoadFont(font1, renderer, "./fonts/ticketing.regular.ttf", 12, FC_MakeColor(0,0,0,255), TTF_STYLE_NORMAL)){
        cerr << "Unable to create font beccause " << SDL_GetError() <<  endl;
    }
    
    return true;
}

void Runner::shutdownApp(){
    
    if (window)
    SDL_DestroyWindow(window);
    window = nullptr;

    if (renderer)
    SDL_DestroyRenderer(renderer);
    renderer = nullptr;

    if (controller)
    SDL_GameControllerClose(controller);

    if (font1)
    FC_FreeFont(font1);
    font1 = nullptr;

    SDL_Quit();
}

void Runner::resetFrame() const{
    SDL_SetRenderDrawColor(renderer, 192, 192, 192, 255);
    if (SDL_RenderClear(renderer) < 0){
        cout << "SDL_RenderClear failed with error: " << SDL_GetError() << endl;
    }
}

void Runner::drawFrame() const{
    //draw all recorded distances
    Target target;
    if (view){
        for (const auto& b : balls[view->id]){
            for (const auto& c : b.points_in){
                drawLine(view->x, view->y, V[c.first].x, V[c.first].y);
            }
        }
    }

    //draw underlying graph
    for (const auto& e : edges){
        drawGrLine(V[e.from].x, V[e.from].y, V[e.to].x, V[e.to].y);
    }
    
    //draw all points
    for (const auto& node : A[0]){
        target = {node->x-8, node->y-8, 16, 16};
        point_sprites.drawArea(&target, node->sample*16 + 2*16, 0, 16, 16, (view)? (inBall(view->id, node->id) != -1? 255 : 90) : 90);
    }

    if (view){ //draw the PI's
        //Redraw points in the ball
        for (const auto& ball : balls[view->id]){
            for (const auto& node : ball.points_in){
                target = {V[node.first].x-8, V[node.first].y-8, 16, 16};
                point_sprites.drawArea(&target, 16*(2+V[node.first].sample), 0, 16, 16);
            }

        }

        for (const auto& node : p_i[view->id]){
            target = {V[node].x-8, V[node].y-8, 16, 16};
            point_sprites.drawArea(&target, 16 * (2+V[node].sample), 16, 16, 16, 255);
        }
    }

    if (query_u && query_v){
        //Redraw points for the second ball
        for (const auto& b : balls[query_u->id]){
            for (const auto& c : b.points_in){
                drawGLine(query_u->x, query_u->y, V[c.first].x, V[c.first].y);
        }

        for (const auto& ball : balls[query_u->id]){
            for (const auto& node : ball.points_in){
                target = {V[node.first].x-8, V[node.first].y-8, 16, 16};
                point_sprites.drawArea(&target, 16*(2+V[node.first].sample), 0, 16, 16);
            }
        }

        for (const auto& node : p_i[query_u->id]){
            target = {V[node].x-8, V[node].y-8, 16, 16};
            point_sprites.drawArea(&target, 16 * (2+V[node].sample), 16, 16, 16, 255);
        }

    }


        drawBLine(query_u->x, query_u->y, query_v->x, query_v->y);

        Target target = {query_v->x-8, query_v->y-8, 16, 16};
        point_sprites.drawArea(&target, 0, 0, 16, 16);
        target = {query_u->x-8, query_u->y-8, 16, 16};
        point_sprites.drawArea(&target, 0, 0, 16, 16);
    }

    if (!dist_path.empty()){
        for (int i = 1; i < dist_path.size(); i++){
            drawYLine(dist_path[i-1]->x, dist_path[i-1]->y, dist_path[i]->x, dist_path[i]->y);
        }
    }


    if (closest && view){
        string message = std::to_string(closest->id) + " " + std::to_string(adjacency_matrix[closest->id][view->id]);
        FC_Draw(font1, renderer, closest->x, closest->y, message.c_str());
    }

    SDL_RenderPresent(renderer);
}

int Runner::run(){
    tick_t current_tick = SDL_GetTicks();
    clock = SDL_GetTicks();
    double delta = 0.0;

    while (running){
        current_tick = SDL_GetTicks();
        delta = current_tick - clock;

        //ensures framerate of 60fps
        if (delta > 1000/60.0){
            clock = current_tick;

            resetFrame();
            userInput();
            drawFrame();

        }
    }

    return 0;
}