#include "Includes.h"

/**
 * @brief Struct to hold the coordinates of the Graphical representation of a Node 
 * 
 */
struct Node{
    id_t id = -1; /**< The ID of the node (-1 if not set)*/
    int x = 0; /**< The x coord of the node */
    int y = 0; /**< The y coord of the node */

    int sample = 0; /**< Which sample the node is in (only for graphics) */

    PointState state = PointState::BLANK; /**< Which state of display the node is (is a sample, selected, ect) (only for graphics) */

    /**
     * @brief Construct a new Node object
     * 
     * @param id The ID of the Node
     * @param x The x coord of the Node
     * @param y The y coord of the Node
     */
    Node(const int& id=-1, const int& x=0, const int& y=0): id(id), x(x), y(y){
    }

    /**
     * @brief Equivalency operator for two Node objects
     * 
     * @param other The other Node being compared
     * @return true The same Node (given by ID)
     * @return false Different Nodes
     */
    bool operator==(const Node& other) const{
        return id == other.id;
    }

    /**
     * @brief Equivalency operator for a Node object and Node pointer
     * 
     * @param other The other Node being compared
     * @return true The same Node (given by ID)
     * @return false Different Nodes 
     */
    bool operator==(const Node* other) const{
        return id == other->id;
    }

    /**
     * @brief Non-Equivalency operator for two Node objects
     * 
     * @param other The other Node being compared
     * @return true Different Nodes (given by ID)
     * @return false Same Nodes 
     */
    bool operator!=(const Node& other) const{
        return id != other.id;
    }

    /**
     * @brief Non-Equivalency operator for a Node object and Node pointer
     * 
     * @param other The other Node being compared
     * @return true Different Nodes (given by ID)
     * @return false Same Nodes 
     */
    bool operator!=(const Node* other) const{
        return id != other->id;
    }
};

/**
 * @brief Struct to represent Edges and from which node to which and the weight to take the edge
 * 
 */
struct Edge{
    id_t from; /**< ID of the start node of the edge */
    id_t to; /**< ID of the destination of the edge */
    double weight; /**< Weight of the edge to traverse (set to 1 for unweighted) */

    Edge(const int& from, const int& to, const double& weight): from(from), to(to), weight(weight){
    }
};

/**
 * @brief Struct to represent the 'Ball' around the node (aka the distances)
 * 
 */
struct Ball{
    unordered_map<id_t, dist_t> points_in; /**< A hashmap with KEY: ID and VALUE: Distance for the center node to the ID's node */

    /**
     * @brief Decider for if the ID's Node is in this Ball
     * 
     * @param target The ID of the node being checked if within this ball
     * @return true Node is in the Ball
     * @return false Node is NOT in the ball
     */
    inline bool in(const id_t& target) const{
        return points_in.find(target) != points_in.end();
    }

    /**
     * @brief Construct a new Ball object
     * 
     */
    Ball(){
    }

    /**
     * @brief [] Operator to access the distance hashmap directly
     * 
     * @param new_id The ID of the Node being added
     * @return dist_t& The distance from the center node to the ID given
     */
    dist_t& operator[](const id_t& new_id){
        points_in[new_id] = -1;
        return points_in[new_id];
    }
};

class Runner{
private:
    /**! Graphic Attributes !**/
    SDL_GameController* controller; /**< Would be for using a controller to control but... */

    SDL_Window* window; /**< The SDL Window to render onto */

    SDL_Renderer* renderer; /**< The SDL Renderer to draw things onto the windor */

    Spritesheet point_sprites; /**< The loaded spritesheet of the point sprites */

    FC_Font* font1; /**< The font for text */

    Screen screen; /**< The Screen object to create the window */

    tick_t clock=0; /**< The clock for the current tick the screen is being drawn on*/

    Node* query_v=nullptr; /**< Pointer to the node being used as the starting point */

    Node* query_u=nullptr; /**< Pointer to the node being used as to query against v */

    bool running = true; /**< Flag for if the graphcis should continue */

    bool controller_used = false; /**< Flag for if the user has a controller  */

    /**! Algorithm Attributes !**/
    int num_nodes = 200; /**< Number of Nodes to draw */

