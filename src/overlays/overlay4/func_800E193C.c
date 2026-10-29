#include "types.h"

typedef struct {
    s32 handle;
    s16 visible;
    s16 width;
    s16 height;
    u8 pad0A[2];
    s32 flags;
    u8 pad10[0x28 - 0x10];
} LayerDesc;

typedef struct {
    s16 kind;
    u8 pad02[2];
    s32 x;
    s32 y;
    u8 pad0C[4];
    s16 depth;
    u8 pad12[0x18 - 0x12];
} SpriteDesc;

extern s32 D_80087118;
extern s32 D_80085A44;
extern s32 D_80087120;
extern s32 D_80085BE8;
extern s32 D_80084F4C;
extern s32 D_8008809C;
extern s32 func_8000C8A0(s32 id);
extern u16 func_80016FD4(void);
extern void func_80035EF0(u16 arg0, s32 arg1);
extern s32 func_80036540(s32 arg0);
extern void func_800B7C80(void);
extern void func_8003E460(void);
extern s32 func_8000D740(s32 screen, s32 index, void *desc);
extern void func_80016FE4(s32 layer);
extern void func_8003190C(s32 mask);

void func_800E193C(s32 screenId, s32 overlayId) {
    LayerDesc layer;
    SpriteDesc sprite;

    D_80087118 = screenId;
    D_80085A44 = func_8000C8A0(screenId);
    D_80087120 = overlayId;
    D_80085BE8 = func_8000C8A0(overlayId);
    func_80035EF0(func_80016FD4(), 0);
    while (func_80036540(1) != 0) {
        func_800B7C80();
        func_8003E460();
    }
    layer.visible = 1;
    layer.width = 0x10C;
    layer.handle = 0;
    layer.flags = 0;
    layer.height = 0x12;
    D_80084F4C = func_8000D740(D_80085A44, 0, &layer);
    func_80016FE4(D_80084F4C);
    sprite.kind = 0;
    sprite.x = 0;
    sprite.y = 0;
    sprite.depth = 5;
    D_8008809C = func_8000D740(D_80085A44, 1, &sprite);
    func_8003190C(0xF03F);
}
