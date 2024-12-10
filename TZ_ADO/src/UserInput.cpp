#include "Runner.h"

void Runner::userInput(){
    SDL_Event event;

    if (SDL_PollEvent(&event)){
        switch (event.type){
            case SDL_KEYDOWN:{
                switch (event.key.keysym.scancode){
                    case SDL_SCANCODE_ESCAPE:{
                        cout << "Quiting through ESC" << endl;
                        exit(0);
                        break;
                    }
                    case SDL_SCANCODE_R:{ //rerandomize
                        const auto t = time(NULL);
                        cout << "Reset with seed: " <<  t << endl;
                        srand(t);
                        reset();

                        initPoints();
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

                    /*cout << view->id << ": "; 
                    for (const auto& i : p_i[view->id]){
                        cout << i << " ";
                    }
                    cout << endl;*/
                }
                else{
                    if (view != closest){
                        query_v = view;
                        query_u = closest;
                        
                        const auto res = dist_k(query_u->id, query_v->id);

                        //cout << "calc: " << res << " actual: " << adjacency_matrix[query_u->id][query_v->id] << " multi: " << res/adjacency_matrix[query_u->id][query_v->id] << endl;
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

Point* Runner::getClosest(const int& x, const int& y){
    int min_index = -1;
    int min_dist = INT_MAX;
    for (int i = 0; i < NUM_POINTS; i++){
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

Point* Runner::updateClosest(){
    int x; int y;
    SDL_GetMouseState(&x, &y);
    const auto& res = getClosest(x, y);

    closest = res;

    return closest;
}