    int k = 3; /**< The k-paramater to determine stretch and samples*/

    int additional_edges; /**< The number of additional edges to add to graph*/

    unsigned int stretch; /**< The stretch factor of the given k (2k-1)*/

    //|V|
    unsigned int n; /**< The number of Nodes in the graph (|V|)*/

    //|E|
    unsigned int m; /**< The number of edges in the graph (|E|)*/

    Node* view = nullptr; /**< Current Node the player has selected  */

    Node* closest = nullptr; /**< Current Node the player is hovering over */

    vector<Node*> dist_path; /**< The path taken by the ADO to calculate the distance */

    /**! Preproccessing Attributes !**/
    vector<Edge> edges; /**< The edges connecting the Nodes */
    vector<vector<double>> adjacency_matrix; /**< AM version of the edges constructed */

    vector<Node> V; /**< List of all Nodes */
    
    vector<set<Node*>> A; /**< The vector of all samples */

    vector<vector<Ball>> balls; /**< The vector of each Node's Ball */
    vector<vector<id_t>> p_i; /**< The vector of each Node's pivots for the balls */

    unordered_map<id_t, unordered_map<id_t, dist_t>> stored_distance; /**< The hashmap of all stored distances used in the query */

    double prob = 0.0; /**< The probability that a Node is sampled */

    /**! Statistics Attributes !**/
    int space = 0; /**< Number of distances stored */

public:
    /**
     * @brief Construct a the graphics for rendering, the Graph, and the Balls
     * 
     */
    Runner(const int& num_nodes, const int& k, const int& additional_edges): num_nodes(num_nodes), k(k), additional_edges(additional_edges){
        stretch = 2*k - 1;

        n = num_nodes;

        initApp();

        srand(num_nodes*k*additional_edges);
        initGraph();
        prepro();
    }

    /**
     * @brief Main handler for the running of the simulator's graphics
     * 
     * @return int The exit state of the program
     */
    int run();

    /**! Algorithm Attributes !**/

    /**
     * @brief Handler for preprocesing the oracles
     * 
     */
    void prepro();

    /**
     * @brief Query Algorithm for getting the approximate distance from two Nodes
     * 
     * @param u The starting Node
     * @param v The destination Node
     * @return dist_t The approx distance between Nodes u and v
     */
    dist_t dist_k(id_t u, id_t v);

    /**
     * @brief Method that returns the sample number of the ball the Node is in 
     * 
     * @param center The center node, whose Balls will be checked (hehe)
     * @param target The node trying to be found in `center`'s balls
     * @return int The sample (or Ball level) of `center` the `target` is in (-1 if not found) 
     */
    int inBall(const id_t& center, const id_t& target) const {
        if (center == target) {
            return 0;  // A point is always in its own ball
        }
        
        for (int i = 0; i < k; ++i) {  // Iterate through all levels
            if (balls[center][i].in(target)) {
                return i;  // Return the level where the target is found
            }
        }

        return -1;  // Target is not in any of center's balls
    }

    //! Init obj's
    /**
     * @brief Initializes the graph given a certain seed
     * 
     */
    void initGraph();

    //! User Input
    /**
     * @brief Handlr for user input
     * 
     */
    void userInput();

    /**
     * @brief Get the closest Node to the given x and y coords
     * 
     * @param x The x coord of the query point
     * @param y The y coord of the query point
     * @return Node* The closet Node to the given coordinate
     */
    Node* getClosest(const int& x, const int& y);

    /**
     * @brief Handler for updating the closest Node
     * 
     * @return Node* The new closest Node to user's cursor
     */
    Node* updateClosest();

    /**
     * @brief Destroy the Runner object and free the memory of all balls and points
     * 
     */
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

    /**
     * @brief Reset the simulation by freeing memory
     * 
     */
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

    /**! Statistics Attributes !**/

    /**
     * @brief Method to reset the current frame to blank to redraw onto
     * 
     */
    void resetFrame() const;

    /**
     * @brief Method to draw the points and edges onto the screen
     * 
     */
    void drawFrame() const;

