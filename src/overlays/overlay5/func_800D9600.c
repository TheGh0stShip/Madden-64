#include "types.h"

typedef struct StateD9600 {
    u8 pad00[0x1C];
    s32 field1C;
    s32 field20;
    u8 pad24[0x20];
    s32 values44[11];
} StateD9600;

typedef struct ResourceBlockD9600 {
    u8 pad00[0xFC];
    void *items[12];
} ResourceBlockD9600;

typedef struct ObjectD9600 {
    u8 pad00[0x3C];
    void *field3C;
    void *field40;
    u8 pad44[0x1C];
    ResourceBlockD9600 *resources;
} ObjectD9600;

extern s32 D_800E6C30;
extern u8 D_80087974[19];
extern void *D_80087AA8;
extern void *D_8008931C;

extern StateD9600 *func_800DD634(void);
extern u8 func_8001FA38(u16 index);
extern void func_8000D874(void *owner, void *resource);
extern void func_8000D834(void *owner, void *resource);
extern void func_800DD788(s32 value);
extern u16 func_80016FD4(void);
extern void func_80035F88(u16 value, s32 sound);
extern void func_80032F3C(s32 pool, void *memory);

void func_800D9600(ObjectD9600 *object) {
    StateD9600 *state;
    ResourceBlockD9600 *resources;
    u32 i;

    state = func_800DD634();
    resources = object->resources;
    state->field1C = 0;
    state->field20 = 0;
    if (D_800E6C30 != 2) {
        for (i = 0; i < 19; i++) {
            D_80087974[i] = func_8001FA38((u16)i);
        }
    }
    func_8000D874(D_80087AA8, object->field3C);
    func_8000D834(D_8008931C, object->field3C);
    func_8000D874(D_80087AA8, object->field40);
    func_8000D834(D_8008931C, object->field40);
    func_800DD788(0xF);
    if (D_800E6C30 == 2) {
        func_80035F88(func_80016FD4(), 2);
    }
    for (i = 1; i < 12; i++) {
        state->values44[i - 1] = 0;
    }
    for (i = 0; i < 12; i++) {
        func_8000D874(D_80087AA8, resources->items[i]);
        func_8000D834(D_8008931C, resources->items[i]);
    }
    func_80032F3C(0, resources);
}
