#include "types.h"

typedef struct StateDA048 {
    u8 pad00[0x1C];
    s32 field1C;
    s32 field20;
    u8 pad24[0x20];
    s32 values44[3];
} StateDA048;

typedef struct ResourceBlockDA048 {
    u8 pad00[0x50];
    void* items[4];
} ResourceBlockDA048;

typedef struct ObjectDA048 {
    u8 pad00[0x3C];
    void* field3C;
    void* field40;
    u8 pad44[0x1C];
    ResourceBlockDA048* resources;
} ObjectDA048;

extern s32 D_800E6C30;
extern void* D_80087AA8;
extern void* D_8008931C;

extern StateDA048* func_800DD634(void);
extern void func_8000D874(void* owner, void* resource);
extern void func_8000D834(void* owner, void* resource);
extern void func_800DD788(s32 value);
extern u16 func_80016FD4(void);
extern void func_80035F88(u16 value, s32 sound);
extern void func_80032F3C(s32 pool, void* memory);

void func_800DA048(ObjectDA048* object) {
    StateDA048* state;
    ResourceBlockDA048* resources;
    u32 i;

    state = func_800DD634();
    resources = object->resources;
    state->field1C = 0;
    state->field20 = 0;
    func_8000D874(D_80087AA8, object->field3C);
    func_8000D834(D_8008931C, object->field3C);
    func_8000D874(D_80087AA8, object->field40);
    func_8000D834(D_8008931C, object->field40);
    func_800DD788(0xF);
    if (D_800E6C30 == 2) {
        func_80035F88(func_80016FD4(), 2);
    }
    for (i = 1; i < 4; i++) {
        state->values44[i - 1] = 0;
    }
    for (i = 0; i < 4; i++) {
        func_8000D874(D_80087AA8, resources->items[i]);
        func_8000D834(D_8008931C, resources->items[i]);
    }
    func_80032F3C(0, resources);
}
