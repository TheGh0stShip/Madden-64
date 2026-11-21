#include "types.h"

typedef struct {
    s32 x;
    s32 y;
    s32 z;
    s32 w;
} Vec4;

typedef struct {
    u8 pad00[0x14];
    s32 unk_14;
    u8 pad18[4];
    s32 x;
    s32 y;
} Motion;

typedef struct {
    u8 pad00[0x24];
    Motion *motion;
} Player;

typedef struct {
    u8 pad00[0x10];
    void *unk_10;
    s32 unk_14;
    u8 pad18[4];
    Vec4 pos;
} Obj;

extern void func_8000F3BC(Obj *, s32, s32, s32);
extern void func_8003CEB8(s32, s32, s32, s32);
extern s16 func_8003D8C0(s32);
extern s16 func_8003CBB8(void);
extern void func_800C0018(void *, s32, s32);
extern s32 func_8003DB28(s32, s32, s32);
extern void func_800A1CDC(void *);
extern void func_800A3704(s32, Motion *, s32);
extern void func_800B7DD8(s32, s32, s32, s32, s32);
extern void three_stage_value_update(Obj *, u16);
extern void func_8009F1DC(Vec4 at, s32 a, s32 b, s32 c, Player *d);
extern void func_800E1BCC(Player *, u8 *);
extern void func_800C0BBC(Player *, s32);
extern void func_800A365C(s32);
extern void func_8003D0C4(s32);
extern void func_8000BE80(void);
extern void func_8000D998(u32, Obj *);
extern void func_80035F88(u16, u16);

extern u16 D_80069BA8;
extern u16 D_80069BAA;
extern s32 D_80080C10;
extern u32 D_80085298;
extern u8 D_80085C00[];
extern u8 D_80085E48[];
extern s8 D_80087B50;
typedef struct { Player *obj; u32 state; u32 timer; s32 flag; s32 off; } Ctl;
extern Ctl D_80087FA0;
#define G_OBJ D_80087FA0.obj
#define G_STATE D_80087FA0.state
#define G_TIMER D_80087FA0.timer
#define G_FLAG D_80087FA0.flag
#define G_OFF D_80087FA0.off
extern u8 D_80088110[];
extern u8 D_80088488[];
extern volatile u16 D_8008A5B4;
extern s16 D_8008B674;
extern u8 D_8008B790[];

void func_800A644C(Obj *arg0) {
    void *child;
    u8 cmd[8];

    func_8000F3BC(arg0, 0xD0, 0xEF, 1);
    child = arg0->unk_10;
    switch (G_STATE) {
    case 0:
        func_8003CEB8(0x40, 0x3C, 0, 0x10);
        if (func_8003D8C0(0x40) != 0 || func_8003CBB8() == 0) {
            func_800C0018(child, 0xC00, 0);
            G_STATE = 1;
        }
        break;
    case 1:
        if (!(D_80080C10 & 0x4000) && G_FLAG != 0) {
            s32 idx = D_80087B50;
            if (idx >= 0) {
                D_80085E48[idx] = 0;
                D_80085C00[idx] = 0;
                D_80088110[idx] = D_80088488[idx] = func_8003DB28(0x40, 0x64, 0) << 4;
                D_8008B790[idx] = 1;
            }
            arg0->unk_14 |= 1;
            G_STATE = 2;
            func_800A1CDC(child);
            func_800A3704(0xB, G_OBJ->motion, 1);
            func_800B7DD8(2, 0x15, 0, 0, 0);
        }
        break;
    case 2:
        func_800C0018(child, 0xC00, 0);
        three_stage_value_update(arg0, D_8008A5B4);
        func_8009F1DC(arg0->pos, 6, 6, 6, G_OBJ);
        {
        Motion *m = G_OBJ->motion;
        s32 off = G_OFF + 0x100000;
        if (arg0->pos.x + off < m->x) {
            func_800A3704(0xB, m, 1);
            G_STATE = 3;
            G_TIMER = 0;
        }
        }
        break;
    case 3:
        G_TIMER += D_8008A5B4;
        if (G_TIMER > 0x78) {
            G_OBJ->motion->unk_14 &= 0xFFC0FFFF;
            cmd[0] = 7;
            func_800E1BCC(G_OBJ, cmd);
            G_OBJ->motion->unk_14 |= 0x20000;
            G_OBJ->motion->unk_14 &= ~5;
            G_STATE = 4;
            func_800A3704(0xB, G_OBJ->motion, 1);
        }
        break;
    case 4:
        G_OBJ->motion->unk_14 &= ~5;
        G_TIMER += D_8008A5B4;
        if (G_TIMER > 0x78) {
            G_STATE = 5;
            func_800A3704(0xB, G_OBJ->motion, 1);
        }
        break;
    case 5:
        G_OBJ->motion->unk_14 &= ~5;
        func_800C0018(child, 0xC00, 0);
        three_stage_value_update(arg0, D_8008A5B4);
        func_8009F1DC(arg0->pos, 6, 6, 6, G_OBJ);
        if (arg0->pos.x < (s32)0xFE700000) {
            G_STATE = 6;
            func_800A3704(0xB, G_OBJ->motion, 1);
        }
        break;
    case 6:
        {
            s32 idx = D_80087B50;
            if (idx >= 0) {
                D_80088488[idx] = 0;
                D_80088110[idx] = 0;
                D_8008B790[idx] = 1;
            }
        }
        func_800C0018(child, 0xC00, 0);
        three_stage_value_update(arg0, D_8008A5B4);
        func_8009F1DC(arg0->pos, 6, 6, 6, G_OBJ);
        if (arg0->pos.x < (s32)0xFE000000) {
            G_OBJ->motion->x = arg0->pos.x;
            G_OBJ->motion->y = arg0->pos.y - 0x40000;
            G_OBJ->motion->unk_14 |= 5;
            G_OBJ->motion->unk_14 &= 0xFFFDFFFF;
            func_800C0BBC(G_OBJ, 0x2E0003);
            G_STATE = 7;
            func_800A365C(1);
        }
        break;
    case 7:
        if (G_FLAG != 0) {
            if (func_8003D8C0(0x40) != 0) {
                func_8003D0C4(0x40);
            }
            if (D_8008B674 == 0) {
                D_8008B674 = 0xF;
            }
            func_8000BE80();
            func_8000D998(D_80085298, arg0);
            func_80035F88(D_80069BA8, D_80069BAA);
            G_STATE = 8;
            G_FLAG = 0;
        }
        break;
    case 8:
        break;
    }
}
