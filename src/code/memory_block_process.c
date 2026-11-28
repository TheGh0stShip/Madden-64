#include "types.h"

extern u8 D_8008B078[];
extern void func_80036540(s32);
extern void func_80035F88(u16, void *);
extern void func_80036620(s32);
extern void func_80032F3C(s32, void *);
extern void func_80033308(s32, void *, s32, s32);

#define ENTRY(offset, field, type) (*(type *)(D_8008B078 + (offset) + (field)))

u16 memory_block_process(u32 handle)
{
    u16 index = handle;
    u32 offset;
    s32 count;

    func_80036540(0);
    switch (handle & 0xC000) {
    case 0x8000: {
        index = handle & 0x7FFF;
        offset = index * 24;
        if (ENTRY(offset, 0, void *) != 0) {
            u32 other = ENTRY(offset, 12, s32) * 24;
            u8 *flag = ENTRY(other, 8, u8 *) + (s32)ENTRY(offset, 8, u8 *);
            *flag &= ~0x10;
            func_80035F88(ENTRY(offset, 14, u16), ENTRY(offset, 8, void *));
            func_80033308(0, D_8008B078 + offset, 24, 0);
        }
        break;
    }
    case 0x4000: {
        index = handle & 0xBFFF;
        offset = index * 24;
        if (ENTRY(offset, 0, void *) != 0) {
            func_80036620(ENTRY(offset, 12, s32));
            func_80033308(0, D_8008B078 + offset, 24, 0);
        }
        break;
    }
    default: {
        u32 default_offset;
        default_offset = index * 24;
        if (ENTRY(default_offset, 0, void *) != 0) {
            func_80036620(ENTRY(default_offset, 12, s32));
            count = ENTRY(default_offset, 16, s32);
            {
                if (count-- != 0) {
                u32 loop_offset;
                loop_offset = default_offset;
                do {
                void **items;
                items = ENTRY(loop_offset, 4, void **);
                if (items[count] != 0) {
                    if (ENTRY(loop_offset, 8, u8 *)[count] & 0x20) {
                        items[count] = 0;
                    } else {
                        func_80032F3C(0, items[count]);
                        ENTRY(loop_offset, 4, void **)[count] = 0;
                    }
                }
            } while (count-- != 0);
                }
            }
            offset = index << 1;
            offset += index;
            offset <<= 3;
            func_80032F3C(0, ENTRY(offset, 0, void *));
            func_80032F3C(0, ENTRY(offset, 4, void *));
            func_80032F3C(0, ENTRY(offset, 8, void *));
            func_80033308(0, D_8008B078 + offset, 24, 0);
        }
            break;
    }
    }
    return index;
}
