#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 flags;
    u8 pad18[4];
    s32 x;
} Model;

typedef struct {
    u8 pad00[0x24];
    Model *model;
    u16 flags;
    u8 pad2A[2];
    u32 anim;
    u8 pad30[0x34];
    u8 cmd[4];
    u8 pad68[0x24];
    s32 phase;
    u8 pad90[0xC];
    union {
        u32 word;
        u8 bytes[4];
    } next;
} Object;

extern s32 D_80080C10;
extern s32 D_80084F30;

u16 func_800C0BBC(Object *, u32);
u16 func_800C0D00(Object *, s32);
s32 func_800C16A0(void *, s32);

static inline u32 pack(s32 group, s32 hi, s32 lo) {
    return (hi << 8) | (lo | (group << 16));
}

static inline u16 start(Object *obj, u32 anim) {
    u8 group = anim >> 16;

    if (group == 0) {
        return func_800C0BBC(obj, anim);
    }
    return (func_800C0D00(obj, group) == 0) ? 3 : 0;
}

s32 func_800E4310(Object *obj) {
    s32 kind;
    u16 slot;

    if (obj->flags & 1) {
        return 1;
    }
    obj->next.word = (obj->cmd[1] << 8) | obj->cmd[2];
    if (obj->next.word == 7) {
        if (obj->model->x < D_80084F30) {
            obj->next.word = pack(0x2C, obj->cmd[1], obj->cmd[2]);
        } else {
            obj->next.word = pack(0x2B, obj->cmd[1], obj->cmd[2]);
        }
    } else if (obj->next.word == 0x15) {
        obj->next.word = 0x2D0015;
    }
    if (obj->next.word == obj->anim && (D_80080C10 & 0x800)) {
        kind = (obj->next.word >> 16) & 0xFF;
        if (kind >= 0x2B && kind <= 0x2C) {
            return 1;
        }
        if (kind == 0x2D) {
            return 1;
        }
    }
    kind = start(obj, obj->next.word);
    if (kind == 0) {
        obj->phase = 1;
        if (D_80080C10 & 0x4000) {
            obj->model->flags |= 0x10000;
        }
    } else {
        obj->phase = 0;
    }
    slot = obj->cmd[3];
    if ((u8)slot != 0xFF) {
        func_800C16A0(obj, slot << 5);
    }
    return 0;
}
