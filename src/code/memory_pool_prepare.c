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
extern u8 D_800712F8;
extern s32 D_8007A500;
extern void *func_8003647C(u16 id);
extern void func_80036540(s32 arg0);
extern void func_800369A0(u16 id, s32 index);
extern void *func_80032E00(s32 pool, s32 size);
extern void func_8003663C(u16 id, s32 index, s32 size);

void *memory_pool_prepare(u16 id, s32 index) {
    void *block;
    void *result;
    s32 size;

    if (D_800712F8 != 0 && D_8007A500 == 0) {
        block = func_8003647C(id);
        func_80036540(0);
        return block;
    }
    if (id & 0x8000) {
        size = D_8008B078[id & 0x7FFF].entries[index].offset;
        return (void *)(size + (s32)D_8008B078[id & 0x7FFF].entries);
    }
    func_800369A0(id, index);
    result = D_8008B078[id].blocks[index];
    if (result == 0) {
        D_8008B078[id].flags[index] &= 0x7F;
        size = D_8008B078[id].entries[index].size;
        D_8008B078[id].blocks[index] = func_80032E00(0, size);
        func_8003663C(id, index, size);
        result = D_8008B078[id].blocks[index];
    }
    return result;
}
