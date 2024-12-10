SRC_DIR = src
BUILD_DIR = build/debug
CC = g++
CFLAGS = -std=c++11 -Wall -O0 -g -MMD -MP
CFLAGS_C = -std=c11 -Wall -O0 -g
SRC_FILES = $(wildcard $(SRC_DIR)/*.cpp)
OBJ_NAME = play

# Include paths for header files
INCLUDE_PATHS = -I include/SDL2 -I include/SDL2_image -I include/SDL2_tff

# Library paths for linking
LIBRARY_PATHS = -L lib/sdl2/2.30.2/lib -L lib/sdl2_image/2.8.2_1/lib -L lib/sdl2_ttf/2.22.0/lib

# Linker flags
LINKER_FLAGS = -lSDL2 -lSDL2_image -lSDL2_ttf

# Object files
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(SRC_FILES))
OBJS += $(BUILD_DIR)/SDL_FontCache.o

# Dependency files
DEPS = $(OBJS:.o=.d)

all: $(BUILD_DIR) $(BUILD_DIR)/$(OBJ_NAME)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/SDL_FontCache.o: include/SDL2_tff/SDL_FontCache.c
	gcc $(CFLAGS_C) $(INCLUDE_PATHS) -c include/SDL2_tff/SDL_FontCache.c -o $(BUILD_DIR)/SDL_FontCache.o

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CC) $(CFLAGS) $(INCLUDE_PATHS) -c $< -o $@

$(BUILD_DIR)/$(OBJ_NAME): $(OBJS)
	$(CC) $(CFLAGS) $(LIBRARY_PATHS) $(OBJS) $(LINKER_FLAGS) -o $@

clean:
	rm -f $(BUILD_DIR)/*.o $(BUILD_DIR)/*.d $(BUILD_DIR)/SDL_FontCache.o $(BUILD_DIR)/$(OBJ_NAME)

-include $(DEPS)

.PHONY: all clean
