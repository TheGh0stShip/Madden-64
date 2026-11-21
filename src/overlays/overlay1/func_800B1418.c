#include "types.h"

typedef struct {
    u8 value;
    u8 pad01[3];
} Slot;

typedef struct {
    u8 data[0x28];
} Player;

typedef struct {
    u8 pad00[2];
    Player players[213];
    u8 pad214A[2];
} Team;

typedef struct {
    u8 lo;
    u8 hi;
    u8 pad02[2];
} Range;

typedef struct {
    s8 index;
    u8 pad01[7];
} Kind;

typedef struct {
    u8 pad00[4];
    s32 team;
    s32 slot;
    s32 player;
} Args;

extern u8 D_8006B948[];
extern s32 D_8006B98C;
extern void *D_8006B990;
extern s32 D_8006B994;
extern void *D_8006B998;
extern s16 D_8006B9C2;
extern s32 D_8006B9D4;
extern u8 D_8006E2E8[];
extern s32 D_8006E440[];
extern s32 D_80073DA0[];
extern Kind D_80073E28[];
extern Range D_800740A4[];
extern Team D_80080D68[];
extern Slot D_80082D86[][0x853];
extern u16 D_80088472;
extern s16 D_800895D2;
u16 func_80031A1C(s32);
void func_800363F4(u16, s32, s32);
void func_8003DDF8(s32, s32 *, u8 *, s32, s32);
void func_80041BDC(s32, s32);
void func_800A1D14(void);
s32 func_800AE680(void);
void func_800AEA9C(s32);
s16 func_800AEFF8(s32, s16, u8 *, s32);
void primary_handle_release(s32);

void func_800B1418(Args *args)
{
    s16 value;
    s16 i;
    s32 *state;
    s32 handle;
    s32 result;

    value = D_80082D86[args->team][args->slot].value;
    i = 0;
    primary_handle_release(args->slot);
    for (; i < 6; i++) {
        if (value >= D_800740A4[i].lo && value <= D_800740A4[i].hi) {
            break;
        }
    }
    if (i >= 3) {
        func_80041BDC(3, 50);
    } else {
        func_80041BDC(4, 50);
    }
    handle = D_8006E440[i];
    state = &D_8006B98C;
    *state = 3;
    D_8006B990 = &D_80080D68[args->team].players[args->player];
    D_8006B994 = D_80073DA0[D_80073E28[value].index];
    D_8006B998 = D_8006E2E8;
    if (value >= 30) {
        func_800A1D14();
    }
    func_800363F4(D_80088472, func_80031A1C(5) + 2, D_8006B9D4);
    result = func_800AE680();
    func_8003DDF8(handle, state, D_8006B948, 0xB4, D_800895D2);
    D_8006B9C2 = func_800AEFF8(0x60, args->team, D_8006B948, result);
    func_800AEA9C(1);
}
