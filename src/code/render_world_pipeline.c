#include "types.h"

/*
 * render_world_pipeline (0x80013D84, 0x1EF8 bytes)
 *
 * Builds and draws the stadium sky dome: seven rings of twenty vertices are
 * rotated by a per-ring matrix (func_80013B8C) and translated, copied between
 * the per-frame vertex buffers, re-oriented for the whole dome, capped with
 * interpolated pole vertices and finally emitted as a display list
 * (gSPVertex / gSP2Triangles / gSP1Triangle) after the render state setup.
 */

typedef struct {
    s16 ob[3];
    u16 flag;
    s16 tc[2];
    u8 cn[4];
} Vtx_t;

typedef struct {
    s16 ob[3];
    u16 flag;
    s16 tc[2];
    s8 n[3];
    u8 a;
} Vtx_tn;

typedef union {
    Vtx_t v;
    Vtx_tn n;
} Vtx;

extern s32 D_80085A34;          /* ring index */
extern s32 D_80085A1C;          /* vertex index */
extern f32 D_80087898;
extern f32 D_8008789C;
extern f32 D_800878A0;
extern f32 D_80065570;
extern u16 D_80065574;
extern s32 D_8006556C;
extern u16 D_8008A5B4;
extern f32 D_80088628;
extern f32 D_80089560;
extern u16 D_80064A4C;
extern u16 D_80064A4E;
extern s16 D_8008B3CA;
extern f32 D_80065560;
extern f32 D_80080C88;
extern Vtx *D_80089568[];
extern Vtx *D_80089C20[];
extern u16 D_8008AFD4;
extern Vtx *D_8008B218[][8];
extern s16 D_8006555A;
extern u16 D_8006555C;
extern Vtx *D_80087918;
extern Vtx *D_800895F0;
extern Vtx *D_800857F8;
extern s32 D_8008B654;
typedef struct {
    u32 w0;
    u32 w1;
} Gfx;

extern Gfx *D_80084F5C;
extern s32 D_8006553C;
extern s32 D_80065540;
extern s32 D_80065544;
extern s32 D_80065548;
extern s32 D_8006554C;
extern s32 D_80065550;
extern Vtx *D_80065564;
extern Vtx *D_80065568;
extern Vtx *D_80084FC0;

extern s32 func_8002E828(s16 angle);
extern s32 func_8002E848(s16 angle);
extern s32 func_8002E890(s32 value, s32 scale);
extern u16 func_80031A1C(u16 maximum);
extern void func_80013B8C(f32 x, f32 y, f32 z, f32 *m0, f32 *m1, f32 *m2,
                          f32 *m3, f32 *m4, f32 *m5, f32 *m6, f32 *m7,
                          f32 *m8, s32 angle);
extern void func_8000AFA8(u32 mask);
extern void func_8000DE34(s32);
extern void func_8000E3C8(void);
extern void func_8000E20C(void);
extern void func_8000C790(s32);
extern void func_8000A3C0(s32);
extern void func_80009E14(s32);
extern void func_8000A22C(s32);
extern void func_8000A8B8(s32);
extern void func_8000A984(s32);
extern void func_8000A874(s32);
extern void func_8000A8FC(s32);
extern void func_8000A830(s32);
extern void func_80009E58(s32);
extern void func_8000B1D8(s32, s32, s32, s32, s32);
extern void func_8000A63C(u32, u32);
extern void func_8000A404(s32);
extern void func_8000AECC(s32, s32);
extern void func_8000A08C(s32, s32, s32, s32);
extern void func_8000A940(s32);
extern void func_800093F4(s32);
extern void func_800094D0(s32, s32, s32, s32, s32, s32, s32, s32, s32, s32,
                          s32, s32);
extern void func_80009310(s32, s32);
extern void func_8000979C(s32, s32, s32, s32, s32, s32, s32, s32, s32, s32,
                          s32);

