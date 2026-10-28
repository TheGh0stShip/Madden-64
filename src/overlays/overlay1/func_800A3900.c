#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct {
    s16 v;
    s16 pad;
} Coord;

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
    u8 pad00[0x1C];
    s32 x;
    s32 y;
} Body;

typedef struct Obj {
    struct Obj *next;
    u8 pad04[0x20];
    Body *body;
    u16 flags;
    u8 pad2A[0x3A];
    u8 state;
} Obj;

extern Obj *D_800855F8;

void func_800E1BAC(Obj *, Msg *);
void func_800E1BCC(Obj *, Msg *);

/* Sends a push message to every object within radius of (x, y), except `except`. */
void func_800A3900(Coord x, Coord y, Coord unused2, Coord unused3, s32 push_x, s32 push_y, s32 radius, Obj *except) {
    Obj *obj;
    s32 dx, dy, d;
    s32 p, t;
    Vec3 dest;
    Msg msg;

    for (obj = D_800855F8; obj != NULL; obj = obj->next) {
        p = obj->body->x;
        dx = (p >> 16) - x.v;
        t = p + (push_x << 18);
        if (dx < 0) {
            dx = -dx;
            t = p - (push_x << 18);
        }
        dest.x = t;
        p = obj->body->y;
        dy = (p >> 16) - y.v;
        t = p + (push_y << 18);
        if (dy < 0) {
            dy = -dy;
            t = p - (push_y << 18);
        }
        dest.y = t;
        if (dy < dx) {
            d = dx + dy / 2;
        } else {
            d = dy + dx / 2;
        }
        if ((d >> 4) - radius < 0) {
            if (obj != except) {
                if (obj->state != 3) {
                    msg.type = 3;
                    msg.hi = (u32)(s16)(dest.y >> 16) >> 8;
                    msg.lo = dest.y >> 16;
                    msg.x = dest.x >> 18;
                    if (!(obj->flags & 0x10)) {
                        func_800E1BCC(obj, &msg);
                    } else {
                        func_800E1BAC(obj, &msg);
                    }
                }
            }
        }
    }
}
