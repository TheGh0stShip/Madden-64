#include "types.h"

typedef struct {
    s32 *data;
    s32 team;
    s32 unk08[2];
    s16 unk10;
} Request;

extern s32 D_80080C10;
typedef struct {
    u16 value;
    u8 unk02[0x214A];
} TeamStat;

extern TeamStat D_80082D96[];
extern s16 D_80087702;
extern s32 D_800AC948;

void func_8009BD04(s32);
void func_8009C900(s32, s32);
void func_8009CBB8(s32, s32);
u16 func_8009EC0C(s16);
void func_800A2BAC(s32);
void func_800AE924(Request *);
void func_800C1E4C(s32);

s32 func_800A3238(s16 team) {
    Request request;

    if (func_8009EC0C(team) != 0) {
        D_80082D96[team].value--;
        func_8009BD04(3);
        func_8009C900(0x28, 1);
        request.data = &D_800AC948;
        request.team = team;
        request.unk10 = 0xAF;
        func_800AE924(&request);
        D_80080C10 |= 0x40000000 << team;
        func_8009CBB8(0x2D, 0xD2);
        func_800C1E4C(0xA);
        D_80087702 = 0;
        func_800A2BAC(0x1400);
        return 1;
    }
    return 0;
}
