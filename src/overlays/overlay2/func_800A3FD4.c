#include "types.h"

typedef struct {
    u8 pad00[8];
    s32 unk08;
} Sub;

typedef struct {
    s32 id;
    u8 pad04[8];
    s32 size;
    u8 pad10[8];
    s32 data;
} Request;

typedef struct {
    Request req;
    u8 pad1C[0xC];
    s32 cur[2];
    s32 want[2];
    s32 handle[2];
    u8 pad40[0x10];
    Sub *unk50;
    u8 pad54[0x20];
    Sub *unk74;
} Music;

typedef struct {
    s32 x;
    s32 y;
} Pair;

typedef struct {
    Pair a[8];
    Pair b[8];
} Obj;

extern u16 D_80084F40;
extern s32 D_8008931C;
extern s16 D_800892B4[];
extern u8 D_80071A28[];
extern u16 D_800C391C[];

Obj *func_800DD634(void);
s32 func_800364E4(u16, s32);
s32 func_8000D8DC(s32, Request *);
void func_80016FE4(s32);
void func_8000D834(s32, s32);
void func_8003647C(u16, s32);
void func_80035F88(u16, s32);

void func_800A3FD4(s32 side, Music *m) {
    Obj *obj = func_800DD634();
    s32 h;
    s32 value;
    Sub *sub;

    if (m->cur[side] == m->want[side]) {
        if (func_800364E4(D_80084F40, m->cur[side]) < 0) {
            h = m->handle[side];
            if (h == 0) {
                if (D_800C391C[D_80071A28[D_800892B4[side]]] != m->want[side]) {
                    return;
                }
                if (side != 0) {
                    sub = m->unk74;
                } else {
                    sub = m->unk50;
                }
                do {
                    value = sub->unk08;
                    m->req.data = value;
                } while (0);
                value = 0x18;
                m->req.size = value;
                m->req.id = m->cur[side];
                m->handle[side] = func_8000D8DC(0, &m->req);
                func_80016FE4(m->handle[side]);
                h = m->handle[side];
            }
            (obj->b + side)->y = h;
        }
    } else {
        if (m->handle[side] != 0) {
            func_8000D834(D_8008931C, m->handle[side]);
            m->handle[side] = 0;
            (obj->a + side)->y = 0;
        }
        if (m->cur[side] == -1) {
            m->cur[side] = m->want[side];
            func_8003647C(D_80084F40, m->cur[side]);
        }
        if (func_800364E4(D_80084F40, m->cur[side]) < 0) {
            if (m->cur[side] != m->cur[side ^ 1]) {
                func_80035F88(D_80084F40, m->cur[side]);
            }
            m->cur[side] = m->want[side];
            func_8003647C(D_80084F40, m->cur[side]);
        }
    }
}
