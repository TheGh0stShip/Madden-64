#include "types.h"

typedef struct {
    s32 x;
    s32 y;
    s32 z;
} Vec3;

typedef struct {
    u8 type;
    u8 hi;
    u8 lo;
    u8 x;
} Msg;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
    u8 pad18[4];
    s32 x;
    s32 y;
    s32 unk_24;
    u8 pad28[4];
    s32 unk_2C;
    s32 unk_30;
    s32 unk_34;
} Body;

typedef struct Obj {
    u8 pad00[0x24];
    Body *body;
    u8 pad28[4];
    s32 unk_2C;
    u8 pad30[0x60];
    s32 state;
} Obj;

typedef struct {
    s32 x;
    s32 y;
    s32 pad08[2];
} StartPosition;

typedef struct {
    void *unk_00;
    u8 pad04[0x54];
} Team;

typedef struct { s32 v; } Flags;
extern s32 D_80080C10;
extern u16 D_80080C14;
extern StartPosition D_80080C40[];
extern s32 D_80084F30;
extern s32 D_80084F34;
extern Team D_80085040[];
extern u32 D_800854A4;
extern s8 D_80085BFA;
extern Body *D_80086178;
extern s16 D_800869D6;
extern s8 D_80086DDC[];
extern s16 D_80086E28;
extern s16 D_80086E2A;
extern s16 D_80086E2C;
extern s16 D_800876E0;
extern s16 D_800876E2;
extern s16 D_800876E4;
extern u16 D_80087758;
extern s32 D_80088090;
extern s16 D_800886E0;
extern s16 D_80088AE4;
extern s16 D_80089320;
extern s32 D_800893A8;
extern s32 D_800893AC;
extern s16 D_800894FC;
extern u16 D_8008A5B2;

s32 func_8000C8EC(s32);
void func_8000EC8C(Body *, s16 *);
s16 func_8002098C(void);
void func_800311D0(void);
void func_8009BB00(void);
void func_800A365C(s32);
s16 func_800AE9A4(void);
s16 func_800B9208(Vec3 *);
void func_800BE1B0(void);
s32 func_800C0018(Obj *, s16, s32);
void func_800C0BBC(Obj *, s32);
void func_800C16A0(Obj *, s16);
void func_800C61E8(void *);
void func_800C6330(s32);
void func_800E1BAC(Obj *, Msg *);
void object_resource_prepare(Obj *, s32);
void runtime_limit_latch(void);
void status_overlay_enable(void);

s32 func_800A4B14(Obj *obj) {
    Vec3 delta;
    Vec3 target;
    Vec3 dest;
    s32 dx;
    s32 dy;
    s16 *pose;
    s32 flag;

    if (D_800854A4 == 0) {
        dest.x = target.x = D_80084F30;
        dest.y = target.y = D_80084F34;
    } else {
        target.x = D_800893A8;
        target.y = D_800893AC;
        if (func_8000C8EC(D_80088090) != 0) {
            dest.x = target.x - 0x140000;
        } else {
            dest.x = target.x + 0x140000;
        }
        dest.y = target.y;
    }
    switch (obj->state) {
    case 0:
        if (func_8002098C() == 1) {
            return 0;
        }
        delta.x = dest.x - obj->body->x;
        dx = delta.x;
        if (dx < 0) {
            dx = -dx;
        }
        delta.y = dest.y - obj->body->y;
        dy = delta.y;
        if (dy < 0) {
            dy = -dy;
        }
        if (dx < 0x80000 && dy < 0x80000) {
            if (D_80080C10 & 0x10000) {
                return 0;
            }
            obj->body->unk_2C = 0;
            obj->body->unk_30 = 0;
            if (D_80089320 == -1 && D_800894FC != 0) {
                return 0;
            }
            obj->state = 3;
            if (!(D_80080C10 & 0x10000000)) {
                Vec3 dir;

                dir.x = target.x - dest.x;
                dir.y = target.y - dest.y;
                func_800C16A0(obj, func_800B9208(&dir));
                func_800C0BBC(obj, 0x3D);
            } else {
                func_800C0BBC(obj, 0x41);
                obj->body->flags |= 0x40000;
            }
        } else {
            if (obj->unk_2C != 0x3C) {
                object_resource_prepare(obj, 0x3C);
            }
            func_800C0018(obj, func_800B9208(&delta), 0);
        }
        break;
    case 3:
        delta.x = dest.x - obj->body->x;
        dx = delta.x;
        if (dx < 0) {
            dx = -dx;
        }
        delta.y = dest.y - obj->body->y;
        dy = delta.y;
        if (dy < 0) {
            dy = -dy;
        }
        if (D_80089320 == -1 && D_800894FC != 0) {
            return 0;
        }
        if (D_80080C10 & 0x10000000) {
            if (!(D_80080C10 & 0x800)) {
                return 0;
            }
        }
        if (dx < 0x80000 && dy < 0x80000) {
            if (obj->body->flags & 0x40000) {
                func_800311D0();
                func_800C6330(1);
                D_80086178->x = target.x;
                D_80086178->y = target.y;
                D_80086178->unk_24 = 0;
                D_80086178->unk_2C = 0;
                D_80086178->unk_30 = 0;
                D_80086178->unk_34 = 0;
                if (D_80089320 == -1) {
                    D_800876E0 = 0xFF;
                } else {
                    D_800876E0 = 0x3FF;
                }
                pose = &D_800876E2;
                *pose = 0;
                D_800876E4 = 0;
                D_80086E28 = 0;
                D_80086E2A = 0;
                D_80086E2C = 0;
                D_80080C14 = 0;
                func_8000EC8C(D_80086178, pose - 1);
                obj->state = 4;
                if (D_800854A4 == 0) {
                    if (func_800AE9A4() == 0) {
                        runtime_limit_latch();
                    }
                    if (D_80085BFA == 2) {
                        status_overlay_enable();
                    }
                    if (D_80086DDC[D_80088AE4] == 1) {
                        D_800869D6 = D_80087758 - 3;
                    }
                    if (D_80080C10 & 0x100) {
                        if (D_80089320 == -1) {
                            flag = D_80080C10 & 4;
                        } else {
                            flag = D_80080C10 & 2;
                        }
                        if (flag) {
                            func_800BE1B0();
                        }
                        func_800A365C(3);
                    }
                    func_8009BB00();
                }
            }
        } else {
            obj->state = 0;
            object_resource_prepare(obj, 0x3C);
        }
        if (D_80080C10 & 0x10000000) {
            if (D_8008A5B2 == 1) {
                func_800C61E8(D_80085040[D_800886E0].unk_00);
                D_8008A5B2 = 1;
            }
        }
        break;
    case 4:
        if (!(obj->body->flags & 0x20000)) {
            if (D_800854A4 != 0) {
                Msg msg;

                msg.type = 0x35;
                D_80080C40[0].x = D_800893A8;
                D_80080C40[3].x = D_800893A8;
                func_800E1BAC(obj, &msg);
                object_resource_prepare(obj, 0x41);
            } else {
                object_resource_prepare(obj, 0x3C);
            }
            return 1;
        }
        break;
    }
    return 0;
}
