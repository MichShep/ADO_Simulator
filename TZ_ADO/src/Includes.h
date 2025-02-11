#pragma once

#include <iostream>
using std::cout;
using std::endl;
using std::cout;
using std::string;
using std::cerr;
using std::cin;

#include <fstream>
using std::fstream;

#include <vector>
using std::vector;
using std::find;

#include <unordered_map> 
using std::unordered_map;

#include <set>
using std::set;
using std::swap;

#include <sstream>

#include <queue>
using std::queue;
using std::priority_queue;

#include <stack>
using std::stack;

#include <cmath>
using std::pow;

#include <math.h>

#include <random>
#include <algorithm>
using std::shuffle;
using std::find;
using std::swap;
using std::min;

#include <utility>
using std::pair;

#include <filesystem>

#include "../include/SDL2/SDL.h" 

#include "../include/SDL2_tff/SDL_ttf.h"

#include "../include/SDL2_tff/SDL_FontCache.h"

#include "../include/SDL2_image/SDL_image.h"

#include "../include/SDL2/SDL_gamecontroller.h"

#define pastWait(h, t, w)(h? (t - h >= w) : (false))

#define calcDist(x1, y1, x2, y2)((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1))

const int JOYSTICK_DEADZONE = 16000;

constexpr int CURSOR_SPEED = 5;

typedef SDL_Rect Target;

typedef uint32_t tick_t;

typedef int ID_t;

typedef double dist_t;

enum PointState{
    BLANK,
    SELECTED_V,
    SELECTED_U,
    SAMPLED,
    
};

struct Screen{
    int WIDTH = 1512;
    int HEIGHT = 946;

    double zoom_factor = 1.0;

    int zoom_x = 0;
    int zoom_y = 0;

    inline int getCenterX() const {
        return WIDTH/2;
    }
    inline int getCenterY() const {
        return HEIGHT/2;
    }

    inline double getXScale() const{
        return zoom_factor*WIDTH/1512.0;
    }

    inline double getYScale() const{
        return zoom_factor*HEIGHT/982.0;
    }

    inline int getX(const int x) const{
        return (x-zoom_x)*getXScale();
    }

    inline int getY(const int y) const{
        return (y-zoom_y)*getYScale();
    }
};

class Spritesheet{

private:
    SDL_Rect clip;
    SDL_Texture* spritesheet_image;
    SDL_Renderer* renderer;

public:
    Spritesheet(){
    }

    Spritesheet(char const *path, SDL_Renderer* renderer, const int width=32, const int height=32){
        this->renderer = renderer;

        auto spritesheet_surface = IMG_Load(path);
        if (!(spritesheet_image = SDL_CreateTextureFromSurface(renderer, spritesheet_surface))){
            cout << "Creating spritesheet failed with error: " << SDL_GetError() << endl;
        }
        SDL_SetTextureBlendMode(spritesheet_image, SDL_BLENDMODE_BLEND);

        SDL_FreeSurface(spritesheet_surface);

        clip.w = width;
        clip.h = height;
    }

    void freeMemory(){
        SDL_DestroyTexture(spritesheet_image);
        spritesheet_image = nullptr;
    }

    void selectSprite(int x, int y=0, int clip_x=-1, int clip_y=-1){
        clip.x = x * ((clip_x == -1)? clip.w : clip_x);
        clip.y = y * ((clip_y == -1)? clip.h : clip_y);

        if (clip_y !=-1){
            clip.w = clip_x;
            clip.h = clip_y;
        }
      
    }

    void drawSelectedSprite(SDL_Rect* position){
        if (SDL_RenderCopy(renderer, spritesheet_image, &clip, position) < 0){ //was an error
            cout << "Drawing selected sprite failed with error: " << SDL_GetError() << endl;
        }
    }

    void drawSprite(SDL_Rect* position, const int row, const int pos, const int size_x=32, const int size_y=32, const int offset=0, const int unscaledX=0, const int unscaledY=0){
        position->x += offset;
        clip.x = pos * size_x + unscaledX;
        clip.y = row * size_y + unscaledY;
        clip.w = size_x;
        clip.h = size_y;

        
        if (SDL_RenderCopy(renderer, spritesheet_image, &clip, position) < 0){ //was an error
            cout << "Drawing sprite failed with error: " << SDL_GetError() << endl;
        }
    }

    void drawArea(SDL_Rect* position, const int& x, const int& y, const int& w, const int& h) const{
        Target temp_clip = {x, y, w, h};

        if (SDL_RenderCopy(renderer, spritesheet_image, &temp_clip, position) < 0){ //was an error
            cout << "Drawing transparent area failed with error: " << SDL_GetError() << endl;
        }
    }

    void drawArea(SDL_Rect* position, const int& x, const int& y, const int& w, const int& h,  const Uint8 alpha) const{
        Target temp_clip = {x, y, w, h};

        SDL_SetTextureAlphaMod(spritesheet_image, alpha);
        if (SDL_RenderCopy(renderer, spritesheet_image, &temp_clip, position) < 0){ //was an error
            cout << "Drawing transparent area failed with error: " << SDL_GetError() << endl;
        }

        //- Reset transparency
        SDL_SetTextureAlphaMod(spritesheet_image, 255);
    }
};