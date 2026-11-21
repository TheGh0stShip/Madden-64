#include "types.h"

typedef struct {
    void *entries;
    void *blocks;
    void *flags;
    s32 handle;
    u32 count;
    s32 source;
} PoolBank;

extern PoolBank D_8008B078[];
void func_80036540(s32);
void *memory_pool_range_take(s32, u32);
s32 func_800365AC(s32, s32);
void func_80036628(s32, s32, s32);
void func_800365B8(s32, void *, u32);
void func_80033308(s32, void *, u32, s32);

u16 memory_block_update(s32 source, u32 size) {
    u16 i;

    func_80036540(0);
    for (i = 0; i < 0x10; i++) {
        if (D_8008B078[i].entries == 0) {
            break;
        }
    }
    D_8008B078[i].entries = memory_pool_range_take(0, size);
    D_8008B078[i].handle = func_800365AC(source, 1);
    func_80036628(D_8008B078[i].handle, 0, 0);
    func_800365B8(D_8008B078[i].handle, D_8008B078[i].entries, size);
    D_8008B078[i].count = size / 12;
    D_8008B078[i].blocks = memory_pool_range_take(0, D_8008B078[i].count * 4);
    D_8008B078[i].flags = memory_pool_range_take(0, D_8008B078[i].count);
    D_8008B078[i].source = source;
    func_80033308(0, D_8008B078[i].blocks, D_8008B078[i].count * 4, 0);
    func_80033308(0, D_8008B078[i].flags, D_8008B078[i].count, 0);
    return i;
}
