#include "types.h"

typedef struct {
    u8 home;
    u8 away;
    u8 home_score;
    u8 away_score;
    u8 played;
    s8 state;
} Slot;

extern Slot D_800C50DA[22][15];

/* Clear the result of every game whose status nibble is set but not final (8). */
void func_8008DA98(void) {
    s16 week;
    s16 game;

    for (week = 0; week < 22; week++) {
        for (game = 0; game < 15; game++) {
            if ((D_800C50DA[week][game].played & 0xF) != 0 && (D_800C50DA[week][game].played & 0xF) != 8) {
                D_800C50DA[week][game].played &= 0xF0;
                D_800C50DA[week][game].home_score = 0;
                D_800C50DA[week][game].away_score = 0;
            }
        }
    }
}
