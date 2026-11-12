#include "types.h"

typedef struct StateDAA58 {
    u8 pad00[0x5A];
    u16 id;
    u32 limit;
} StateDAA58;

extern s32 D_800E6C34;
extern u8 D_80080C90[];
extern char D_8006BF90[];
extern char D_8006BFA0[];

extern u16 func_8003FA40(u16 id, u16 index, s32 mode);
extern void *func_8003ACA0(u16 id, u16 value);
extern void func_8003A7DC(u16 id, void *data);
extern void func_8003A8CC(u16 id, void *data);
extern void *func_8003AA28(u16 value);
extern void func_8002E65C(void *destination, void *source);

void func_800DAA58(u16 index, void *destination, void *arg) {
    StateDAA58 *state = arg;
    void *record = 0;
    u16 value;

    if (index < state->limit) {
        if (D_800E6C34 == 2) {
            u16 id = state->id;
            value = func_8003FA40(id, index, 2);
            record = func_8003ACA0(id, value);
        } else if (D_800E6C34 == 1) {
            func_8003A7DC(state->id, D_80080C90);
            func_8003A8CC(state->id, D_80080C90 + 0x6C);
            value = func_8003FA40(state->id, index, 2);
            record = func_8003AA28(value);
        }
        func_8002E65C(destination, record);
    } else if (state->limit == 0 && index == 0) {
        func_8002E65C(destination, D_8006BF90);
    } else {
        func_8002E65C(destination, D_8006BFA0);
    }
}
