#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 unk_14;
    u8 pad18[4];
    s32 unk_1C;
    s32 unk_20;
    u8 pad24[8];
    s32 unk_2C;
    s32 unk_30;
} Body;

typedef struct Player {
    u8 pad00[0x24];
    Body *unk_24;
    u16 unk_28;
    u8 pad2A[3];
    u8 unk_2D;
    u8 pad2E[0x65 - 0x2E];
    u8 unk_65;
    u8 unk_66;
    u8 pad67[0x8C - 0x67];
    s32 unk_8C;
    s32 unk_90;
    union {
        s32 w;
        struct {
            s16 hi;
            s16 lo;
        } h;
    } unk_94;
    struct Player *unk_98;
    s32 unk_9C;
    s32 unk_A0;
} Player;

typedef struct {
    void *unk_00;
    Player *unk_04;
    u8 pad08[8];
    s16 unk_10;
    u8 pad12[6];
} Task;

extern u16 D_8008A5B4;
extern s32 D_80080C10;
extern s32 D_8008A058;
extern s32 D_80072C58[];
void func_800AEFB4(void);

void func_800C16A0(Player *obj, s16 angle);
void func_800AE924(Task *task);
s32 func_800C0BBC(Player *obj, s32 anim);
void func_800AEA9C(s32 arg0);
u16 func_80031A1C(s32 range);
void func_8003CF78(s32 id, s32 arg1);
s16 func_8003CBB8(void);
void func_8003CE88(s32 id, s16 arg1, s32 arg2);
void func_800B9274(s16 angle, s32 *out, s32 length);
void func_800C72CC(s32 *pos, s32 arg1, s16 angle);
s16 func_800B9208(s32 *delta);
void func_800C0018(Player *obj, s16 angle, s32 arg2);

s32 func_800E5B5C(Player *obj) {
    union {
        Task task;
        s32 vec[3];
    } work;
    s32 delta[4];
    Body *body = obj->unk_24;
    s32 ok;

    obj->unk_9C = D_8008A5B4 + obj->unk_9C;
    ok = 1;
    if (obj->unk_8C == body->unk_1C && obj->unk_90 == body->unk_20) {
        s32 flags;

        if (obj->unk_94.w >= 0) {
            func_800C16A0(obj, obj->unk_94.w);
        }
        flags = obj->unk_24->unk_14;
        if (!(flags & 0x20000)) {
            s32 done = 0;

            if (obj->unk_2D != 0x17) {
                Player *partner = 0;

                if (obj->unk_98 != 0) {
                    partner = obj->unk_98;
                    if (partner->unk_8C != partner->unk_24->unk_1C || partner->unk_90 != partner->unk_24->unk_20) {
                        ok = 0;
                    }
                }
                if (D_80080C10 & 0x4000) {
                    ok = 0;
                } else if (obj->unk_66 == 0 && obj->unk_A0 == 0) {
                    work.task.unk_00 = func_800AEFB4;
                    work.task.unk_10 = 0;
                    work.task.unk_04 = obj;
                    func_800AE924(&work.task);
                    obj->unk_A0 = 1;
                }
                if (ok == 1) {
                    if ((u16)func_800C0BBC(obj, D_80072C58[obj->unk_65]) == 0) {
                        if (partner != 0) {
                            func_800C0BBC(partner, D_80072C58[partner->unk_65]);
                        }
                    } else if (obj->unk_9C > 240) {
                        done = 1;
                    }
                }
            } else {
                done = 1;
            }
            if (done == 1) {
                if (obj->unk_A0 == 2) {
                    func_800AEA9C(0);
                }
                obj->unk_28 &= ~0x10;
                obj->unk_24->unk_14 |= 0x200;
                return 1;
            }
            return 0;
        }
        if (obj->unk_2D == 0x17) {
            if (flags & 0x40000) {
                if (obj->unk_66 == 0) {
                    if (obj->unk_65 != 9) {
                        func_8003CF78(obj->unk_65 == 3 ? 15 : func_80031A1C(10) + 0x33, 6);
                    } else {
                        func_8003CE88(0x1D, func_8003CBB8() * 5 + 0x30, 0x10);
                    }
                }
                obj->unk_24->unk_14 &= ~0x40000;
            }
            if (obj->unk_24->unk_14 & 0x80000) {
                func_800B9274(obj->unk_94.h.lo, work.vec, 0x20000);
                obj->unk_24->unk_1C = work.vec[0] + obj->unk_24->unk_1C;
                obj->unk_24->unk_20 = work.vec[1] + obj->unk_24->unk_20;
                obj->unk_8C = obj->unk_24->unk_1C;
                obj->unk_90 = obj->unk_24->unk_20;
                obj->unk_24->unk_14 &= ~0x80000;
            }
            if (obj->unk_24->unk_14 & 0x100000) {
                func_800B9274(obj->unk_94.h.lo, work.vec, 0x10000);
                obj->unk_24->unk_1C = work.vec[0] + obj->unk_24->unk_1C;
                obj->unk_24->unk_20 = work.vec[1] + obj->unk_24->unk_20;
                obj->unk_8C = obj->unk_24->unk_1C;
                obj->unk_90 = obj->unk_24->unk_20;
                obj->unk_24->unk_14 &= ~0x100000;
            }
            if (obj->unk_24->unk_14 & 0x200000) {
                if (D_8008A058 != 0) {
                    s32 angle = obj->unk_94.w;

                    if (angle <= 0x800) {
                        angle -= 0x200;
                    } else {
                        angle += 0x200;
                    }
                    angle &= 0xFFF;
                    func_800B9274(angle, work.vec, 0x80000);
                    work.vec[0] += obj->unk_24->unk_1C;
                    work.vec[1] += obj->unk_24->unk_20;
                    work.vec[2] = 0x180000;
                    func_800C72CC(work.vec, 0x10000, angle);
                }
                obj->unk_24->unk_14 &= ~0x200000;
            }
        }
        return 0;
    } else {
        s32 dx;
        s32 dy;
        s32 dist;

        dx = delta[0] = obj->unk_8C - obj->unk_24->unk_1C;
        delta[1] = obj->unk_90 - obj->unk_24->unk_20;
        if (dx < 0) {
            dx = -dx;
        }
        dy = delta[1];
        if (dy < 0) {
            dy = -dy;
        }
        if (dx < dy) {
            dist = dy + dx / 2;
        } else {
            dist = dx + dy / 2;
        }
        if (dist < 0x80000) {
            obj->unk_24->unk_2C = obj->unk_24->unk_30 = 0;
            obj->unk_24->unk_1C = obj->unk_8C;
            obj->unk_24->unk_20 = obj->unk_90;
        } else {
            func_800C0018(obj, func_800B9208(delta), 0);
        }
    }
    return 0;
}
