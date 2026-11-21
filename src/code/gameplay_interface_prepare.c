#include "types.h"

typedef struct {
    u8 unk0;
    u8 unk1;
    s16 unk2;
} PlayerB454;

typedef struct {
    s16 count;
    PlayerB454 players[1];
    u8 pad6[0x2146];
} TeamB454;

typedef struct {
    void *unk0;
    s32 unk4;
    s32 unk8;
    s32 unkC;
    s16 unk10;
} RequestB454;

extern u16 func_8002C1F4(u8, s16);
extern u16 func_80031A1C(s32);
extern void func_800AE924(RequestB454 *);

extern TeamB454 D_80082CA8[];
extern s16 D_80089320;
extern u8 D_8008D068[];

void gameplay_interface_prepare(void) {
    RequestB454 request;
    u16 team;
    u16 i;
    u16 best;
    u16 bestTeam;
    u32 bestB;
    u32 bestA;
    u16 value;
    u16 roll;

    bestA = 0;
    bestTeam = 0;
    best = 0;
    bestB = 0;
    for (team = 0; team < 2; team++) {
        for (i = 0; i < D_80082CA8[team].count; i++) {
            value = func_8002C1F4(D_80082CA8[team].players[i].unk1, D_80082CA8[team].players[i].unk2);
            if (value > best) {
                best = value;
                bestB = D_80082CA8[team].players[i].unk1;
                bestA = D_80082CA8[team].players[i].unk0;
                bestTeam = team;
            }
        }
    }
    roll = func_80031A1C(200);
    if (best != 0 && (D_80089320 == 0 || roll < best)) {
        request.unk0 = D_8008D068;
        request.unk4 = bestTeam;
        request.unk8 = bestB;
        request.unkC = bestA;
        request.unk10 = 0;
        func_800AE924(&request);
    }
}
