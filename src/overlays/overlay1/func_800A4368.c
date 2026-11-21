#include "types.h"

typedef struct {
    s32 x;
    s32 y;
    s32 z;
    s32 w;
} Vec4;

typedef struct {
    u8 pad00[0x14];
    u16 unk_14;
} Anim;

typedef struct {
    u8 pad00[8];
    Anim *anim;
    u8 pad0C[8];
    s32 flags;
    u8 pad18[4];
    Vec4 pos;
    s32 vx;
    s32 vy;
} Node;

typedef struct {
    u8 pad00[0x24];
    Node *node;
    u16 unk_28;
    u8 pad2A[2];
    s32 state;
    u8 pad30[0x5C];
    s32 mode;
    u8 pad90[0xC];
    s32 timer;
    u8 padA0[0x10];
} Obj;

typedef struct {
    u8 unk_00;
    u8 pad01[0xAF];
} Lineup;

typedef struct {
    s32 x;
    s32 y;
    u8 pad08[8];
} Spot;

typedef struct {
    Node *a;
    Node *b;
} Request;

typedef struct {
    u8 pad00[4];
    u8 *unk_04;
    u8 pad08[8];
    s16 unk_10;
} State;

typedef struct {
    u8 pad00[0xC];
    Node *unk_0C;
    u8 pad10[0x74];
    u16 unk_84;
} Front;

extern s32 D_8007A07C;
extern s32 D_8007A080;
extern Spot D_80080C40[];
extern s32 D_800854A4;
extern Node *D_80086178;
extern Front D_80086CE8;
extern Obj D_80087138[];
extern Lineup D_8008719C[];
extern Node *D_8008741C;
extern s32 D_80087424;
extern Node *D_8008762C;
extern s32 D_800878E4;
extern s32 D_8008793C;
extern s32 D_80087950;
extern s32 D_80087A64;
typedef struct {
    s32 unk_00;
    s32 unk_04;
    s32 unk_08;
} ModeState;
extern ModeState D_80087FA4;
extern s32 D_80088090;
extern u16 D_800880C4;
extern s8 D_80088636;
extern s32 D_800893A8;
extern s32 D_800893AC;
extern void *D_8008A058;
extern u16 D_8008A5B2;
extern u16 D_8008A5B4;

s32 func_8000C8EC(s32 handle);
s32 func_8000D740(s32, s32, Request *);
State *func_800209AC(void);
void func_8009F1DC(Vec4 at, s32 a, s32 b, s32 c, s32 d);
void func_800A2834(void);
void func_800A2BAC(s32);
void func_800A365C(s32 mode);
void func_800A3704(s32, Node *, s32);
u8 func_800A6580(void);
void func_800A6590(Front *object, s32 value);
s32 func_800B7DD8(s32, s32, s32, s32, s32);
s16 func_800B9208(Vec4 *);
s32 func_800C0018(Obj *, s16, s32);
u16 func_800C0BBC(Obj *, s32);
void func_800C0C8C(Obj *, s32);
void func_800C16A0(Obj *, s32);
void func_800C62A8(Obj *);
u16 func_800E0E24(void);
void func_800E1BAC(Obj *, u8 *);
void func_800E1BCC(Obj *, u8 *);

