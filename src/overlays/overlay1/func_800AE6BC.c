#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct {
    s16 unk00;
    s16 id;
    struct {
        u8 pad00[0x14];
        s32 flags;
    } *obj;
} SlotEntry;

typedef struct {
    u8 used;
    u8 pad01[8];
} Channel;

typedef struct {
    s32 unk00;
    s16 unk04;
    s16 unk06;
    s16 unk08;
    s16 pad0A;
    s32 unk0C;
    s32 unk10;
    u8 pad14[0x14];
} TaskParams;

typedef struct {
    u8 pad00[8];
    s32 unk08;
} Task;

extern s32 D_8006B8E8;
extern s32 D_8006B8F8;
extern s32 D_8006B8FC;
extern Task *D_8006B900;
extern s32 D_8006B904;
extern Task *D_8006B988;
extern s16 D_8006B9BC;
extern s16 D_8006B9BE;
extern s16 D_8006B9C0;
extern s16 D_8006B9C2;
extern s16 D_8006B9C6;
extern s16 D_8006B9C8;
extern Task *D_80072770;
extern s16 D_8007A184;
extern Channel D_80085818[];
extern s16 D_800857C0;
extern s8 D_80086DCC;
extern SlotEntry D_80086DE8[];
extern s16 D_80087914;
extern s32 D_80089344;
extern s16 D_80089348;
extern s16 D_8008934A;
extern s32 D_80089350;
extern s16 D_80089510;
extern s32 D_80089530[];
extern s16 D_8008A71C;
extern s32 D_8008B20C;
extern s16 D_8008B258;
extern s32 D_800AE774;

void func_8000D834(s32, Task *);
Task *func_8000D8DC(s32, TaskParams *);
void func_80016FE4(Task *);
void func_8001AD78(s32 *);
void func_8002FEA4(s32 *, s32, s32);
s32 func_8003332C(s32, s32);
s16 func_800AACE8(s32, s32 *, s32);
void func_800AD5D0(s32, s32, s32, s32);
void func_800AE90C(void);

void func_800AE6BC(s32 mode) {
    s16 i;
    TaskParams params;

    D_8006B8F8 = mode;
    for (i = 0; i < 8; i++) {
        D_80086DE8[i].id = -1;
    }
    D_8008A71C = 0;
    D_8006B900 = func_8000D8DC(3, NULL);
    D_8006B8FC = D_8006B900->unk08;
    func_8000D834(D_8006B8F8, D_8006B900);
    for (i = 0; i < 8; i++) {
        D_80085818[i].used = 0;
        D_80089530[i] = 0x80000000;
    }
    func_8001AD78(&D_8006B904);
    D_80089344 = func_8003332C(0x80, 0x60);
    D_8008B20C = func_8003332C(0x80, 0x60);
    D_8006B9BC = -1;
    D_8006B9BE = -1;
    D_8006B9C0 = -1;
    D_8006B9C2 = -1;
    D_8006B9C6 = -1;
    D_8006B9C8 = -1;
    D_800857C0 = 0;
    D_8007A184 = -1;
    func_800AD5D0(0, 0, 0, 0);
    D_80089350 = 0;
    D_80089510 = 0;
    D_80087914 = 0;
    D_80089348 = -1;
    D_8008934A = -1;
    func_8002FEA4(&D_800AE774, 5, 5);
    func_800AE90C();
    params.unk04 = 2;
    D_80086DCC = 0;
    params.unk0C = 0;
    params.unk08 = 0;
    params.unk06 = 0;
    params.unk10 = 0;
    params.unk00 = 30;
    D_8006B988 = func_8000D8DC(0, &params);
    D_80072770 = D_8006B988;
    func_80016FE4(D_8006B988);
    D_8008B258 = func_800AACE8(0x140, &D_8006B8E8, 3);
    D_80086DE8[D_8008B258].obj->flags &= ~1;
}
