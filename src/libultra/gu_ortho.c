#include "types.h"

typedef struct Mtx {
    s32 m[4][4];
} Mtx;

extern void guMtxIdentF(f32 matrix[4][4]);
extern void guMtxF2L(f32 source[4][4], Mtx* destination);

void guOrthoF(f32 m[4][4], f32 left, f32 right, f32 bottom, f32 top, f32 near,
              f32 far, f32 scale) {
    s32 row;
    s32 col;

    guMtxIdentF(m);
    m[0][0] = 2.0f / (right - left);
    m[1][1] = 2.0f / (top - bottom);
    m[2][2] = -2.0f / (far - near);
    m[3][0] = -(right + left) / (right - left);
    m[3][1] = -(top + bottom) / (top - bottom);
    m[3][2] = -(far + near) / (far - near);
    m[3][3] = 1.0f;
    for (row = 0; row < 4; row++) {
        for (col = 0; col < 4; col++) {
            m[row][col] *= scale;
        }
    }
}

void guOrtho(Mtx* m, f32 left, f32 right, f32 bottom, f32 top, f32 near,
             f32 far, f32 scale) {
    f32 mf[4][4];

    guOrthoF(mf, left, right, bottom, top, near, far, scale);
    guMtxF2L(mf, m);
}