void render_world_pipeline(void)
{
    f32 m0, m1, m2, m3, m4, m5, m6, m7, m8;
    f32 one;
    Vtx *src;
    Vtx *dst;
    Vtx *copy;
    s32 sine;
    s32 cosine;
    u16 tilt;
    Vtx *vtx;
    Vtx **rings = D_80089C20;

    D_80085A34 = 0;
    m1 = 0.0f;
    m2 = 0.0f;
    m3 = 0.0f;
    m5 = 0.0f;
    m6 = 0.0f;
    m7 = 0.0f;
    D_8008789C = 0.0f;
    D_800878A0 = 0.0f;
    m0 = 1.0f;
    m4 = 1.0f;
    m8 = 1.0f;
    one = 1.0f;
    D_80087898 = 20.0f;

    do {
        m0 = one;
        m4 = one;
        m8 = one;
        m1 = 0.0f;
        m2 = 0.0f;
        m3 = 0.0f;
        m5 = 0.0f;
        m6 = 0.0f;
        m7 = 0.0f;
        src = D_80089568[D_80085A34];

        D_80065570 = D_80065570 + 0.05;
        if (D_80065570 > 6.28318530718) {
            D_80065570 = D_80065570 - 6.28318530718;
        }

        D_80065574 += D_8008A5B4 * D_8006556C;
        if ((s16)D_80065574 >= 0x1000) {
            D_80065574 -= 0x1000;
        }

        D_80088628 = (f32)(((f32)D_80085A34 + 1.0) * 0.14285714285714285) *
                     6.28318530718;
        D_80089560 = D_80064A4E * 0.0058823529411764705;
        D_8008B3CA = (s32)((s32)(D_80088628 * 4096.0) * 0.15915494309188485);
        D_8008B3CA = D_8008B3CA - D_80065574;
        sine = func_8002E828(D_8008B3CA);
        cosine = func_8002E848(D_8008B3CA);
        D_80080C88 = D_80089560 * (D_80088628 * 0.015915494309) *
                         (sine * D_80065560) +
                     D_80089560 * ((cosine * D_80065560) * 0.007957747155);

        D_8008B3CA = func_8002E890((s32)(D_80080C88 * 100.0f), 100) - 0x400;
        D_8008B3CA = D_8008B3CA - (s32)((f32)(0x300 - D_80064A4E) * 0.6666666666666666);
        if (D_80064A4E == 0) {
            D_8008B3CA = -0x332;
        }

        func_80013B8C(m6, m7, m8, &m0, &m1, &m2, &m3, &m4, &m5, &m6, &m7, &m8,
                      (u16)D_8008B3CA);

        D_80085A1C = 0;
        copy = rings[D_80085A34];
        dst = D_8008B218[D_8008AFD4][D_80085A34];
        do {
            dst[D_80085A1C].v.ob[0] = m0 * src[D_80085A1C].v.ob[0] + m1 * src[D_80085A1C].v.ob[1] + m2 * src[D_80085A1C].v.ob[2] + 0.5;
            dst[D_80085A1C].v.ob[1] = m3 * src[D_80085A1C].v.ob[0] + m4 * src[D_80085A1C].v.ob[1] + m5 * src[D_80085A1C].v.ob[2] + 0.5;
            dst[D_80085A1C].v.ob[2] = m6 * src[D_80085A1C].v.ob[0] + m7 * src[D_80085A1C].v.ob[1] + m8 * src[D_80085A1C].v.ob[2] + 0.5;
            dst[D_80085A1C].n.n[0] = m0 * src[D_80085A1C].n.n[0] + m1 * src[D_80085A1C].n.n[1] + m2 * src[D_80085A1C].n.n[2] + 0.5;
            dst[D_80085A1C].n.n[1] = m3 * src[D_80085A1C].n.n[0] +
                                     m4 * src[D_80085A1C].n.n[1] +
                                     m5 * src[D_80085A1C].n.n[2] + 0.5;
            dst[D_80085A1C].n.n[2] = m6 * src[D_80085A1C].n.n[0] +
                                     m7 * src[D_80085A1C].n.n[1] +
                                     m8 * src[D_80085A1C].n.n[2] + 0.5;
            dst[D_80085A1C].v.cn[3] = 0xFF;
            dst[D_80085A1C].v.tc[0] = src[D_80085A1C].v.tc[0];
            dst[D_80085A1C].v.tc[1] = src[D_80085A1C].v.tc[1];
            copy[D_80085A1C].v.tc[0] = src[D_80085A1C].v.tc[0];
            copy[D_80085A1C].v.tc[1] = src[D_80085A1C].v.tc[1];
            D_80085A1C++;
        } while (D_80085A1C < 20);

        D_80085A1C = 0;
        do {
            dst[D_80085A1C].v.ob[0] = dst[D_80085A1C].v.ob[0] + D_80087898;
            dst[D_80085A1C].v.ob[1] = dst[D_80085A1C].v.ob[1] + D_8008789C;
            dst[D_80085A1C].v.ob[2] = dst[D_80085A1C].v.ob[2] + D_800878A0;
            D_80085A1C++;
        } while (D_80085A1C < 20);

        D_80087898 = D_80087898 + m0 * 20.0;
        D_8008789C = D_8008789C + -m1 * 20.0;
        D_800878A0 = D_800878A0 + -m2 * 20.0;
        D_80085A34++;
    } while (D_80085A34 < 7);

    /* ring 0 keeps its base positions and normals in the shared copy */
    copy = D_80089C20[0];
    D_80085A1C = 0;
    dst = D_8008B218[D_8008AFD4][0];
    do {
        copy[D_80085A1C].v.ob[0] = dst[D_80085A1C].v.ob[0];
        copy[D_80085A1C].v.ob[1] = dst[D_80085A1C].v.ob[1];
        copy[D_80085A1C].v.ob[2] = dst[D_80085A1C].v.ob[2];
        copy[D_80085A1C].v.cn[0] = dst[D_80085A1C].v.cn[0];
        copy[D_80085A1C].v.cn[1] = dst[D_80085A1C].v.cn[1];
        copy[D_80085A1C].v.cn[2] = dst[D_80085A1C].v.cn[2];
        copy[D_80085A1C].v.cn[3] = 0xFF;
        D_80085A1C++;
    } while (D_80085A1C < 20);

    D_80085A34 = 0;
    do {
        D_80085A1C = 0;
        copy = D_80089C20[D_80085A34];
        dst = D_8008B218[D_8008AFD4][D_80085A34];
        do {
            copy[D_80085A1C].v.ob[0] = dst[D_80085A1C].v.ob[0];
            copy[D_80085A1C].v.ob[1] = dst[D_80085A1C].v.ob[1];
            copy[D_80085A1C].v.ob[2] = dst[D_80085A1C].v.ob[2];
            D_80085A1C++;
        } while (D_80085A1C < 20);
        D_80085A34++;
    } while (D_80085A34 < 7);

    /* stitch: vertices 0-4 and 10-14 of each ring follow 5-9 / 15-19 of the previous ring */
    D_80085A34 = 1;
    do {
        D_80085A1C = 0;
        copy = D_80089C20[D_80085A34];
        dst = D_8008B218[D_8008AFD4][D_80085A34 - 1];
        do {
            copy[D_80085A1C].v.ob[0] = dst[D_80085A1C + 5].v.ob[0];
            copy[D_80085A1C].v.ob[1] = dst[D_80085A1C + 5].v.ob[1];
            copy[D_80085A1C].v.ob[2] = dst[D_80085A1C + 5].v.ob[2];
            D_80085A1C++;
        } while (D_80085A1C < 5);
        D_80085A1C = 10;
        do {
            copy[D_80085A1C].v.ob[0] = dst[D_80085A1C + 5].v.ob[0];
            copy[D_80085A1C].v.ob[1] = dst[D_80085A1C + 5].v.ob[1];
            copy[D_80085A1C].v.ob[2] = dst[D_80085A1C + 5].v.ob[2];
            D_80085A1C++;
        } while (D_80085A1C < 15);
        D_80085A34++;
    } while (D_80085A34 < 7);

    D_8006555A += D_8006555C;
    if (D_80064A4E == 0) {
        D_8006555A = 0;
    }
    if (D_8006555A >= 0x33) {
        D_8006555C = -func_80031A1C(4);
    }
    if (D_8006555A < -0x32) {
        D_8006555C = func_80031A1C(4);
    }

    tilt = D_8006555A + ((D_80064A4C + 0x7FF) & 0xFFF);
    func_80013B8C(0.0f, 1.0f, 0.0f, &m0, &m1, &m2, &m3, &m4, &m5, &m6, &m7, &m8,
                  tilt);

    D_80085A34 = 0;
    do {
        D_80085A1C = 0;
        copy = D_80089C20[D_80085A34];
        dst = D_8008B218[D_8008AFD4][D_80085A34];
        do {
            dst[D_80085A1C].v.ob[0] = m0 * copy[D_80085A1C].v.ob[0] + m1 * copy[D_80085A1C].v.ob[1] + m2 * copy[D_80085A1C].v.ob[2] + 0.5;
            dst[D_80085A1C].v.ob[1] = m3 * copy[D_80085A1C].v.ob[0] + m4 * copy[D_80085A1C].v.ob[1] + m5 * copy[D_80085A1C].v.ob[2] + 0.5 + 180.0;
            dst[D_80085A1C].v.ob[2] = m6 * copy[D_80085A1C].v.ob[0] + m7 * copy[D_80085A1C].v.ob[1] + m8 * copy[D_80085A1C].v.ob[2] + 0.5;
            dst[D_80085A1C].n.n[0] = m0 * copy[D_80085A1C].n.n[0] + m1 * copy[D_80085A1C].n.n[1] + m2 * copy[D_80085A1C].n.n[2] + 0.5;
            dst[D_80085A1C].n.n[1] = m3 * copy[D_80085A1C].n.n[0] +
                                     m4 * copy[D_80085A1C].n.n[1] +
                                     m5 * copy[D_80085A1C].n.n[2] + 0.5;
            dst[D_80085A1C].n.n[2] = m6 * copy[D_80085A1C].n.n[0] +
                                     m7 * copy[D_80085A1C].n.n[1] +
                                     m8 * copy[D_80085A1C].n.n[2] + 0.5;
            D_80085A1C++;
        } while (D_80085A1C < 20);
        D_80085A34++;
    } while (D_80085A34 < 7);

    /* every ring shares ring 0's colours */
    D_80085A34 = 1;
    copy = D_8008B218[D_8008AFD4][0];
    do {
        D_80085A1C = 0;
        dst = D_8008B218[D_8008AFD4][D_80085A34];
        do {
            dst[D_80085A1C].v.cn[0] = copy[D_80085A1C].v.cn[0];
            dst[D_80085A1C].v.cn[1] = copy[D_80085A1C].v.cn[1];
            dst[D_80085A1C].v.cn[2] = copy[D_80085A1C].v.cn[2];
            D_80085A1C++;
        } while (D_80085A1C < 20);
        D_80085A34++;
    } while (D_80085A34 < 7);

    /* pole cap */
    {
        Vtx *cap = D_80087918;

        D_800895F0 = cap;
        D_800857F8 = D_8008B218[D_8008AFD4][0];
        cap->n.n[0] = -0x7F;
        cap->v.ob[0] = 0;
        cap->v.ob[2] = 0;
        cap->v.ob[1] = 0xBE;
    }
    D_800895F0[0].n.n[1] = 0;
    D_800895F0[0].n.n[2] = 0;
    D_800895F0[0].v.cn[3] = 0xFF;
    D_800895F0[0].v.tc[0] = 0;
    D_800895F0[0].v.tc[1] = 0;

    D_800895F0[1].v.ob[0] = ((f32)D_800857F8[2].v.ob[0] - (f32)D_800857F8[1].v.ob[0]) * 0.5 + (f32)D_800857F8[1].v.ob[0];
    D_800895F0[1].v.ob[1] = ((f32)D_800857F8[2].v.ob[1] - (f32)D_800857F8[1].v.ob[1]) * 0.5 + (f32)D_800857F8[1].v.ob[1];
    D_800895F0[1].v.ob[2] = ((f32)D_800857F8[2].v.ob[2] - (f32)D_800857F8[1].v.ob[2]) * 0.5 + (f32)D_800857F8[1].v.ob[2];
    D_800895F0[1].n.n[0] = ((f32)D_800857F8[2].n.n[0] - (f32)D_800857F8[1].n.n[0]) * 0.5 + (f32)D_800857F8[1].n.n[0];
    D_800895F0[1].n.n[1] = ((f32)D_800857F8[2].n.n[1] - (f32)D_800857F8[1].n.n[1]) * 0.5 + (f32)D_800857F8[1].n.n[1];
    D_800895F0[1].n.n[2] = ((f32)D_800857F8[2].n.n[2] - (f32)D_800857F8[1].n.n[2]) * 0.5 + (f32)D_800857F8[1].n.n[2];
    D_800895F0[1].v.cn[3] = 0xFF;
    D_800895F0[1].v.tc[0] = 0;
    D_800895F0[1].v.tc[1] = 0;

    D_800895F0[2].v.ob[0] = D_800857F8[2].v.ob[0];
    D_800895F0[2].v.ob[1] = D_800857F8[2].v.ob[1];
    D_800895F0[2].v.ob[2] = D_800857F8[2].v.ob[2];
    D_800895F0[2].v.cn[0] = D_800857F8[2].v.cn[0];
    D_800895F0[2].v.cn[1] = D_800857F8[2].v.cn[1];
    D_800895F0[2].v.cn[2] = D_800857F8[2].v.cn[2];
    D_800895F0[2].v.cn[3] = 0xFF;
    D_800895F0[2].v.tc[0] = 0;
    D_800895F0[2].v.tc[1] = 0;

    D_800895F0[3].v.ob[0] = (D_800857F8[3].v.ob[0] - D_800857F8[2].v.ob[0]) * 0.5 + D_800857F8[2].v.ob[0];
    D_800895F0[3].v.ob[1] = (D_800857F8[3].v.ob[1] - D_800857F8[2].v.ob[1]) * 0.5 + D_800857F8[2].v.ob[1];
    D_800895F0[3].v.ob[2] = (D_800857F8[3].v.ob[2] - D_800857F8[2].v.ob[2]) * 0.5 + D_800857F8[2].v.ob[2];
    D_800895F0[3].n.n[0] = (D_800857F8[3].n.n[0] - D_800857F8[2].n.n[0]) * 0.5 + D_800857F8[2].n.n[0];
    D_800895F0[3].n.n[1] = (D_800857F8[3].n.n[1] - D_800857F8[2].n.n[1]) * 0.5 + D_800857F8[2].n.n[1];
    D_800895F0[3].n.n[2] = (D_800857F8[3].n.n[2] - D_800857F8[2].n.n[2]) * 0.5 + D_800857F8[2].n.n[2];
    D_800895F0[3].v.cn[3] = 0xFF;
    D_800895F0[3].v.tc[0] = 0;
    D_800895F0[3].v.tc[1] = 0;

    D_800895F0[4].v.ob[0] = (D_800857F8[12].v.ob[0] - D_800857F8[11].v.ob[0]) * 0.5 + D_800857F8[11].v.ob[0];
    D_800895F0[4].v.ob[1] = (D_800857F8[12].v.ob[1] - D_800857F8[11].v.ob[1]) * 0.5 + D_800857F8[11].v.ob[1];
    D_800895F0[4].v.ob[2] = (D_800857F8[12].v.ob[2] - D_800857F8[11].v.ob[2]) * 0.5 + D_800857F8[11].v.ob[2];
    D_800895F0[4].n.n[0] = (D_800857F8[12].n.n[0] - D_800857F8[11].n.n[0]) * 0.5 + D_800857F8[11].n.n[0];
    D_800895F0[4].n.n[1] = (D_800857F8[12].n.n[1] - D_800857F8[11].n.n[1]) * 0.5 + D_800857F8[11].n.n[1];
    D_800895F0[4].n.n[2] = (D_800857F8[12].n.n[2] - D_800857F8[11].n.n[2]) * 0.5 + D_800857F8[11].n.n[2];
    D_800895F0[4].v.cn[3] = 0xFF;
    D_800895F0[4].v.tc[0] = 0;
    D_800895F0[4].v.tc[1] = 0;

    D_800895F0[5].v.ob[0] = D_800857F8[12].v.ob[0];
    D_800895F0[5].v.ob[1] = D_800857F8[12].v.ob[1];
    D_800895F0[5].v.ob[2] = D_800857F8[12].v.ob[2];
    D_800895F0[5].v.cn[0] = D_800857F8[12].v.cn[0];
    D_800895F0[5].v.cn[1] = D_800857F8[12].v.cn[1];
    D_800895F0[5].v.cn[2] = D_800857F8[12].v.cn[2];
    D_800895F0[5].v.cn[3] = 0xFF;
    D_800895F0[5].v.tc[0] = 0;
    D_800895F0[5].v.tc[1] = 0;

    D_800895F0[6].v.ob[0] = (D_800857F8[13].v.ob[0] - D_800857F8[12].v.ob[0]) * 0.5 + D_800857F8[12].v.ob[0];
    D_800895F0[6].v.ob[1] = (D_800857F8[13].v.ob[1] - D_800857F8[12].v.ob[1]) * 0.5 + D_800857F8[12].v.ob[1];
    D_800895F0[6].v.ob[2] = (D_800857F8[13].v.ob[2] - D_800857F8[12].v.ob[2]) * 0.5 + D_800857F8[12].v.ob[2];
    D_800895F0[6].n.n[0] = (D_800857F8[13].n.n[0] - D_800857F8[12].n.n[0]) * 0.5 + D_800857F8[12].n.n[0];
    D_800895F0[6].n.n[1] = (D_800857F8[13].n.n[1] - D_800857F8[12].n.n[1]) * 0.5 + D_800857F8[12].n.n[1];
    D_800895F0[6].n.n[2] = (D_800857F8[13].n.n[2] - D_800857F8[12].n.n[2]) * 0.5 + D_800857F8[12].n.n[2];
    D_800895F0[6].v.cn[3] = 0xFF;
    D_800895F0[6].v.tc[0] = 0;
    D_800895F0[6].v.tc[1] = 0;

    /* render state */
    func_8000AFA8(0x20205);
    func_8000DE34(9);
    func_8000E3C8();
    func_8000E20C();
    func_8000C790(D_8008B654);

#define GFX2(word0, word1)           \
    {                                 \
        u32 first = (word0);          \
        u32 second = (word1);         \
        Gfx *g = D_80084F5C++;        \
        g->w0 = first;                \
        g->w1 = second;               \
    }

    GFX2(0xE7000000, 0);
    func_8000A3C0(0);
    func_80009E14(0);
    GFX2(0xFCFFFFFF, 0xFFFCF279);
    GFX2(0xE7000000, 0);
    func_8000A22C(0);
    func_8000A8B8(0x2000);
    func_8000A984(0x80000);
    func_8000A22C(0x80);
    func_8000A874(0);
    func_8000A8FC(0);
    func_8000A830(0xC00);
    func_80009E58(0);
    func_8000B1D8(0x8000, 0x8000, 0, 0, 1);
    func_8000A63C(0x442078, 0x442078);
    func_8000A404(0);
    func_8000AECC(0x3C0, 0x3DE);
    func_8000A08C(0xFF, 0xFF, 0xFF, 0);
    func_8000A940(0x8000);
    func_800093F4(D_80065548);
    func_800094D0(D_80065544, 2, 1, 0x40, 0x20, 0, 2, 2, 0, 0, 0, 0);

    /* pole cap */
    vtx = D_80065564;
    GFX2(0x0400103F, (u32)vtx);
    GFX2(0xB1000402, 0x00020406);
    GFX2(0xFC60FEC1, 0x55FE793C);
    func_8000A940(0x8000);
    func_80009310(0, D_80065550);
    func_8000979C(D_8006554C, 2, 0x10, 0x20, 0, 2, 2, 4, 5, 0, 0);

    /* first band */
    vtx = D_80065568;
    GFX2(0x040040FF, (u32)vtx);
    D_80085A1C = 0;
    do {
        GFX2((((D_80085A1C * 2) & 0xFF) << 16) | (((D_80085A1C + 8) << 9) & 0xFE00) |
                 (((D_80085A1C + 1) * 2) & 0xFF) | 0xB1000000,
             ((((D_80085A1C + 1) * 2) & 0xFF) << 16) |
                 (((D_80085A1C + 8) << 9) & 0xFE00) | (((D_80085A1C + 9) * 2) & 0xFF));
        D_80085A1C++;
    } while (D_80085A1C < 7);
    GFX2(0xB10E1E00, 0x00001E10);
    func_8000A940(0x8000);
    func_80009310(0, D_80065550);
    func_8000979C(D_8006554C, 2, 0x10, 0x20, 0, 2, 2, 4, 5, 0, 0);

    /* lower cap fan */
    vtx = D_80084FC0;
    GFX2(0x0400185F, (u32)vtx);
    GFX2(0xBF000000, 0x00080006);
    GFX2(0xBF000000, 0x00080604);
    GFX2(0xBF000000, 0x00080402);
    GFX2(0xBF000000, 0x00080200);
    GFX2(0xBF000000, 0x000A0406);
    GFX2(0xBF000000, 0x000A0204);
    GFX2(0xBF000000, 0x000A0002);
    GFX2(0xBF000000, 0x000A0600);
    func_8000A940(0x8000);
    func_80009310(0, D_80065540);
    func_8000979C(D_8006553C, 2, 0x40, 0x40, 0, 2, 2, 6, 6, 0, 0);

#define RING_STRIPS()                                                              \
    {                                                                              \
        D_80085A1C = 0;                                                            \
        do {                                                                       \
            GFX2((((D_80085A1C * 2) & 0xFF) << 16) |                               \
                     (((D_80085A1C + 5) << 9) & 0xFE00) |                          \
                     (((D_80085A1C + 6) * 2) & 0xFF) | 0xB1000000,                 \
                 (((D_80085A1C * 2) & 0xFF) << 16) |                               \
                     ((((D_80085A1C + 6) * 2) & 0xFF) << 8) |                      \
                     (((D_80085A1C + 1) * 2) & 0xFF));                             \
            D_80085A1C++;                                                          \
        } while (D_80085A1C < 4);                                                  \
        D_80085A1C = 10;                                                           \
        do {                                                                       \
            GFX2((((D_80085A1C * 2) & 0xFF) << 16) |                               \
                     (((D_80085A1C + 1) << 9) & 0xFE00) |                          \
                     (((D_80085A1C + 5) * 2) & 0xFF) | 0xB1000000,                 \
                 ((((D_80085A1C + 5) * 2) & 0xFF) << 16) |                         \
                     (((D_80085A1C + 1) << 9) & 0xFE00) |                          \
                     (((D_80085A1C + 6) * 2) & 0xFF));                             \
            D_80085A1C++;                                                          \
        } while (D_80085A1C < 14);                                                 \
    }

    D_80085A34 = 1;
    do {
        vtx = D_8008B218[D_8008AFD4][D_80085A34];
        GFX2(0x0400513F, (u32)vtx);
        RING_STRIPS();
        D_80085A34++;
    } while (D_80085A34 < 7);
    func_8000A940(0x8000);
    func_80009310(0, D_80065550);
    func_8000979C(D_8006554C, 2, 0x10, 0x20, 0, 0, 0, 6, 6, 0, 0);

    vtx = D_8008B218[D_8008AFD4][0];
    GFX2(0x0400513F, (u32)vtx);
    RING_STRIPS();
    vtx = D_80087918;
    GFX2(0x04001C6F, (u32)vtx);
    GFX2(0xB1000204, 0x00000406);
    GFX2(0xB1000A08, 0x00000C0A);
}
