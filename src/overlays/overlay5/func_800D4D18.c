#include "types.h"

typedef struct {
    s8 kind;
    u8 first;
    u8 second;
} Query;

typedef struct {
    s8 unk0;
    s8 unk1;
    s8 unk2;
    u8 pad3[7];
    s16 unkA;
    s16 unkC;
} Entry14;

extern u16 D_8006B9E4[];

s16 func_800241A0(u16, u8);
s16 func_80024504(u16, u8, u8);
s32 func_800245B8(u16, u8, u8);
Entry14 *func_8008DBEC(s16);

s32 func_800D4D18(s16 index, s32 flags, s32 arg) {
    Query *query;
    Entry14 *entry;
    u16 context;
    s32 result;

    context = D_8006B9E4[index];
    result = 0;
    if (flags & 0x02000000) {
        query = (Query *)arg;
        switch (query->kind) {
        case 0:
        case 3:
            result = func_800241A0(context, query->first);
            break;
        case 1:
        case 6:
            result = func_80024504(context, query->first, query->second);
            break;
        case 2:
            result = func_800245B8(context, query->first, query->second);
            break;
        case 4:
            result = query->first;
            break;
        }
    } else {
        entry = func_8008DBEC(index);
        switch (arg) {
        case 0:
            result = entry->unk0 - entry->unk1 + entry->unk2 / 2;
            break;
        case 1:
            result = entry->unk1;
            break;
        case 2:
            result = entry->unk2;
            break;
        case 3:
            result = entry->unkA;
            break;
        case 4:
            result = entry->unkC;
            break;
        }
    }
    return result;
}
