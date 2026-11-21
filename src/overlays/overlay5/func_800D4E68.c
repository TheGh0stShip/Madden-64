#include "types.h"

typedef struct {
    u8 pos;
    u8 pad[0x27];
} Player;

typedef struct {
    u16 slot[0x3E];
    Player players[0x20];
    u8 pad[0x214C - 0x7C - 0x20 * 0x28];
} TeamData;

typedef struct {
    s8 unk_00;
    u8 pad[7];
} ItemD4E68;

typedef struct {
    u8 pad00[0xC];
    ItemD4E68 items[1];
} ListD4E68;

typedef struct {
    u8 pad00[0xE];
    u8 unk_0E;
} LabelD4E68;

extern s32 func_80022AD8(u16 group, u16 id);
extern u8 func_80024B90(u16 id);
extern s16 func_80028A58(u16 id);
extern LabelD4E68 *func_8003AA28(u16 value);
extern s16 func_8003E388(s16, s16);
extern s16 func_8003FC94(s16, s16);
extern s32 func_800D3DD4(s16, ItemD4E68 *, s16, s32);
extern s16 func_800D4994(s16, s32);
extern s16 func_800D4A90(s16, u8);
extern TeamData D_80080CFC[];

s32 func_800D4E68(s16 team, s16 slot, s32 flags, s32 arg3, u8 *arg4, s32 arg5) {
    LabelD4E68 *label;
    s16 i;
    s16 id;

    if ((flags & 0x08000000) && arg4[(s16)slot] != 0) {
        return 0;
    }
    if (flags & 4) {
        id = func_80024B90(slot);
        if (id == 0xFF) {
            if (!(flags & 0x04000010)) {
                goto fail;
            }
        } else if (func_800D4994(func_80028A58(id), flags) == 0) {
            goto fail;
        }
    }
    if (flags & 0x20000) {
        ListD4E68 *list;

        if (!(flags & 4)) {
            if (D_80080CFC[(s16)team].slot[(s16)slot] == 0xFFFF) {
                return 0;
            }
        }
        list = (ListD4E68 *)arg3;
        for (i = 0; list->items[i].unk_00 != -1; i++) {
            if (func_800D3DD4(slot, &list->items[i], team, flags) != 0) {
                return 1;
            }
        }
        return 0;
    }
    if ((flags & 0x40000) && (arg3 & 0x40000)) {
        return (D_80080CFC[(s16)team].players[(s16)slot].pos & 0x3F) == (arg3 & 0xFF);
    }
    if (flags & 0x80000) {
        label = func_8003AA28(slot);
        if (arg3 == 0x17 || arg3 == 0x18) {
            if (arg3 == 0x18) {
                if (label->unk_0E & 0x40) {
                    return 1;
                }
            }
            if (arg3 != 0x17) {
                goto fail;
            }
            goto check;
        }
        return (label->unk_0E & 0x3F) == arg3;
    }
    if (flags & 0x200000) {
        if (func_8003FC94(team, slot) == 0) {
            return 0;
        }
    }
    if (flags & 0x800000) {
        if (func_8003E388(team, slot) == 0) {
            return 0;
        }
    }
    if (flags & 0x01000000) {
        if (func_8003E388(team, slot) == 1) {
            return 0;
        }
    }
    if (flags & 0x400000) {
        return func_800D4A90(arg3, func_80022AD8(team, slot) & 0x3F) != 0;
    }
    if (flags & 0x10000000) {
        label = func_8003AA28(slot);
        if (arg5 == 0x17 || arg5 == 0x18) {
            if (arg5 == 0x18) {
                if (label->unk_0E & 0x40) {
                    return 1;
                }
            }
            if (arg5 != 0x17) {
                return 0;
            }
check:
            if (label->unk_0E & 0x80) {
                return 1;
            }
fail:
            return 0;
        }
        return (label->unk_0E & 0x3F) == arg5;
    }
    if (flags & 4) {
        return 1;
    }
    return D_80080CFC[(s16)team].slot[(s16)slot] != 0xFFFF;
}
