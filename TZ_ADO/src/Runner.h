#include "Includes.h"

struct Point{
    id_t id=-1;
    int x=0;
    int y=0;

    int sample = 0; //for graphics only

    PointState state = PointState::BLANK;

    Point(const int& id=-1, const int& x=0, const int& y=0): id(id), x(x), y(y){}

    bool operator==(const Point& other) const{
        return id == other.id;
    }
    bool operator==(const Point* other) const{
        return id == other->id;
    }

    bool operator!=(const Point& other) const{
        return id != other.id;
    }
    bool operator!=(const Point* other) const{
        return id != other->id;
    }
};


struct Edge{
    int from;
    int to;
    double weight;

    Edge(int from, int to, double weight) : from(from), to(to), weight(weight) {}
};

struct Ball{
    unordered_map<id_t, dist_t> points_in;

    inline bool in(const id_t& target) const{
        return points_in.find(target) != points_in.end();
    }

    Ball(){
    }

    dist_t& operator[](const id_t& new_id){
        points_in[new_id] = -1;
        return points_in[new_id];
    }
};

class Runner{
private:
    //! Technical stuff
    SDL_GameController* controller;

    SDL_Window* window;

    SDL_Renderer* renderer;

    Spritesheet point_sprites;

    FC_Font* font1;

    Screen screen;

    tick_t clock=0;

    Point* query_v=nullptr;
    Point* query_u=nullptr;

    bool running = true;

    bool controller_used = false;

    //! Algo Things
    uint stretch = 2*K-1;

    //|V|
    uint n=NUM_POINTS;

    //|E|
    uint m;

    //Pre preprocc
    vector<Edge> edges;
    vector<vector<double>> adjacency_matrix;

    vector<Point> V;
    

    vector<set<Point*>> A; 

    vector<vector<Ball>> balls;
    vector<vector<id_t>> p_i;

    unordered_map<id_t, unordered_map<id_t, dist_t>> stored_distance;

    double prob = 0.0;

    //! Display things
    Point* view = nullptr;

    Point* closest = nullptr;

    vector<Point*> dist_path;

    //! Proj things
    int space = 0;

public:
    Runner(){
        //initApp();        

        for (int i = 0; i < 15; i++){
            srand(i+i*i);
            tick_t start_tick = SDL_GetTicks();
            initPoints();
            cout <<  SDL_GetTicks() - start_tick << endl;
            prepro();
            space = 0;
            reset();

        }
        exit(0);
        

        tick_t start = SDL_GetTicks();
        for (int i = 0; i < n; i++){
            for (int j = 0; j < n; j++){
                if (i != j){
                    //cout <<  << endl;
                    dist_k(i, j);
                }
                else{
                    //cout << 0 << "\t";
                }
            }
            //cout << endl;
        }
        cout << SDL_GetTicks()- start << endl;
        //cout << max_value << " " << i_m << " " << j_m << endl;
        
        //query_v = view;
        //query_u = closest;
        
    }

    int run();

    //! Algo Things
    void prepro();

    dist_t dist_k(id_t u, id_t v);

    int inBall(const id_t& center, const id_t& target) const {
    for (int i = 0; i < K; ++i) {  // Iterate through all levels
        if (balls[center][i].in(target)) {
            return i;  // Return the level where the target is found
        }
    }

    if (center == target) {
        return 0;  // A point is always in its own ball
    }

    return -1;  // Target is not in any of center's balls
}

    //! Init obj's
    void initPoints();

    //! User Input
    void userInput();

    Point* getClosest(const int& x, const int& y);

    Point* updateClosest();

    //! Graphics things

    ~Runner(){
        shutdownApp();

        view = nullptr;
        query_u = nullptr;
        query_v = nullptr;

        for (auto& s : A[0]){
            if (s)
                delete s;
        }
        A.clear();

        for (auto& i : balls){
            for (auto& p : i){
                p.points_in.clear();
            }
            i.clear();
        }
        balls.clear();
    }

    void reset(){
        view = nullptr;
        query_u = nullptr;
        query_v = nullptr;

        for (auto& a : A) {
            a.clear();
        }

        A.clear();

        for (auto& i : balls){
            for (auto& p : i){
                p.points_in.clear();
            }
            i.clear();
        }
        balls.clear();

        for (auto& p : p_i){
            p.clear();
        }
        p_i.clear();

        V.clear();

        

        stored_distance.clear();
    }

    void resetFrame() const;

    void drawFrame() const;

    void drawLine(const int& x1, const int& y1, const int& x2, const int& y2) const{
        SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
        SDL_RenderDrawLine(renderer, x1,    y1,     x2,     y2);
        SDL_RenderDrawLine(renderer, x1-1,  y1+1,   x2-1,   y2+1);
        SDL_RenderDrawLine(renderer, x1,    y1+1,   x2,     y2+1);
    }

    void drawBLine(const int& x1, const int& y1, const int& x2, const int& y2) const{
        SDL_SetRenderDrawColor(renderer, 0, 0, 255, 100);
        SDL_RenderDrawLine(renderer, x1,    y1,     x2,     y2);
        SDL_RenderDrawLine(renderer, x1-1,  y1+1,   x2-1,   y2+1);
        SDL_RenderDrawLine(renderer, x1,    y1+1,   x2,     y2+1);
    }

    void drawYLine(const int& x1, const int& y1, const int& x2, const int& y2) const{
        SDL_SetRenderDrawColor(renderer, 0, 255, 255, 255);
        SDL_RenderDrawLine(renderer, x1,    y1,     x2,     y2);
        SDL_RenderDrawLine(renderer, x1-1,  y1+1,   x2-1,   y2+1);
        SDL_RenderDrawLine(renderer, x1,    y1+1,   x2,     y2+1);
    }

    void drawGLine(const int& x1, const int& y1, const int& x2, const int& y2) const{
        SDL_SetRenderDrawColor(renderer, 0, 255, 0, 255);
        SDL_RenderDrawLine(renderer, x1,    y1,     x2,     y2);
        SDL_RenderDrawLine(renderer, x1-1,  y1+1,   x2-1,   y2+1);
        SDL_RenderDrawLine(renderer, x1,    y1+1,   x2,     y2+1);
    }

    void drawGrLine(const int& x1, const int& y1, const int& x2, const int& y2) const{
        SDL_SetRenderDrawColor(renderer, 125, 125, 125, 255);
        SDL_RenderDrawLine(renderer, x1,    y1,     x2,     y2);
        SDL_RenderDrawLine(renderer, x1-1,  y1+1,   x2-1,   y2+1);
        SDL_RenderDrawLine(renderer, x1,    y1+1,   x2,     y2+1);
    }

    bool initSDL(); 

    bool initApp();

    void shutdownApp();

    inline void updateScreen(){
        SDL_GetWindowSize(window, &screen.WIDTH, &screen.HEIGHT);
    }

    void printLevels(){
        cout << "Levels of Samples:" << endl;
        int a = 0;
        for (const auto& a_set : A){
            cout << "\tA_" << a << " ";
            for (const auto& node : a_set){
                cout << node->id << " ";
            }
            cout << endl;
            a++;
        }
    }

    private:
    double calcDistance(const Point& a, const Point& b){
        return sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2));
    }
};