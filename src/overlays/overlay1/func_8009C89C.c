#include "types.h"

typedef struct {
    s16 ob[3];
    u16 flag;
    s16 tc[2];
    u8 cn[4];
} Vtx;

typedef struct {
    s32 kind;
    Vtx *vtx[2];
    u8 padC[0x14 - 0xC];
    u16 unk_14;
    u16 unk_16;
    u8 pad18[0x1C - 0x18];
    s32 w;
    s32 h;
    s32 unk_24;
    s32 unk_28;
    u16 x;
    u16 y;
    u8 pad30[0x36 - 0x30];
    u16 count;
    u8 pad38[0x3A - 0x38];
    u16 flags;
    u8 pad3C[0x40 - 0x3C];
    u16 unk_40;
    u16 unk_42;
    s32 unk_44;
} Panel;

Vtx *func_80032E00(s32, s32);
void func_80033308(s32, Vtx *, s32, s32);

void func_80098178(Panel *obj) {
    Vtx *q;
    Vtx *p;
    s32 i;
    s32 j;
    s32 u;
    s32 v;
    s32 cols;
    s32 rows;
    s32 rem;
    s32 size;
    s32 step;
    s32 tex;
    s32 val;
    s32 d;

    if (obj->kind != 0) {
        if (obj->kind == 3) {
            j = 1;
            do {
                q = obj->vtx[j];
                q[0].ob[0] = q[3].ob[0] = obj->x;
                q[0].tc[0] = q[3].tc[0] = 0;
                q[1].ob[0] = q[2].ob[0] = obj->x + obj->w;
                q[1].tc[0] = q[2].tc[0] = obj->unk_40;
                q[0].ob[1] = q[1].ob[1] = obj->y;
                q[0].tc[1] = q[1].tc[1] = 0;
                q[3].ob[1] = q[2].ob[1] = obj->y + obj->h;
                q[3].tc[1] = q[2].tc[1] = obj->unk_42;
                i = 3;
                do {
                    q[i].ob[2] = 0;
                    q[i].flag = 0;
                    q[i].cn[3] = 0xFF;
                    q[i].cn[2] = 0xFF;
                    q[i].cn[1] = 0xFF;
                    q[i].cn[0] = 0xFF;
                } while (i--);
            } while (j--);
            }
    } else {
        u = 0;
        v = 1;
        if (obj->flags & 0x100) {
            u = 1;
            v = 0;
        }
        cols = 0x1000 / obj->unk_14;
        d = cols - 2;
        rows = obj->unk_16 / d;
        rem = obj->unk_16 % d;
        obj->unk_24 = 1;
        obj->unk_44 = cols;
        rows += (rem != 0);
        obj->unk_28 = rows;
        step = obj->h * d / obj->unk_16;
        obj->count = (rows + 1) * 2;
        size = obj->count * 16;
        if (obj->vtx[0] == 0) {
            obj->vtx[0] = func_80032E00(0, size);
        }
        func_80033308(0, obj->vtx[0], size, 0);
        p = obj->vtx[0];
        size = obj->count >> 1;
        while (size--) {
            p[0].ob[u] = obj->x;
            p[0].tc[v] = -32;
            p[1].ob[u] = obj->x + obj->w;
            p[1].tc[0] = (obj->unk_14 << 6) - 32;
            *(s32 *)p[0].cn = -1;
            *(s32 *)p[1].cn = -1;
            p += 2;
        }
        p = obj->vtx[0];
        p[0].ob[v] = p[1].ob[v] = obj->y;
        p[0].tc[1] = p[1].tc[1] = -32;
        p[2].tc[1] = p[3].tc[1] = (cols << 6) - 0xA0;
        tex = (cols << 6) - 0x60;
        size = (obj->count - 4) >> 1;
        while (size--) {
            p[2].ob[v] = p[3].ob[v] = p[0].ob[v] + step;
            p += 2;
            p[2].tc[1] = p[3].tc[1] = tex;
        }
        p[2].ob[v] = p[3].ob[v] = obj->y + obj->h;
        obj->unk_42 = rem;
        if (rem != 0) {
            rem <<= 6;
            p[2].tc[1] = p[3].tc[1] = rem | 0x20;
        }
    }
}
