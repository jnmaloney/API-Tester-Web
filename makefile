CC=emcc
WEBCORE_DIR:=../WebCore_v2019.2
SOURCES:=main.cpp 
LDFLAGS=-O2 --llvm-opts 2
OUTPUT=out/apitesterweb.js
USE_IMGUI=-I$(WEBCORE_DIR)/imgui/ $(wildcard $(WEBCORE_DIR)/imgui/*.cpp) 
USE_WEBGL=-s FULL_ES3=1 -s USE_GLFW=3 -s USE_WEBGL2=1 -lGLU -lGL
USE_WEBGL_MOB=-s FULL_ES2=1 -s USE_GLFW=3 -lGLU -lGL

all: $(SOURCES) $(OUTPUT)

$(OUTPUT): $(SOURCES)
	$(CC) -Isrc -I/usr/local/include/ $(SOURCES) $(USE_IMGUI) -std=c++1z $(USE_WEBGL) --bind $(LDFLAGS) -o $(OUTPUT) -s WASM=1 -s ALLOW_MEMORY_GROWTH=1 -s ASSERTIONS=1 -s FETCH=1 --preload-file data 

clean:
	rm $(OUTPUT)
	
