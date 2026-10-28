#include "types.h"

extern u8 D_8006EA70;
extern u8 D_8006EA71;
extern s32 D_8006EA74;
extern s32 D_8006EA78;
extern s32 D_80084FB0[2][2];
extern s32 D_80086C74;
extern s32 D_80087760;
extern s32 D_80087A64;
extern s32 D_8008931C;
extern s32 D_8008AFA8[2][2];

void func_8000BE80(void);
void func_8000D834(s32 heap, s32 handle);
void func_8000D874(s32 a, s32 b);
void func_8000DA98(s32 a);
void func_8001AEA8(s32 a);
void func_80032F3C(s32 a, s32 b);
void func_8003D78C(s32 a);
void func_800B7D98(void);

void func_800B4004(void) {
    u32 i;
    u32 j;

    func_800B7D98();
    func_8003D78C(0);
    func_8000BE80();
    for (i = 0; i < 2; i++) {
        for (j = 0; j < 2; j++) {
            if (D_8008AFA8[i][j] != 0) {
                func_80032F3C(0, D_80084FB0[i][j]);
                func_8000D834(D_8008931C, D_8008AFA8[i][j]);
            }
        }
    }
    if (D_8006EA78 != 0) {
        func_8000D874(D_80087A64, D_8006EA78);
        func_8000D834(D_8008931C, D_8006EA78);
        func_8001AEA8(D_80086C74);
    }
    func_8000DA98(D_80087760);
    D_80087760 = 0;
    func_80032F3C(0, D_8006EA74);
    D_8006EA74 = 0;
    D_8006EA70 = 0;
    D_8006EA71 = 0;
}
