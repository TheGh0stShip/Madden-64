#include "types.h"

typedef struct WorkDA598 {
    u8 pad00[0x14];
    u32 field14;
    u32 field18;
    u8 pad1C[0x28];
    u32 field44;
    u32 field48;
} WorkDA598;

typedef struct StateDA598 {
    u8 pad00[0x3C];
    void *field3C;
    u8 pad40[0x18];
    union {
        u32 index;
        struct {
            u16 pad58;
            u16 id;
        } half;
    } selector;
    u8 pad5C[0x10];
    void *field6C;
    void *field70;
} StateDA598;

extern void *D_80087AA8;
extern void *D_8008931C;
extern s32 D_800E6C34;
extern void *D_800C48B8[];
extern s16 D_800BDF0C;

extern WorkDA598 *func_800DD634(void);
extern void func_8000D874(void *a, void *b);
extern void func_8000D834(void *a, void *b);
extern void func_800DD788(s32 value);
extern u16 func_80016FD4(void);
extern void func_80035F88(u16 value, s32 amount);
extern void func_80017C24(void *value);
extern void func_800D628C(StateDA598 *state);
extern void func_800D57CC(void);
extern void func_80032F3C(s32 zero, void *value);
extern s16 func_80028A58(u16 id);

void func_800DA598(void *arg) {
    StateDA598 *state = arg;
    WorkDA598 *work = func_800DD634();
    void *value = state->field3C;
    StateDA598 *current;
    s32 one = 1;

    func_8000D874(D_80087AA8, value);
    func_8000D834(D_8008931C, value);
    func_800DD788(0x12);
    current = state;
    if (D_800E6C34 != one) {
        func_80035F88(func_80016FD4(), 0x48);
    }
    work->field14 = 0;
    work->field18 = 0;
    if (D_800E6C34 == one) {
        func_80017C24(D_800C48B8[state->selector.index]);
    }
    work->field48 = 0;
    func_800D628C(current);
    func_800D57CC();
    work->field44 = 0;
    func_80032F3C(0, current->field6C);
    func_80032F3C(0, current->field70);
    if (D_800E6C34 == one) {
        D_800BDF0C = func_80028A58(current->selector.half.id);
    }
}
