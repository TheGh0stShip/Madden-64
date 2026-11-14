#include "types.h"

typedef struct ValueEntry {
    u32 first;
    u32 value;
} ValueEntry;

typedef struct ValueList {
    u32 count;
} ValueList;

typedef struct ValueOwner {
    u8 pad00[0xC];
    ValueList *list;
} ValueOwner;

typedef struct BlockRecord {
    u8 pad00[4];
    ValueOwner *owner;
    u32 type;
    u8 pad0C;
    u8 marker;
    u8 pad0E[6];
} BlockRecord;

extern u8 D_800724DA;
extern BlockRecord *D_800724DC;
extern ValueOwner *D_80088630;

extern void func_80034FD8(void);

u16 memory_block_finalize(u32 selector, u16 *output)
{
    u16 *saved_output = output;
    u32 saved_selector = selector;
    ValueList *list;
    u16 inner;
    u16 outer;
    u16 result_count = 0;

    func_80034FD8();
    outer = 0;
    if (D_800724DA != 0) {
        do {
            BlockRecord *record = (BlockRecord *)(outer * sizeof(BlockRecord) +
                                                   (u32)D_800724DC);
            if (record->type == 2 && record->marker != 0xFF) {
                list = record->owner->list;
                inner = 0;
                if (inner < list->count) {
                    do {
                        u8 *entry = (u8 *)list;
                        u32 value;
                        entry += inner * 8;
                        value = *(u32 *)(entry + 4);
                        if (((value & 0xFF0000) >> 16) == (saved_selector & 0xFF)) {
                            saved_output[result_count] = value;
                            result_count++;
                        }
                        inner++;
                    } while (inner < list->count);
                }
            }
            outer++;
        } while (outer < D_800724DA);
    }

    {
        list = D_80088630->list;
        inner = 0;
        if (inner < list->count) {
            do {
                u8 *entry = (u8 *)list;
                u32 value;
                entry += inner * 8;
                value = *(u32 *)(entry + 4);
                if (((value & 0xFF0000) >> 16) == (saved_selector & 0xFF)) {
                    saved_output[result_count] = value;
                    result_count++;
                }
                inner++;
            } while (inner < list->count);
        }
    }
    return result_count;
}
