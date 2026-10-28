#include "types.h"

typedef struct {
    u8 data[0x84];
} Snapshot;

typedef struct {
    s16 ob[3];
    u16 flag;
    s16 tc[2];
    u8 cn[4];
} Vtx_t;

typedef struct {
    u8 unk00[6];
    u8 flags;
} Anim;

typedef struct {
    u8 unk00[0xC];
    s32 frames;
    u8 unk10[4];
    s32 table;
    s32 anim;
} ModelInfo;

typedef struct {
    ModelInfo *info;
    s32 unk04;
    s16 unk08;
    s16 unk0A;
    s16 unk0C;
    s16 unk0E;
    s16 unk10;
    u16 unk12;
    u8 unk14[4];
    s32 frames;
    s32 table;
    Anim *anim;
    u8 unk24[4];
    s32 timer;
    u8 unk2C[0xC];
    s32 pos[3];
    u8 unk44[4];
    s16 unk48;
    u8 unk4A[2];
    u8 *buf;
    u8 *buf_mid;
    u8 *buf_cur;
    s16 looping;
    u8 unk5A[6];
    u16 frame_value;
    u8 unk62[2];
    s32 unk64;
    u16 flags;
    u8 unk6A[6];
    void *source;
    s32 extra;
    s16 scale_x;
    s16 scale_y;
    Vtx_t *vtx;
    Vtx_t *vtx_mid;
} Model;

typedef struct {
    u8 unk00[8];
    Snapshot *snapshot;
    u8 unk0C[0xC];
    s32 frame;
} Source;

typedef struct {
    ModelInfo *info;
    s32 unk04;
    u16 unk08;
    u16 width;
    u16 height;
    u16 frame;
    u8 unk10[4];
    s32 unk14;
    s32 pos[3];
    u8 unk24[4];
    Source *source;
    s32 extra;
} Template;

typedef struct {
    u8 unk00[8];
    Model *model;
    u8 unk0C[8];
    s32 dirty;
    s32 frame;
    s32 pos[3];
    u8 unk28[4];
    s32 vel[3];
    u8 unk38[0x1C];
    u16 kind;
} Object;

extern s32 D_80065428;

void *func_80032E00(s32, s32);
void func_80033308(s32, void *, s32, s32);
void func_80033B20(Object *, s32);
void func_80034388(Object *, s32);
void func_800954E0(Object *);
s32 func_800969D8(s32);

void func_800998D0(Object *obj, Template *tmpl) {
    ModelInfo *tmpl_info;
    Model *model;
    Source *source;
    s32 size;
    s32 i;
    Vtx_t *buf;
    ModelInfo *info;
    u16 frame;
    u8 *p;
    s32 extra;

    model = obj->model;
    if (tmpl->source != 0) {
        source = tmpl->source;
        obj->frame = source->frame;
        obj->pos[0] = tmpl->pos[0];
        obj->pos[1] = tmpl->pos[1];
        obj->pos[2] = tmpl->pos[2];
        obj->vel[2] = 0;
        obj->vel[1] = 0;
        obj->vel[0] = 0;
        obj->dirty = 1;
        *(Snapshot *)model = *source->snapshot;
        model->source = source;
        model->flags |= 2;
    } else {
        tmpl_info = tmpl->info;
    info = tmpl_info;
        model->frames = info->frames;
        model->table = info->table;
        model->anim = (Anim *)(info->anim + 4);
        model->scale_x = 0x100;
        model->scale_y = 0x100;
        size = (tmpl->width * tmpl->height + 7) & ~7;
        p = (u8 *)(func_800969D8(size * 2) + D_80065428);
        model->buf = p;
        model->unk48 = 0;
        model->buf_mid = p + size;
        model->buf_cur = model->buf;
        frame = tmpl->frame;
        obj->frame = frame;
        model->frame_value = frame;
        obj->pos[0] = tmpl->pos[0];
        obj->pos[1] = tmpl->pos[1];
        obj->pos[2] = tmpl->pos[2];
        model->unk12 = tmpl->unk08;
        model->unk64 = tmpl->unk14;
        info = tmpl->info;
        model->unk04 = 0;
        model->info = info;
        func_80034388(obj, tmpl->unk04);
        func_80033B20(obj, 1);
        model->looping = 0;
        if (model->anim->flags & 0x40) {
            model->looping = 1;
        }
        model->unk08 = 0;
        model->unk0A = 0;
        model->unk0E = 0;
        model->flags = 0;
        model->unk10 = 0;
        model->timer = 0x800;
        model->pos[0] = *(s16 *)&tmpl->pos[0];
        model->pos[1] = *(s16 *)&tmpl->pos[1];
        model->pos[2] = *(s16 *)&tmpl->pos[2];
        obj->vel[2] = 0;
        obj->vel[1] = 0;
        obj->vel[0] = 0;
        obj->dirty = 1;
        model->source = 0;
        func_80033B20(obj, 1);
        model->frame_value = *(u16 *)(model->table + obj->frame * 0x10);
        func_800954E0(obj);
    }
    if (obj->kind == 0xB) {
        buf = func_80032E00(0, 0x80);
        model->vtx = buf;
        func_80033308(0, buf, 0x80, 0);
        model->vtx_mid = buf + 4;
        i = 7;
        do {
            buf[i].ob[2] = 0;
            buf[i].flag = 0;
            buf[i].cn[3] = 0xFF;
            buf[i].cn[2] = 0xFF;
            buf[i].cn[1] = 0xFF;
            buf[i].cn[0] = 0xFF;
        } while (i-- != 0);
    }
    extra = tmpl->extra;
    if (extra != 0) {
        model->extra = extra;
        model->flags |= 8;
    }
}
