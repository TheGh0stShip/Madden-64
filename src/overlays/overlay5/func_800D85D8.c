#include "types.h"

typedef struct WorkD85D8 {
    u8 pad00[0x14];
    u32 field14;
    u32 field18;
} WorkD85D8;

typedef struct ConfigD85D8 {
    s16 type;
    u8 pad02[2];
    s32 *values;
    u32 field08;
    u8 pad0C[4];
    s16 count;
    u8 pad12[6];
} ConfigD85D8;

typedef struct RefD85D8 {
    void *object;
    u16 field04;
    u8 field06;
    u8 field07;
} RefD85D8;

typedef struct StateD85D8 {
    u8 pad00[8];
    void *object;
    u8 pad0C[0x20];
    u32 field2C;
    u32 field30;
    u32 field34;
    u8 pad38[0x3C];
    s32 values[70];
} StateD85D8;

extern volatile u32 D_800892D8;
extern u32 D_800892DC;
extern void *D_80087AA8;
extern u8 D_80072234[];
extern s32 D_800E6C38;

extern void func_800DD694(s32 a, s32 b, s32 c);
extern void func_800D54E4(s32 value);
extern WorkD85D8 *func_800DD634(void);
extern void func_80016FF4(u32 value);
extern void *func_8000D740(void *owner, s32 one, ConfigD85D8 *config);
extern void func_800DD7E8(RefD85D8 *ref);
extern void func_800D6060(s32 id, void *data, StateD85D8 *state);

void func_800D85D8(StateD85D8 *state) {
    s8 i;
    s32 *values = state->values;
    volatile WorkD85D8 *work;
    ConfigD85D8 config;
    RefD85D8 ref;
    void *object;
    volatile u32 *first;

    func_800DD694(0x48, 0x11, 9);
    for (i = 1; i < 70; i++) {
        values[i] = 0;
    }
    values[0] = 70;
    func_800D54E4(1);
    work = func_800DD634();
    first = &D_800892D8;
    do {
        work->field14 = *first;
    } while (0);
    do {
        work->field18 = D_800892DC;
    } while (0);
    func_80016FF4(*first);
    func_80016FF4(D_800892DC);

    config.type = 0x390;
    config.values = state->values;
    config.field08 = 0;
    config.count = 6;
    object = func_8000D740(D_80087AA8, 1, &config);
    ((u32 *)object)[7] = 0x140;

    ref.object = object;
    ref.field04 = 0;
    ref.field06 = 1;
    ref.field07 = 10;
    func_800DD7E8(&ref);

    state->field34 = 0x3A0;
    state->object = object;
    state->field2C = 0;
    state->field30 = 0xFA;
    func_800D6060(0x398, D_80072234, state);
    D_800E6C38 = -1;
}
