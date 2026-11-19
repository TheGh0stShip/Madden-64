#include "m2c.h"

typedef struct { s8 x, y; } Step;
typedef struct { Step *buf; s32 timer; s16 count; u16 index; u8 pad[0x3C]; s16 dx; s16 dy; s16 x; s16 y; } Rec;
extern u16 D_80071950[];
s32 func_800C7F28(Rec *r) {
    if (r->timer < 0) {
        r->buf[r->count].x = r->dx;
        r->buf[r->count].y = r->dy;
        r->timer = 0x348;
        r->x += r->dx;
        r->y += r->dy;
        r->dx = 0;
        r->dy = 0;
        r->count++;
        r->index++;
        if (D_80071950[r->index] == 2 || D_80071950[r->index] == 3) {
            return 1;
        }
    }
    return 0;
}
