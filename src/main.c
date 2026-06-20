#include "raylib.h"


int main(void)
{
    InitWindow(
        800,
        600,
        "d_rawnote"
    );


    while(!WindowShouldClose())
    {
        BeginDrawing();

        ClearBackground(BLACK);

        DrawText(
            "hello its 17:15",
            50,
            50,
            30,
            WHITE
        );

        EndDrawing();
    }


    CloseWindow();

    return 0;
}
