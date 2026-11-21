#include "types.h"

typedef struct Packed {
    u32 pad0 : 2;
    u32 a : 12;
    u32 b : 12;
    u32 pad1 : 6;
    u32 c : 15;
    u32 d : 8;
    u32 e : 9;
    u32 f : 16;
    u32 g : 16;
} Packed;

typedef struct Delta {
    u8 pad[0x20];
    s16 c;
    s16 f;
    s16 a;
    s16 b;
    s16 g;
    s16 d;
    s16 e;
} Delta;

#define SAT_ADD(field, delta, max) t = (field) + (delta); if (((field) += (delta)) != t) (field) = (max);

void gameplay_interface_finalize(Packed *p, Delta *d) {
    s32 t;
    SAT_ADD(p->c, d->c, 0x7FFF);
    SAT_ADD(p->f, d->f, 0xFFFF);
    SAT_ADD(p->a, d->a, 0xFFF);
    SAT_ADD(p->b, d->b, 0xFFF);
    SAT_ADD(p->g, d->g, 0xFFFF);
    SAT_ADD(p->d, d->d, 0xFF);
    SAT_ADD(p->e, d->e, 0x1FF);
}
