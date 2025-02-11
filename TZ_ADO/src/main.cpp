#include "Runner.h"

/*** Paramaters to INPUT ***
1: NUM_POINTS = 200;
2: K = 3;
3: SPARSE_EDGES = NUM_POINTS * std::log(NUM_POINTS);
*/

int main(int argc, char* argv[]){
    if (argc != 4){
        cout << "Three numbers only but given " << argc << "!" << endl;
        return 1;
    }

    char* end;
    const int num_points = std::strtol(argv[1], &end, 10);
    if (*end != '\0' || num_points <= 0) {
        cout << "NUM_POINTS must be a positive integer!" << endl;
        return 1;
    }

    const int k = std::strtol(argv[2], &end, 10);
    if (*end != '\0' || k <= 0) {
        cout << "K must be a positive integer!" << endl;
        return 1;
    }

    const double edge_scale = std::strtod(argv[3], &end);
    if (*end != '\0' || edge_scale < 0.0 || edge_scale > 1.0) {
        cout << "EDGE_SCALE must be a decimal between 0 and 1!" << endl;
        return 1;
    }

    const int edges = (int)(edge_scale * num_points * num_points); //if 1 then would be a complete graph

    Runner runner(num_points, k, edges);

    return runner.run();
}