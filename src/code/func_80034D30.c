#include "types.h"

typedef struct {
    s32 unk0;
    s32 unk4;
    s32 unk8;
    u8 unkC;
    u8 unkD;
    u8 padE[2];
    s32 unk10;
} Entry34D30;

extern u16 func_800349FC(s32 value, s16 *index);
extern s16 func_80034CB4(u16 value, u16 mode);
extern u16 func_80035598(u16 value, u16 type);
extern void func_800363F4(u16 value, u16 type, s32 entry_value);
extern void func_80036464(s32 mode, s32 *value);

extern Entry34D30 *D_800724DC;
extern s32 D_80088620;
extern u16 D_800892FC;

s32 func_80034D30(s32 arg0, u16 arg1) {
    s16 index;
    s16 previous;
    u16 result;
    u16 type;
    Entry34D30 *entry;
    u32 address;

    result = func_800349FC(arg0, &index);
    previous = index;
    if (previous == -1) {
        type = (u32)(arg0 & 0xFF00) >> 8;
        index = func_80034CB4(func_80035598(D_800892FC, type), arg1);
        if (index == previous) {
            return 0;
        }

        address = index * sizeof(Entry34D30) + (u32)D_800724DC;
        entry = (Entry34D30 *)address;
        entry->unkD = type;
        entry->unk8 = 1;
        D_800724DC[index].unk10 = D_80088620;
        func_80036464(3, &D_800724DC[index].unk8);
        func_800363F4(D_800892FC, type, D_800724DC[index].unk4);
        return 1;
    }
    return result;
}