s32 func_800A4368(Obj *obj) {
    u8 cmd[8];
    Vec4 delta;
    Request req;
    s32 dx;
    s32 dy;
    u32 i;

    if (D_8008A058 != 0) {
        return 0;
    }
    if (func_800E0E24() != 0) {
        return 1;
    }
    switch (obj->mode) {
    case 0:
        if (D_800854A4 == 1) {
            if (D_800893A8 == D_80086178->pos.x && D_800893AC == D_80086178->pos.y) {
                D_80080C40[0].x = D_800893A8;
                D_80080C40[3].x = D_800893A8;
                func_800A3704(9, obj->node, 2);
                req.a = D_8008741C;
                req.b = D_8008762C;
                D_800854A4 = 2;
                D_80087950 = func_8000D740(D_80087A64, 0xA, &req);
            }
        }
        delta.x = D_80086178->pos.x - obj->node->pos.x;
        dx = delta.x;
        if (dx < 0) {
            dx = -dx;
        }
        delta.y = D_80086178->pos.y - obj->node->pos.y;
        dy = delta.y;
        if (dy < 0) {
            dy = -dy;
        }
        if (dx <= 0x7FFFF && dy <= 0x7FFFF) {
            if (D_80086178->pos.z > 0x7FFFF) {
                return 0;
            }
            obj->node->vx = 0;
            obj->node->vy = 0;
            if (D_80087FA4.unk_00 != 8 && D_80087FA4.unk_08 != 0) {
                return 0;
            }
            if (D_800854A4 != 1) {
            if (obj->timer == 0) {
                if (D_8007A07C != 0 || D_8007A080 != 0) {
                    func_8009F1DC(D_80086178->pos, 2, 2, 2, 0);
                    if (D_800854A4 == 0) {
                        func_800A3704(8, obj->node, 0);
                    }
                }
                obj->timer++;
            }
            if (D_8008A058 != 0) {
                return 0;
            }
            if (D_80086178->pos.z != 0) {
                return 0;
            }
            for (i = 0; i < 4; i++) {
                if (D_80087138[i].unk_28 & 0x20) {
                    D_80087138[i].unk_28 &= ~0x20;
                    func_800C0BBC(&D_80087138[i], 0x3C);
                    cmd[0] = 0x37;
                    if (D_8008719C[i].unk_00 == 0x34) {
                        func_800E1BCC(&D_80087138[i], cmd);
                    } else {
                        func_800E1BAC(&D_80087138[i], cmd);
                    }
                }
            }
            if (D_8007A07C != 0) {
                obj->timer = D_8008A5B4 + obj->timer;
                if (obj->timer < 0x1E) {
                    return 0;
                }
                if (func_800C0BBC(obj, D_8007A07C) == 0) {
                    func_800C16A0(obj, 0x400);
                    D_80088636 = func_800A6580();
                    func_800A6590(&D_80086CE8, 9);
                    obj->mode = 1;
                    D_8007A07C = 0;
                    return 0;
                }
                obj->mode = 3;
                func_800C0BBC(obj, 0x3E);
                D_8007A07C = 0;
                return 0;
            }
            if (D_8007A080 != 0) {
                if (D_800854A4 != 0) {
                    if (D_80087424 == 0x201) {
                        return 0;
                    }
                    if (obj->timer == 1) {
                        func_800A3704(0xA, obj->node, 0);
                        if (D_800878E4 >= D_8008793C) {
                            func_800B7DD8(1, 0x17, 0, 0, 0);
                        } else {
                            func_800B7DD8(2, 0x18, D_800880C4 & 4, 0, 0);
                        }
                    }
                }
                obj->timer = D_8008A5B4 + obj->timer;
                if (obj->timer < 0x1E) {
                    return 0;
                }
                if (D_8007A080 == 0x1500) {
                    func_800C16A0(obj, 0);
                } else if (D_8007A080 == 0x1300) {
                    if (func_8000C8EC(D_80088090) != 0) {
                        func_800C16A0(obj, 0xC00);
                    } else {
                        func_800C16A0(obj, 0x400);
                    }
                } else {
                    func_800C16A0(obj, 0x400);
                }
                if (func_800C0BBC(obj, D_8007A080) == 0) {
                    obj->mode = 2;
                    func_800A2BAC(0);
                    return 0;
                }
                func_800A2834();
                func_800A2BAC(0);
            } else if (D_800854A4 != 0) {
                func_800A2BAC((D_800878E4 < D_8008793C) ? 0x1300 : 0x1500);
                return 0;
            }
            }
            obj->mode = 3;
            func_800C0BBC(obj, 0x3E);
            return 0;
        }
        if (obj->state != 0x3C) {
            func_800C0C8C(obj, 0x3C);
        }
        func_800C0018(obj, func_800B9208(&delta), 0);
        return 0;
    case 1:
        if (obj->node->flags & 0x20000) {
            return 0;
        }
        if (D_8007A080 == 0) {
            State *st;

            obj->mode = 3;
            st = func_800209AC();
            if (st->unk_04[0x1E] == st->unk_10) {
                func_800C0BBC(obj, 0x40);
            } else {
                func_800C0BBC(obj, 0x3F);
            }
            return 0;
        }
        func_800C16A0(obj, 0);
        if (func_800C0BBC(obj, D_8007A080) == 0) {
            obj->mode = 2;
            func_800A2BAC(0);
            return 0;
        }
        obj->mode = 3;
        func_800C0BBC(obj, 0x3E);
        func_800A2BAC(0);
        return 0;
    case 2:
        if (obj->node->flags & 0x20000) {
            return 0;
        }
        obj->mode = 3;
        func_800C0BBC(obj, 0x3E);
        if (D_800854A4 == 0) {
            return 0;
        }
        func_800A2834();
        return 0;
    case 3: {
        Node *node = obj->node;

        if (!((node->anim->unk_14 >= 0x3E && node->anim->unk_14 <= 0x3F) || node->anim->unk_14 == 0x40)) {
            func_800C0BBC(obj, 0x3E);
            return 0;
        }
        if (node->flags & 0x40000) {
            if (D_80088636 != -1) {
                D_80086CE8.unk_0C = D_80086178;
                func_800A6590(&D_80086CE8, (u8)D_80088636);
                D_80088636 = -1;
                D_80086CE8.unk_84 &= 0xFFF6;
            }
            D_8008A5B2 = 0;
            func_800C62A8(obj);
            D_80086178->pos.z = 0;
            obj->mode = 4;
        }
        break;
    }
    case 4:
        if (obj->node->flags & 0x20000) {
            return 0;
        }
        cmd[0] = 0x36;
        func_800E1BAC(obj, cmd);
        func_800C0C8C(obj, 0x3C);
        func_800A365C(0);
        return 1;
    }
    return 0;
}
