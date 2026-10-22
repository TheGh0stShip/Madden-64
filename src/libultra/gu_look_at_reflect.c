#include "types.h"

typedef struct Mtx {
    s32 m[4][4];
} Mtx;

typedef struct Light {
    u8 col[3];
    u8 pad1;
    u8 colc[3];
    u8 pad2;
    s8 dir[3];
    u8 pad3[5];
} Light;

typedef struct LookAt {
    Light l[2];
} LookAt;

#define FTOFRAC8(value) ((s32)(((value) * 128.0) < 127.0 ? ((value) * 128.0) : 127.0) & 0xFF)

extern void func_80048C68(f32 mf[4][4]);
extern f32 func_8004DE08(f32 value);
extern void func_80048B68(f32 source[4][4], Mtx* destination);

#define guMtxIdentF func_80048C68
#define sqrtf func_8004DE08
#define guMtxF2L func_80048B68

void guLookAtReflectF(f32 mf[4][4], LookAt* lookAt, f32 xEye, f32 yEye,
                      f32 zEye, f32 xAt, f32 yAt, f32 zAt, f32 xUp,
                      f32 yUp, f32 zUp) {
    f32 length;
    f32 xLook;
    f32 yLook;
    f32 zLook;
    f32 xRight;
    f32 yRight;
    f32 zRight;

    guMtxIdentF(mf);

    xLook = xAt - xEye;
    yLook = yAt - yEye;
    zLook = zAt - zEye;
    length = -1.0 / sqrtf(xLook * xLook + yLook * yLook + zLook * zLook);
    xLook *= length;
    yLook *= length;
    zLook *= length;

    xRight = yUp * zLook - zUp * yLook;
    yRight = zUp * xLook - xUp * zLook;
    zRight = xUp * yLook - yUp * xLook;
    length = 1.0 / sqrtf(xRight * xRight + yRight * yRight + zRight * zRight);
    xRight *= length;
    yRight *= length;
    zRight *= length;

    xUp = yLook * zRight - zLook * yRight;
    yUp = zLook * xRight - xLook * zRight;
    zUp = xLook * yRight - yLook * xRight;
    length = 1.0 / sqrtf(xUp * xUp + yUp * yUp + zUp * zUp);
    xUp *= length;
    yUp *= length;
    zUp *= length;

    lookAt->l[0].dir[0] = FTOFRAC8(xRight);
    lookAt->l[0].dir[1] = FTOFRAC8(yRight);
    lookAt->l[0].dir[2] = FTOFRAC8(zRight);
    lookAt->l[1].dir[0] = FTOFRAC8(xUp);
    lookAt->l[1].dir[1] = FTOFRAC8(yUp);
    lookAt->l[1].dir[2] = FTOFRAC8(zUp);
    lookAt->l[0].col[0] = 0;
    lookAt->l[0].col[1] = 0;
    lookAt->l[0].col[2] = 0;
    lookAt->l[0].pad1 = 0;
    lookAt->l[0].colc[0] = 0;
    lookAt->l[0].colc[1] = 0;
    lookAt->l[0].colc[2] = 0;
    lookAt->l[0].pad2 = 0;
    lookAt->l[1].col[0] = 0;
    lookAt->l[1].col[1] = 0x80;
    lookAt->l[1].col[2] = 0;
    lookAt->l[1].pad1 = 0;
    lookAt->l[1].colc[0] = 0;
    lookAt->l[1].colc[1] = 0x80;
    lookAt->l[1].colc[2] = 0;
    lookAt->l[1].pad2 = 0;

    mf[0][0] = xRight;
    mf[1][0] = yRight;
    mf[2][0] = zRight;
    mf[3][0] = -(xEye * xRight + yEye * yRight + zEye * zRight);
    mf[0][1] = xUp;
    mf[1][1] = yUp;
    mf[2][1] = zUp;
    mf[3][1] = -(xEye * xUp + yEye * yUp + zEye * zUp);
    mf[0][2] = xLook;
    mf[1][2] = yLook;
    mf[2][2] = zLook;
    mf[3][2] = -(xEye * xLook + yEye * yLook + zEye * zLook);
    mf[0][3] = 0.0f;
    mf[1][3] = 0.0f;
    mf[2][3] = 0.0f;
    mf[3][3] = 1.0f;
}

void guLookAtReflect(Mtx* matrix, LookAt* lookAt, f32 xEye, f32 yEye,
                     f32 zEye, f32 xAt, f32 yAt, f32 zAt, f32 xUp,
                     f32 yUp, f32 zUp) {
    f32 mf[4][4];

    guLookAtReflectF(mf, lookAt, xEye, yEye, zEye, xAt, yAt, zAt,
                     xUp, yUp, zUp);
    guMtxF2L(mf, matrix);
}
