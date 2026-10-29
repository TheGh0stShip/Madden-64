#include "types.h"

typedef struct {
    u8 active;
    u8 mode;
    u8 pad02[0x22];
    s32 handle;
} State;

typedef struct {
    u8 pad00[0x60];
    State *state;
} Screen;

typedef struct {
    s32 handle;
    s16 time;
    u8 kind;
    u8 count;
} Message;

s32 func_800A6C2C(Screen *);
void func_800DD4B8(void);
void func_800A6F40(Screen *);
void func_800DF72C();
void func_800A6FD4(Screen *);
void func_800A73FC(Screen *, s32);
void func_8003CE88(s32, s32, s32);
void func_800E0BB4(Message *);

void func_800A692C(Screen *screen, s32 controller, s16 button) {
    State *state = screen->state;
    Message message;

    switch (button) {
        case 13:
            if (func_800A6C2C(screen) == -1) {
            leave:
                func_800DD4B8();
            }
            break;
        case 25:
            if (state->mode != 2) {
                func_800A6F40(screen);
            }
            break;
        case 8:
            if (state->mode != 2) {
                func_800DF72C();
                func_800A6FD4(screen);
            }
            break;
        case 17:
        case 28:
            if (state->mode != 2) {
                func_800A73FC(screen, 0);
            }
            goto leave;
        case 12:
            if (state->mode == 2) {
                func_8003CE88(0x3E, 0x69, 0x10);
                message.time = 0xF0;
                message.kind = 2;
                message.count = 10;
                message.handle = state->handle;
                func_800E0BB4(&message);
            }
            break;
    }
}