    /**
     * @brief Draws a BLACK line from the two given coordinates
     * 
     * @param x1 First x coord
     * @param y1 First y coord
     * @param x2 Second x coord
     * @param y2 Second y coord
     */
    void drawBlackLine(const int& x1, const int& y1, const int& x2, const int& y2) const{
        SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
        SDL_RenderDrawLine(renderer, x1,    y1,     x2,     y2);
        SDL_RenderDrawLine(renderer, x1-1,  y1+1,   x2-1,   y2+1);
        SDL_RenderDrawLine(renderer, x1,    y1+1,   x2,     y2+1);
    }

    /**
     * @brief Draws a BLUE line from the two given coordinates
     * 
     * @param x1 First x coord
     * @param y1 First y coord
     * @param x2 Second x coord
     * @param y2 Second y coord
     */
    void drawBlueLine(const int& x1, const int& y1, const int& x2, const int& y2) const{
        SDL_SetRenderDrawColor(renderer, 0, 0, 255, 100);
        SDL_RenderDrawLine(renderer, x1,    y1,     x2,     y2);
        SDL_RenderDrawLine(renderer, x1-1,  y1+1,   x2-1,   y2+1);
        SDL_RenderDrawLine(renderer, x1,    y1+1,   x2,     y2+1);
    }

    /**
     * @brief Draws a YELLOW line from the two given coordinates
     * 
     * @param x1 First x coord
     * @param y1 First y coord
     * @param x2 Second x coord
     * @param y2 Second y coord
     */
    void drawYellowLine(const int& x1, const int& y1, const int& x2, const int& y2) const{
        SDL_SetRenderDrawColor(renderer, 0, 255, 255, 255);
        SDL_RenderDrawLine(renderer, x1,    y1,     x2,     y2);
        SDL_RenderDrawLine(renderer, x1-1,  y1+1,   x2-1,   y2+1);
        SDL_RenderDrawLine(renderer, x1,    y1+1,   x2,     y2+1);
    }

    /**
     * @brief Draws a GREEN line from the two given coordinates
     * 
     * @param x1 First x coord
     * @param y1 First y coord
     * @param x2 Second x coord
     * @param y2 Second y coord
     */
    void drawGreenLine(const int& x1, const int& y1, const int& x2, const int& y2) const{
        SDL_SetRenderDrawColor(renderer, 0, 255, 0, 255);
        SDL_RenderDrawLine(renderer, x1,    y1,     x2,     y2);
        SDL_RenderDrawLine(renderer, x1-1,  y1+1,   x2-1,   y2+1);
        SDL_RenderDrawLine(renderer, x1,    y1+1,   x2,     y2+1);
    }

    /**
     * @brief Draws a GREY line from the two given coordinates
     * 
     * @param x1 First x coord
     * @param y1 First y coord
     * @param x2 Second x coord
     * @param y2 Second y coord
     */
    void drawGreyLine(const int& x1, const int& y1, const int& x2, const int& y2) const{
        SDL_SetRenderDrawColor(renderer, 125, 125, 125, 255);
        SDL_RenderDrawLine(renderer, x1,    y1,     x2,     y2);
        SDL_RenderDrawLine(renderer, x1-1,  y1+1,   x2-1,   y2+1);
        SDL_RenderDrawLine(renderer, x1,    y1+1,   x2,     y2+1);
    }

    /**
     * @brief Init the SDL tools
     * 
     * @return true Succesfully init
     * @return false Failed to init
     */
    bool initSDL(); 

    /**
     * @brief Init the Screen App
     * 
     * @return true Succesfully init
     * @return false Failed to init
     */
    bool initApp();

    /**
     * @brief Shutdown the app and free allocated SDL memory
     * 
     */
    void shutdownApp();

    /**
     * @brief Update the window size
     * 
     */
    inline void updateScreen(){
        SDL_GetWindowSize(window, &screen.WIDTH, &screen.HEIGHT);
    }

    /**
     * @brief Testing method to print the nodes in each sample
     * 
     */
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

    /**
     * @brief Calculate the Euclidian distance between two nodes
     * 
     * @param a Node a
     * @param b Node b
     * @return double The Euclidian distance between the two nodes
     */
    double calcDistance(const Node& a, const Node& b){
        return sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2));
    }
};