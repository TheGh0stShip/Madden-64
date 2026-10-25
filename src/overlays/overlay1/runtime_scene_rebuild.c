#include "types.h"

typedef struct SceneState {
    u8 pad00[0x1C];
    s32 value1C;
    s32 value20;
    s32 value24;
} SceneState;

extern void *D_80088090;
extern void *D_8007A1AC;
extern void *D_8008931C;
extern u8 D_800A3164[];
extern u8 D_80086CE8[];
extern void *D_8007A1B0;
extern volatile s32 D_8007A1B4;
extern volatile s32 D_8007A1B8;
extern volatile s32 D_8007A1BC;
extern volatile SceneState *D_80086178;
extern void *func_8000C8A0(void *object);
extern void func_8000D874(void *owner, void *resource);
extern void func_8000D834(void *owner, void *resource);
extern void func_8000CB78(void *object, void *data, void *destination);
extern void func_800A2DB8(void *resource);
extern void func_800A2D44(void *destination);
extern void func_80032F3C(s32 value, void *pool);

void runtime_scene_rebuild(void)
{
    void *owner = func_8000C8A0(D_80088090);

    func_8000D874(owner, D_8007A1AC);
    func_8000D834(D_8008931C, D_8007A1AC);
    func_8000CB78(D_80088090, D_800A3164, D_80086CE8);
    func_800A2DB8(D_8007A1B0);
    func_800A2D44(D_80086CE8);
    func_80032F3C(0, D_8007A1B0);
    D_80086178->value1C = D_8007A1B4;
    D_80086178->value20 = D_8007A1B8;
    D_80086178->value24 = D_8007A1BC;
}
