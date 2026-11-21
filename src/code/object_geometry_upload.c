#include "types.h"

typedef struct {
    u8 unk_00[0x100];
} Unk_GeomBlock;

typedef struct {
    u8 unk_00[4];
    u16 unk_04;
    u8 unk_06[0x12];
    u32 unk_18;
} Unk_GeomRes;

typedef struct {
    u16 unk_00;
    u16 unk_02;
    Unk_GeomRes *unk_04;
    u8 unk_08[4];
    s32 unk_0C;
    s32 unk_10;
    u8 unk_14[0x94];
    u16 unk_A8;
    u8 unk_AA[0x1A];
    s32 unk_C4;
    s32 unk_C8;
    s32 unk_CC;
} Unk_GeomObj;

typedef struct {
    u8 unk_00[8];
    Unk_GeomBlock *unk_08;
} Unk_GeomSrc;

typedef struct {
    u16 unk_00;
    u16 unk_02;
    u8 unk_04[8];
    s32 unk_0C;
    Unk_GeomSrc *unk_10;
} Unk_GeomDesc;

typedef struct {
    u8 unk_00[8];
    Unk_GeomObj *unk_08;
} Unk_GeomOwner;

extern void func_80033308(s32 pool, void *destination, u32 size, s32 offset);
Unk_GeomRes *resource_tnmf_resolve(Unk_GeomDesc *desc);
extern u32 memory_pool_range_take(s32 pool, u32 size);
void memory_move_overlap(u32 dst, u32 src, s32 size);

void object_geometry_upload(Unk_GeomOwner *owner, Unk_GeomDesc *desc) {
    Unk_GeomObj *obj = owner->unk_08;

    if (desc->unk_10) {
        *(Unk_GeomBlock *)obj = *desc->unk_10->unk_08;
        obj->unk_A8 |= 2;
    } else {
        func_80033308(0, obj, 0x100, 0);
        obj->unk_04 = resource_tnmf_resolve(desc);
        obj->unk_00 = desc->unk_00;
        obj->unk_02 = desc->unk_02;
    }
    obj->unk_C4 = 0x26666;
    obj->unk_C8 = 0x26666;
    obj->unk_CC = 0x26666;
    if (obj->unk_04->unk_04 & 4) {
        obj->unk_10 = desc->unk_0C;
    }
    if (obj->unk_04->unk_04 & 8) {
        if (obj->unk_04->unk_18 < (u32)obj->unk_04) {
            obj->unk_04->unk_18 = (u32)obj->unk_04 + obj->unk_04->unk_18;
        }
        obj->unk_0C = memory_pool_range_take(0, 0x200);
        memory_move_overlap(obj->unk_0C, obj->unk_04->unk_18, 0x200);
    }
}
