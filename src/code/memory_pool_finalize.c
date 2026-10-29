#include "types.h"

typedef struct {
    s32 offset;
    s32 size;
    s32 pad08;
} PoolEntry;

typedef struct {
    PoolEntry *entries;
    void **blocks;
    u8 *flags;
    u8 pad0C[0x18 - 0xC];
} PoolBank;

extern PoolBank D_8008B078[];
extern void func_800369A0(u16 id, s32 index);
extern void func_80035A7C(u16 id);
extern void func_80032F3C(s32 pool, void *block);

void memory_pool_finalize(u16 id, s32 index) {
    u16 bank;

    if (id & 0x8000) {
        return;
    }
    func_800369A0(id, index);
    if (D_8008B078[id].blocks[index] == 0) {
        return;
    }
    if (D_8008B078[id].flags[index] & 0x10) {
        bank = 15;
        do {
            if ((void *)D_8008B078[bank].entries == D_8008B078[id].blocks[index]) {
                func_80035A7C(bank | 0x8000);
                return;
            }
        } while (bank-- != 0);
    }
    if (!(D_8008B078[id].flags[index] & 0x20)) {
        func_80032F3C(0, D_8008B078[id].blocks[index]);
    }
    D_8008B078[id].blocks[index] = 0;
    D_8008B078[id].flags[index] = 0;
}
