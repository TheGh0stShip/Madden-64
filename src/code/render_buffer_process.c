#include "types.h"

typedef struct RenderInner {
    u8 pad00[8];
    void *buffer;
} RenderInner;

typedef struct RenderEntry {
    u8 pad00[8];
    RenderInner *inner;
} RenderEntry;

extern void *D_8008B7A0[64];
extern void *D_8008B8A0;
extern u8 func_80000410[];
typedef struct ShortBlock {
    u16 size;
    u8 pad02[4];
    u8 data[1];
} ShortBlock;

typedef struct LongBlock {
    u32 size;
    u8 pad04[4];
    u8 data[1];
} LongBlock;

extern void *D_800892CC;
extern ShortBlock *D_80086CA4;
extern LongBlock *D_80086C70;
extern void *D_800876D8;
extern void *D_8006551C;
extern void *D_80086DD8;
extern u8 D_800908B8[];
extern u8 D_80071C50;
extern s16 D_80071C48;
extern RenderEntry *D_80086CC8[];
extern void *D_80085158[];

extern void *memory_pool_range_take(s32 pool, u32 size);
extern s32 func_80035674(u8 *name);
extern s32 memory_block_update(u8 *name, s32 size);
extern void *memory_pool_prepare(u16 block, s32 index);
extern void memory_move_overlap(void *dst, void *src, s32 size);
extern void memory_pool_finalize(u16 block, s32 index);
extern void memory_block_process(u16 block);
extern void func_80016FE4(RenderEntry *entry);

void render_buffer_process(void)
{
    s32 loaded = 0;
    s16 i;
    u16 block;

    for (i = 0; i < 64; i++) {
        D_8008B7A0[i] = memory_pool_range_take(0, 0xA0);
    }
    D_8008B8A0 = memory_pool_range_take(0, 0x320);
    block = func_80035674(func_80000410);
    if (block == 0xFFFF) {
        block = memory_block_update(func_80000410, 0x2B8);
        loaded = 1;
    }
    D_80086CA4 = D_800892CC = memory_pool_prepare(block, 0x20);
    D_800876D8 = memory_pool_range_take(0, D_80086CA4->size - 6);
    memory_move_overlap(D_800876D8, D_80086CA4->data, D_80086CA4->size - 6);
    D_80086C70 = D_800892CC = memory_pool_prepare(block, 0x1F);
    D_8006551C = memory_pool_range_take(0, D_80086C70->size - 8);
    memory_move_overlap(D_8006551C, D_80086C70->data, D_80086C70->size - 8);
    memory_pool_finalize(block, 0x20);
    memory_pool_finalize(block, 0x1F);
    if (loaded) {
        memory_block_process(block);
    }
    if (D_80086DD8 == D_800908B8) {
        memory_move_overlap(D_80086CC8[D_80071C50]->inner->buffer,
                            D_80085158[(s16)(D_80071C48 + (D_80071C50 - 1) * 4)], 0x200);
        func_80016FE4(D_80086CC8[D_80071C50]);
        D_80071C48++;
        if (D_80071C48 >= 4) {
            D_80071C48 = 0;
        }
    }
}
