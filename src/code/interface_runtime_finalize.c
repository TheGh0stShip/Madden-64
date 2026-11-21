#include "types.h"

typedef struct {
    u8 pad0[0x16];
    s16 unk16;
} OwnerH1088;

typedef struct ObjectH1088 {
    struct ObjectH1088 *next;
    u8 pad4[4];
    OwnerH1088 *owner;
    u8 padC[8];
    s32 flags;
} ObjectH1088;

typedef struct {
    u8 pad0[0x18];
    s32 unk18;
    s32 unk1C;
    s32 unk20;
    u8 pad24[0x7E];
    s16 unkA2;
} EntryH1088;

typedef struct {
    u8 pad0[0x54];
} SourceH1088;

typedef struct {
    u8 pad0[0x30];
} VectorH1088;

typedef struct {
    u8 pad0[4];
    s16 unk4;
    s16 unk6;
    SourceH1088 sources[1];
} SourceListH1088;

typedef struct {
    u8 pad0[0xC];
    ObjectH1088 *head;
} ObjectListH1088;

typedef struct {
    u8 pad0[0xC];
    ObjectH1088 *head;
} NodeListH1088;

typedef struct {
    SourceListH1088 *unk0;
    ObjectListH1088 *unk4;
    NodeListH1088 *unk8;
    VectorH1088 *unkC;
    EntryH1088 *unk10;
    u8 pad14[2];
    u16 unk16;
    s8 unk18;
} ContextH1088;

typedef struct {
    u8 pad0[8];
    ContextH1088 *unk8;
} ArgH1088;

extern void func_800408C8(void *, EntryH1088 *);
extern void func_800409B8(ObjectH1088 *, EntryH1088 *);
extern void object_resource_update(ObjectH1088 *);
extern void integer_vectors_submit(ObjectH1088 *, EntryH1088 *, EntryH1088 *);
extern void resource_node_update(ObjectH1088 *);
extern void audio_vectors_transform(SourceH1088 *, EntryH1088 *, VectorH1088 *);

extern u16 D_8008A5B4;
extern u32 D_8008A754;
extern void *D_8008B654;

void interface_runtime_finalize(ArgH1088 *arg) {
    s32 unused[3];
    ContextH1088 *ctx;
    ObjectH1088 *object;
    s32 n;

    ctx = arg->unk8;
    object = ctx->unk4->head;
    n = ctx->unk0->unk4 + ctx->unk0->unk6;
    unused[0] = 0;
    unused[1] = 0;
    unused[2] = 0;
    while (n-- != 0) {
        if (object != 0) {
            if ((object->flags & 1) &&
                (ctx->unk10[n].unkA2 < ctx->unk10[n].unk18 || ctx->unk10[n].unkA2 < ctx->unk10[n].unk1C ||
                 ctx->unk10[n].unkA2 < ctx->unk10[n].unk20)) {
                func_800409B8(object, &ctx->unk10[n]);
                object_resource_update(object);
                integer_vectors_submit(object, ctx->unk10, &ctx->unk10[n]);
            }
            object = object->next;
        }
    }
    if (ctx->unk18 != 0) {
        for (D_8008A754 = D_8008A5B4 + D_8008A754; D_8008A754 >= 4; D_8008A754 -= 4) {
            for (object = ctx->unk8->head; object != 0; object = object->next) {
                if (object->owner->unk16 < ctx->unk16) {
                    resource_node_update(object);
                }
            }
            object = ctx->unk4->head;
            n = ctx->unk0->unk4 + ctx->unk0->unk6;
            while (n-- != 0) {
                audio_vectors_transform(&ctx->unk0->sources[n], &ctx->unk10[n], &ctx->unkC[n]);
                if (object != 0) {
                    object = object->next;
                }
            }
            ctx->unk16++;
            func_800408C8(D_8008B654, ctx->unk10);
        }
    }
}
