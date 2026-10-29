#include "types.h"

extern s32 D_8008B218[2][8];
extern s32 D_80089C20[];
extern s32 D_80089568[];
extern s32 D_80084FC0;
extern s32 D_80065568;
extern s32 D_80065564;
extern s32 D_80087918;
extern s32 D_80065540;
extern s32 D_8006553C;
extern s32 D_80065548;
extern s32 D_80065544;
extern s32 D_80065550;
extern s32 D_8006554C;
extern void func_80032F3C(s32 pool, s32 block);

void render_pipeline_finalize(void) {
    s8 i;

    for (i = 0; i < 8; i++) {
        func_80032F3C(0, D_8008B218[0][i]);
        func_80032F3C(0, D_8008B218[1][i]);
        func_80032F3C(0, D_80089C20[i]);
        func_80032F3C(0, D_80089568[i]);
    }
    func_80032F3C(0, D_80084FC0);
    func_80032F3C(0, D_80065568);
    func_80032F3C(0, D_80065564);
    func_80032F3C(0, D_80087918);
    func_80032F3C(0, D_80065540);
    func_80032F3C(0, D_8006553C);
    func_80032F3C(0, D_80065548);
    func_80032F3C(0, D_80065544);
    func_80032F3C(0, D_80065550);
    func_80032F3C(0, D_8006554C);
}
