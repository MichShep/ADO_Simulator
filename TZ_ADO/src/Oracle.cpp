#include "Runner.h"

void Runner::initGraph(){
    //- Create random points
    V.reserve(num_nodes);

    A.resize(k+1); //the K will dictate how many levels of samples there will be
    balls.resize(n);
    for (auto& b : balls){
        b.resize(k);
    }

    p_i.resize(n);
    for (auto& p : p_i){
        p.resize(k-1);
    }
   
    const int screen_width = screen.WIDTH;
    const int screen_height = screen.HEIGHT;
    
    for (int i = 0; i < num_nodes; i++){
        V.emplace_back(Node(i, rand()%screen_width, rand()%screen_height));
    }

    view = &V[0];

    adjacency_matrix.assign(n, vector<double>(n, std::numeric_limits<double>::infinity()));

    // Set diagonal to 0 (distance from a node to itself)
    for (int i = 0; i < n; ++i){
        adjacency_matrix[i][i] = 0.0;
    }

    // Ensure the graph is connected by creating a spanning tree
    for (int i = 1; i < n; ++i){
        int prevNode = rand() % i; // Ensure connection to an already added node
        double weight = calcDistance(V[i], V[prevNode]);
        adjacency_matrix[i][prevNode] = weight;
        adjacency_matrix[prevNode][i] = weight; // Bidirectional edge
        edges.emplace_back(i, prevNode, weight);
    }

    // Add some additional random edges to make the graph richer
    int extraEdges = 0; // Add approximately numNodes additional edges
    for (int i = 0; i < extraEdges; ++i){
        int from = rand() % n;
        int to = rand() % n;
        if (from != to) { // Avoid self-loops
            double weight = calcDistance(V[from], V[to]);
            adjacency_matrix[from][to] = min(adjacency_matrix[from][to], weight); // Use smaller weight if already connected
            adjacency_matrix[to][from] = min(adjacency_matrix[to][from], weight);
            edges.emplace_back(from, to, weight);
        }
    }

    int n = adjacency_matrix.size();

    // Update distances based on shortest paths through intermediate nodes
    for (int k = 0; k < n; ++k) {
        for (int i = 0; i < n; ++i) {
            for (int j = 0; j < n; ++j) {
                if (adjacency_matrix[i][k] < std::numeric_limits<double>::infinity() &&
                    adjacency_matrix[k][j] < std::numeric_limits<double>::infinity()){
                    adjacency_matrix[i][j] = min(adjacency_matrix[i][j],
                                                adjacency_matrix[i][k] + adjacency_matrix[k][j]);
                }
            }
        }
    }
}

void Runner::prepro(){
    prob = pow(n, -1.0/k);

    //A_0 <- V; 
    for (auto& node : V){ //first sample is all
        A[0].insert(&node);
    }

    vector<Node*> sampled;
    sampled.reserve(n);

    //A_k <- 0
    //A[K-1].insert(nullptr); //last sample is empty but starts empty as well
    for (int i = 1; i <= k - 1; i++){
        //let A_i contain all the elements of A_i-1 with probability n^1-/k
        for (auto& node : A[i-1]){
            const auto r = (double)rand() / RAND_MAX;
            if (r <= prob){ //prob of n^-1/k to add to sample
                A[i].insert(node);
                sampled.push_back(node);
                node->sample = i;
            }
        }
    }

    int v_id = 0;

    const auto& comparator = [&](const Node* lhs, const Node* rhs){
        if (!lhs || !rhs)
            return true;

        if (lhs->sample != rhs->sample)
            return lhs->sample < rhs->sample;

        return adjacency_matrix[lhs->id][v_id] <  adjacency_matrix[rhs->id][v_id];
    };

    //constuct the balls
    for (const auto& v : V){ 
        //sort the distances of the sampled 
        v_id = v.id;
        std::sort(sampled.begin(), sampled.end(), comparator);


        //set all of the p_i(v)
        int i = 1;
        for (auto& w : sampled){
            if (v != w && A[i].find(w) != A[i].end() && w->sample == i){ //if the node is in the sample and is the first one found, then since the dist are sorted its the p_i
                p_i[v.id][i-1] = w->id;
                i++; 

                if (i > k-1)
                    break;
            }
        }

        for (i = 0; i < k-1; i++){ //construct a ball for each sample where it connects to the next
                    
            int p_i_weight = adjacency_matrix[p_i[v.id][i]][v.id];
            
            for (auto& w : V){
                const dist_t pot = adjacency_matrix[w.id][v.id];

                if (w != v && pot <= p_i_weight && A[i].find(&w) != A[i].end()){
                    balls[v.id][i][w.id] = pot; //mainly for graphics
                    //store the distance
                    stored_distance[v.id][w.id] = pot;
                    stored_distance[w.id][v.id] = pot;
                    space++;
                }
            }
        }

        // Store the distances that are closer than the pivot
        for (auto& l : A[i]){
            if (v != l){
                const auto pot = adjacency_matrix[l->id][v.id];
                balls[v.id][k-1][l->id] = pot;
                stored_distance[v.id][l->id] = pot;
                stored_distance[l->id][v.id] = pot;
                space++;
            }
        }
    }
}

dist_t Runner::dist_k(id_t u, id_t v){
    //compare the two balls and check for their intersections
    id_t w = u;

    const int og_u=u, og_v=v; //only for graphics

    int i = 0; // Current sample to check pivots
    
    while (inBall(v, w) == -1){ //while w is not u
        i++;
        swap(u, v);
        w = p_i[u][i-1];
    }

    //graphics things
    dist_path.clear();
    dist_path.push_back(&V[og_u]);
    dist_path.push_back(&V[w]);
    dist_path.push_back(&V[og_v]);

    return stored_distance[v][w] + stored_distance[u][w]; //u -> w + w -> v = u -> v
}