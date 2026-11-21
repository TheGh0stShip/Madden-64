#include "types.h"

typedef struct {
    u8 pad00[4];
    s32 pool;
    u8 pad08[0x14];
    s32 score[2];
    u8 pad24[0x20];
    s16 x44;
    s16 timer;
    u8 pad48[8];
    u16 side;
    u16 other;
    u16 mode;
    u16 state;
} Object;

u16 func_80031A1C(s32);
void func_800259E4(u16, s32, s32);
void func_800C61A4(Object *);
void func_800C6B4C(Object *);
s32 func_800C6EA0(Object *);
s16 func_800C708C(Object *);
s16 func_800C76A4(Object *);
void func_800C78AC(Object *);
void overlay5_object_meter_update(Object *);
void overlay5_object_randomize_update(Object *);

void func_800C7CC0(Object *obj) {
    s16 a;
    s16 b;
    s16 step;

    a = 0;
    obj->other = obj->side ^ 1;
    b = 0;
    switch (obj->state) {
    case 0:
        b = 12;
        step = 75 - func_80031A1C(20);
        obj->x44 -= step;
        if (obj->x44 < -50) {
            obj->x44 = -30;
            obj->mode = 5;
            obj->state = 1;
        } else {
            func_800C6B4C(obj);
        }
        break;
    case 1:
        a = func_800C708C(obj);
        break;
    case 2:
        a = func_800C76A4(obj);
        break;
    case 3:
        a = 7;
        b = 13;
        if (!(func_800C6EA0(obj) & 0x8000)) {
            func_800C6B4C(obj);
        }
        obj->mode = 5;
        obj->state = 1;
        break;
    case 4:
        a = 10;
        func_800C78AC(obj);
        break;
    case 5:
        a = 10;
        overlay5_object_randomize_update(obj);
        func_800C61A4(obj);
        break;
    case 6:
        a = 20;
        overlay5_object_meter_update(obj);
        func_800C61A4(obj);
        break;
    }
    if (a != 0) {
        a -= func_80031A1C(10) - 5;
    }
    if (b != 0) {
        b -= func_80031A1C(10) - 5;
    }
    obj->pool = obj->pool - a - b;
    obj->score[obj->side] += a;
    obj->score[obj->other] += b;
    if (obj->pool < 0) {
        obj->score[obj->side] += obj->pool;
    }
    if (obj->timer <= 0 && obj->mode < 6) {
        if (obj->mode == 4) {
            func_800259E4(obj->side, 5, 1);
        }
        if (obj->mode == 5) {
            func_800259E4(obj->side, 7, 1);
        }
        obj->mode = 1;
        obj->timer = 10;
        func_800259E4(obj->side, 12, 1);
    }
}
