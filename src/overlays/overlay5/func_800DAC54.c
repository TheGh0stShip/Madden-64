#include "types.h"

typedef struct StateDAC54 {
    u8 pad00[0x5A];
    u16 id;
    u32 limit;
} StateDAC54;

typedef struct RecordDAC54 {
    u8 pad00[0x0E];
    u8 type;
} RecordDAC54;

extern s32 D_800E6C34;
extern u8 D_80080C90[];
extern char D_8006BFA0[];
extern void *D_800E6B78[];

extern u16 func_8003FA40(u16 id, u16 index, s32 mode);
extern RecordDAC54 *func_8003ACA0(u16 id, u16 value);
extern void func_8003A7DC(u16 id, void *data);
extern void func_8003A8CC(u16 id, void *data);
extern RecordDAC54 *func_8003AA28(u16 value);
extern void func_8002E65C(void *destination, void *source);

void func_800DAC54(u16 index, void *destination, StateDAC54 *state) {
    RecordDAC54 *record = 0;
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
        func_8002E65C(destination, D_800E6B78[record->type & 0x3F]);
    } else {
        func_8002E65C(destination, D_8006BFA0);
    }
}
