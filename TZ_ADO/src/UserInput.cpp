#include "Runner.h"

void Runner::userInput(){
    SDL_Event event;

    if (SDL_PollEvent(&event)){ // Poll the event from the event queue
        switch (event.type){
            case SDL_KEYDOWN:{
                switch (event.key.keysym.scancode){
                    case SDL_SCANCODE_ESCAPE:{
                        cout << "Quiting through ESC" << endl;
                        exit(0);
                        break;
                    }
                    case SDL_SCANCODE_R:{ //Rerandomize
                        const auto t = time(NULL);
                        cout << "Reset with seed: " <<  t << endl;
                        srand(t);
                        reset();

                        initGraph();
                        prepro();
                        break;
                    }
                    
                    default:
                        break;
                }

                default:{
                    break;
                }
            }

            case SDL_MOUSEBUTTONDOWN:{
                if (!closest)
                    break;
                dist_path.clear();

                if (event.button.button != SDL_BUTTON_LEFT){
                    view = closest;
                    query_v = nullptr;
                    query_u = nullptr;
                }
                else{
                    if (view != closest){
                        query_v = view;
                        query_u = closest;
                    }
                }
                break;
            }
        
            case SDL_MOUSEMOTION:{
                updateClosest();
                
                break;
            }
        }
    }
}

Node* Runner::getClosest(const int& x, const int& y){ //idiot comp by doing all points and getting the closest
    int min_index = -1;
    int min_dist = INT_MAX;
    for (int i = 0; i < num_nodes; i++){
        const auto pos = calcDist(V[i].x, V[i].y, x, y);
        if (pos <= 256 && pos < min_dist){
            min_dist = pos;
            min_index = i;
        }
    };

    if (min_index == -1){
        return nullptr;
    }

    return &V[min_index];
}

Node* Runner::updateClosest(){
    int x; int y;
    SDL_GetMouseState(&x, &y);
    const auto& res = getClosest(x, y); //pass cursor coords to blackbox (optimize later which is why its seperat)

    closest = res;

    return closest;
}