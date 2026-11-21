#include "types.h"

typedef struct {
    s16 count;
    u8 pad02[2];
    void *values;
    s32 field08;
    u8 pad0C[4];
    s16 field10;
} Request;

typedef struct {
    void *resource;
    s16 unk04;
    u8 unk06;
    u8 unk07;
} DispatchRequest;

typedef struct {
    u8 pad00[0x14];
    s32 unk14;
    u8 pad18[4];
    s32 unk1C;
    s32 unk20;
} Resource;

typedef struct {
    u8 unk00;
    u8 unk01;
    u8 unk02;
    u8 pad03;
    s32 unk04;
    s32 unk08;
    s32 unk0C;
    u8 unk10;
    u8 unk11;
    u8 unk12;
    u8 pad13;
    s32 unk14;
    u8 unk18;
    u8 unk19;
    u8 pad1A[2];
    s32 unk1C;
    s16 unk20;
    u16 unk22;
    u16 unk24;
    u8 unk26;
    u8 unk27;
} Descriptor;

typedef struct {
    u8 pad00[4];
    s32 unk04;
    u16 unk08;
    u16 unk0A;
    u8 unk0C;
    u8 unk0D;
    u8 pad0E[2];
    s32 unk10;
    u8 pad14[4];
    u16 unk18;
    u16 unk1A;
    u8 pad1C;
    u8 unk1D;
    u8 unk1E;
    u8 pad1F;
    s32 unk20;
    s32 unk24;
    s32 unk28;
    u8 unk2C;
    u8 unk2D;
    u8 unk2E;
    u8 pad2F;
    u8 pad30;
    u8 unk31;
    u8 pad32[0x3C - 0x32];
    void *unk3C;
    s32 unk40;
    Resource *unk44;
    Resource *unk48;
    void *unk4C;
} Record;

typedef struct {
    u8 pad00[0x24];
    s32 unk24;
    Resource *unk28;
    s32 unk2C;
    s32 unk30;
    s32 unk34;
    Resource *unk38;
    u8 pad3C[0x74 - 0x3C];
    u8 unk74[1];
} Owner;

extern void *D_80087AA8;
extern s32 func_800DD634(void);
extern Record *func_80032E00(s32, s32);
extern void overlay5_resource_record_initialize(Record *, u8, u8, u8);
extern Resource *func_8000D740(void *owner, s32 count, Request *request);
extern s32 func_800E06C4(s32, Record *);
extern void overlay5_runtime_object_replace(s32);
extern void overlay5_runtime_optional_resource_dispatch(DispatchRequest *);

s32 func_800D6060(s32 id, Descriptor *desc, Owner *owner) {
    Request request;
    DispatchRequest dispatch;
    Record *record;
    Resource *resource;
    Resource *extra;
    s32 state;
    s32 object;
    s32 excess;

    state = func_800DD634();
    record = func_80032E00(0, 0x50);
    overlay5_resource_record_initialize(record, desc->unk00, desc->unk02, desc->unk01);
    record->unk31 = desc->unk10;
    resource = (Resource *)owner->unk74;
    if (desc->unk11 != 0) {
        record->unk0A = desc->unk11;
        record->unk0D = 0;
        excess = record->unk0A + record->unk0C - record->unk08;
        if (excess > 0) {
            record->unk0A -= excess;
            record->unk0D += excess;
        }
    }
    record->unk2E = desc->unk12;
    record->unk04 = desc->unk14;
    record->unk20 = desc->unk0C;
    record->unk24 = desc->unk04;
    record->unk28 = desc->unk08;
    record->unk2D = desc->unk18;
    record->unk2C = desc->unk19;
    record->unk10 = desc->unk1C;
    record->unk48 = 0;
    if (desc->unk20 == 1) {
        record->unk18 = desc->unk22;
        record->unk1A = desc->unk24;
        record->unk1D = desc->unk26;
        record->unk1E = desc->unk27;
    }
    request.count = id;
    request.values = resource;
    request.field08 = 0;
    request.field10 = 7;
    resource = func_8000D740(D_80087AA8, 1, &request);
    owner->unk28 = resource;
    resource->unk1C = owner->unk2C;
    resource->unk20 = owner->unk30;
    if (desc->unk14 != 0) {
        request.count = owner->unk34;
        request.values = 0;
        request.field08 = 0;
        request.field10 = 6;
        extra = func_8000D740(D_80087AA8, 1, &request);
        extra->unk14 &= ~1;
        owner->unk38 = extra;
        record->unk48 = extra;
    } else {
        owner->unk38 = 0;
    }
    record->unk4C = owner;
    record->unk44 = resource;
    record->unk3C = owner->unk74;
    record->unk40 = state;
    object = func_800E06C4(1, record);
    overlay5_runtime_object_replace(object);
    owner->unk24 = object;
    dispatch.resource = resource;
    resource->unk20 = owner->unk30;
    dispatch.unk06 = 3;
    dispatch.unk04 = 0;
    dispatch.unk07 = 10;
    overlay5_runtime_optional_resource_dispatch(&dispatch);
    return object;
}
