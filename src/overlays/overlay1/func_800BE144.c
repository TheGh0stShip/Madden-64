#include "types.h"

typedef struct {
    u8 data[0xA];
} Box;

typedef struct {
    Box boxes[2];
    u16 flags;
    u16 kind;
} Shape;

typedef struct Actor {
    u8 pad00[0x48];
    Shape *shape;
} Actor;

extern u16 (*D_80072690[][4])(Actor *, Actor *);

u16 func_800B9B84(Actor *, Box *, Actor *, Box *);

u16 func_800BE144(Actor *a, Actor *b) {
    Shape *sa;
    Shape *sb;
    u16 hit;
    u16 (*handler)(Actor *, Actor *);

    sa = a->shape;
    sb = b->shape;
    hit = 0;
    if (sa->flags & 1) {
        if (sb->flags & 1) {
            hit = func_800B9B84(a, &sa->boxes[0], b, &sb->boxes[0]);
        }
        if (sb->flags & 2) {
            hit |= func_800B9B84(a, &sa->boxes[0], b, &sb->boxes[1]);
        }
    }
    if ((sa->flags & 2) && hit == 0) {
        if (sb->flags & 1) {
            hit |= func_800B9B84(a, &sa->boxes[1], b, &sb->boxes[0]);
        }
        if (sb->flags & 2) {
            hit |= func_800B9B84(a, &sa->boxes[1], b, &sb->boxes[1]);
        }
    }
    if (hit == 1) {
        handler = D_80072690[a->shape->kind][b->shape->kind];
        if (handler != 0) {
            return handler(a, b);
        }
        return 0;
    }
    return 0;
}
