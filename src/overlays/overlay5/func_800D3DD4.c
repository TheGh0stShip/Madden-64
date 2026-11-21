#include "types.h"

typedef struct {
    s8 type;
    u8 unk_01;
    u8 unk_02;
} StatQuery;

s16 func_80023C60(u16 arg0, u16 arg1, u8 arg2);
s16 func_80023D44(u16 arg0, u16 arg1, u8 arg2, u8 arg3);
s32 func_80023E58(u16 arg0, u16 arg1, u8 arg2, u8 arg3);
s16 func_80023F94(u16 arg0, u8 arg1);
s16 func_80024010(u16 arg0, u8 arg1, u8 arg2);
s32 func_800240C4(u16 arg0, u8 arg1, u8 arg2);
s32 func_80027E38(u16 arg0);
s32 func_8003AA28(u16 arg0);
u16 func_800D20A0(s32 arg0, s32 arg1, u16 arg2);
extern u16 D_80080CFC[];

s32 func_800D3DD4(u16 team, StatQuery *query, s32 other, s32 flags) {
    s32 result = 0;

    if (flags & 0x100000) {
        result = func_800D20A0(func_8003AA28(team), 0, other);
    } else {
        switch (query->type) {
            case 0:
            case 3:
                if (flags & 4) {
                    if (query->unk_01 == 0x31) {
                        result = func_80027E38(team);
                    } else {
                        result = func_80023F94(team, query->unk_01);
                    }
                } else {
                    result = func_80023C60(other, team, query->unk_01);
                }
                break;
            case 1:
            case 6:
                if (flags & 4) {
                    result = func_80024010(team, query->unk_01, query->unk_02);
                } else {
                    result = func_80023D44(other, team, query->unk_01, query->unk_02);
                }
                break;
            case 2:
                if (flags & 4) {
                    result = func_800240C4(team, query->unk_01, query->unk_02);
                } else {
                    result = func_80023E58(other, team, query->unk_01, query->unk_02);
                }
                break;
            case 4:
                result = query->unk_01;
                break;
            case 5:
                if (flags & 4) {
                    result = func_80027E38(team);
                } else {
                    result = func_80027E38(D_80080CFC[(s16)team]);
                }
                break;
        }
    }
    return result;
}
