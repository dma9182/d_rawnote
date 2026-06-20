CC = gcc

TARGET = drawnote

SRC = $(wildcard src/*.c)

RAYLIB_DIR = external/raylib/src

RAYLIB_LIB = $(RAYLIB_DIR)/libraylib.a


CFLAGS = \
	-Wall \
	-Wextra \
	-std=c11 \
	-I$(RAYLIB_DIR)


LIBS = \
	-L$(RAYLIB_DIR) \
	-lraylib \
	-lGL \
	-lm \
	-lpthread \
	-ldl \
	-lrt \
	-lX11


all: $(TARGET)


# build raylib if missing
$(RAYLIB_LIB):
	$(MAKE) -C $(RAYLIB_DIR)


# rebuild app when source changes
$(TARGET): $(SRC) $(RAYLIB_LIB)
	$(CC) $(SRC) -o $(TARGET) $(CFLAGS) $(LIBS)


run: $(TARGET)
	./$(TARGET)


clean:
	rm -f $(TARGET)
	$(MAKE) -C $(RAYLIB_DIR) clean
