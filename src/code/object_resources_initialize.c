#include "types.h"

typedef struct {
    s16 ob[3];
    u16 flag;
    s16 tc[2];
    u8 cn[4];
} ObjectVtx;

typedef struct {
    u16 unk_00;
    u16 unk_02;
    u16 unk_04;
    u16 unk_06;
    u8 unk_08;
    u8 unk_09;
    u8 unk_0A[2];
    u16 *unk_0C;
    void *unk_10;
    u8 unk_14;
    u8 unk_15;
} ObjectResources;

typedef struct {
    u8 unk_00[0x8];
    ObjectResources *unk_08;
    u8 unk_0C[0x10];
    s32 unk_1C;
    s32 unk_20;
    s32 unk_24;
} Object;

typedef struct {
    u16 unk_00;
    u16 unk_02;
    u16 unk_04;
    u8 unk_06;
    u8 unk_07;
} ObjectResourceDesc;

extern ObjectVtx *D_80065460;
extern void *D_8006545C;

void *memory_pool_range_take(s32, u32);
void func_80033308(s32, void *, u32, s32);
u8 *memory_pool_prepare(u16, u16);
void memory_move_overlap(void *, void *, u32);
void memory_pool_finalize(u16, u16);

void object_resources_initialize(Object *object, ObjectResourceDesc *desc) {
    ObjectResources *res = object->unk_08;
    u8 *pool;
    u16 i;
    u16 n;
    u16 v;
    u16 *bits;
    ObjectVtx *vtx;

    if ((desc->unk_06 & ~0x80) == 0) {
        D_80065460 = memory_pool_range_take(0, 0x320);
    }
    if ((u32)((desc->unk_06 & ~0x80) - 1) < 2) {
        D_8006545C = memory_pool_range_take(0, 0x800);
        func_80033308(0, D_8006545C, 0x800, 0);
    }
    func_80033308(0, res, 0x18, 0);
    res->unk_08 = desc->unk_06;
    pool = memory_pool_prepare(desc->unk_00, desc->unk_04);
    res->unk_0C = memory_pool_range_take(0, *(u16 *)pool - 6);
    memory_move_overlap(res->unk_0C, pool + 6, *(u16 *)pool - 6);
    bits = res->unk_0C;
    for (i = 0; i < 16; i++) {
        bits[i] |= 1;
    }
    bits[0] &= ~1;
    bits[10] &= ~1;
    pool = memory_pool_prepare(desc->unk_00, desc->unk_02);
    res->unk_00 = *(u16 *)(pool + 4);
    res->unk_02 = *(u16 *)(pool + 6);
    n = 0;
    v = *(u16 *)(pool + 4);
    if (v != 0) {
        while (1) {
            v >>= 1;
            if (v == 0) {
                break;
            }
            n++;
        }
    }
    res->unk_04 = n;
    n = 0;
    v = *(u16 *)(pool + 6);
    if (v != 0) {
        while (1) {
            v >>= 1;
            if (v == 0) {
                break;
            }
            n++;
        }
    }
    res->unk_06 = n;
    res->unk_10 = memory_pool_range_take(0, *(u32 *)pool - 8);
    memory_move_overlap(res->unk_10, pool + 8, *(u32 *)pool - 8);
    res->unk_09 = desc->unk_07;
    res->unk_14 = 0;
    res->unk_15 = 0;
    object->unk_24 = 0;
    object->unk_20 = 0;
    object->unk_1C = 0;
    memory_pool_finalize(desc->unk_00, desc->unk_04);
    memory_pool_finalize(desc->unk_00, desc->unk_02);
    if ((res->unk_08 & 0x7F) == 0) {
        vtx = D_80065460;
        vtx[0].ob[0] = 0;
        vtx[0].ob[1] = -8000;
        vtx[0].ob[2] = -2200;
        vtx[0].cn[0] = 0;
        vtx[0].cn[1] = 0;
        vtx[0].cn[2] = 0x7F;
        vtx[1].ob[0] = 8000;
        vtx[1].ob[1] = -8000;
        vtx[1].ob[2] = -2200;
        vtx[1].cn[0] = 0;
        vtx[1].cn[1] = 0;
        vtx[1].cn[2] = 0x7F;
        vtx[2].ob[0] = 0;
        vtx[2].ob[1] = 0;
        vtx[2].ob[2] = -2200;
        vtx[2].cn[0] = 0;
        vtx[2].cn[1] = 0;
        vtx[2].cn[2] = 0x7F;
        vtx[3].ob[0] = 8000;
        vtx[3].ob[1] = 0;
        vtx[3].ob[2] = -2200;
        vtx[3].cn[0] = 0;
        vtx[3].cn[1] = 0;
        vtx[3].cn[2] = 0x7F;
        vtx[4].ob[0] = -8000;
        vtx[4].ob[1] = -8000;
        vtx[4].ob[2] = -2200;
        vtx[4].cn[0] = 0;
        vtx[4].cn[1] = 0;
        vtx[4].cn[2] = 0x7F;
        vtx[5].ob[0] = 0;
        vtx[5].ob[1] = -8000;
        vtx[5].ob[2] = -2200;
        vtx[5].cn[0] = 0;
        vtx[5].cn[1] = 0;
        vtx[5].cn[2] = 0x7F;
        vtx[6].ob[0] = -8000;
        vtx[6].ob[1] = 0;
        vtx[6].ob[2] = -2200;
        vtx[6].cn[0] = 0;
        vtx[6].cn[1] = 0;
        vtx[6].cn[2] = 0x7F;
        vtx[7].ob[0] = 0;
        vtx[7].ob[1] = 0;
        vtx[7].ob[2] = -2200;
        vtx[7].cn[0] = 0;
        vtx[7].cn[1] = 0;
        vtx[7].cn[2] = 0x7F;
        vtx[8].ob[0] = -8000;
        vtx[8].ob[1] = 0;
        vtx[8].ob[2] = -2200;
        vtx[8].cn[0] = 0;
        vtx[8].cn[1] = 0;
        vtx[8].cn[2] = 0x7F;
        vtx[9].ob[0] = 0;
        vtx[9].ob[1] = 0;
        vtx[9].ob[2] = -2200;
        vtx[9].cn[0] = 0;
        vtx[9].cn[1] = 0;
        vtx[9].cn[2] = 0x7F;
        vtx[10].ob[0] = -8000;
        vtx[10].ob[1] = 8000;
        vtx[10].ob[2] = -2200;
        vtx[10].cn[0] = 0;
        vtx[10].cn[1] = 0;
        vtx[10].cn[2] = 0x7F;
        vtx[11].ob[0] = 0;
        vtx[11].ob[1] = 8000;
        vtx[11].ob[2] = -2200;
        vtx[11].cn[0] = 0;
        vtx[11].cn[1] = 0;
        vtx[11].cn[2] = 0x7F;
        vtx[12].ob[0] = 0;
        vtx[12].ob[1] = 0;
        vtx[12].ob[2] = -2200;
        vtx[12].cn[0] = 0;
        vtx[12].cn[1] = 0;
        vtx[12].cn[2] = 0x7F;
        vtx[13].ob[0] = 8000;
        vtx[13].ob[1] = 0;
        vtx[13].ob[2] = -2200;
        vtx[13].cn[0] = 0;
        vtx[13].cn[1] = 0;
        vtx[13].cn[2] = 0x7F;
        vtx[14].ob[0] = 0;
        vtx[14].ob[1] = 8000;
        vtx[14].ob[2] = -2200;
        vtx[14].cn[0] = 0;
        vtx[14].cn[1] = 0;
        vtx[14].cn[2] = 0x7F;
        vtx[15].ob[0] = 8000;
        vtx[15].ob[1] = 8000;
        vtx[15].ob[2] = -2200;
        vtx[15].cn[0] = 0;
        vtx[15].cn[1] = 0;
        vtx[15].cn[2] = 0x7F;
    }
}
