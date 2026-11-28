#include "types.h"
/* display_camera_vector_compute: project a point through the camera matrix, perspective-divide it,
 * clamp x/y to [-4,4] and depth to >= 0, and map to screen/viewport units. Returns 1 if behind the
 * near plane, 2 if beyond the far plane, else 0. */

typedef struct DisplayCamera {
    u8 pad000[0x28];
    f32 matrix[4][4];
    u8 pad068[0x228 - 0x68];
    f32 scale_x;
    f32 scale_y;
    f32 offset_x;
    f32 offset_y;
} DisplayCamera;

extern DisplayCamera *D_8008B654;
void matrix_vector_transform(f32 *output, f32 *input, f32 *matrix);

s32 display_camera_vector_compute(f32 *out, f32 *in)
{
    f32 v[4];
    f32 w;
    f32 inv;
    f32 x;
    f32 y;
    f32 z;
    s32 clip;

    matrix_vector_transform(v, in, D_8008B654->matrix[0]);
    w = v[3];
    if (w != 0.0) {
        inv = 1.0 / w;
    } else {
        w = 1.0f;
        inv = w;
    }
    z = v[2] * inv;
    x = v[0] * inv;
    y = v[1] * inv;
    clip = 0;
    if (z < 0.0) {
        z = 0.0f;
        clip = 1;
    } else if (z > 1.0) {
        clip = 2;
    }
    if (x < -4.0) {
        x = -4.0f;
    }
    if (x > 4.0) {
        x = 4.0f;
    }
    if (y < -4.0) {
        y = -4.0f;
    }
    if (y > 4.0) {
        y = 4.0f;
    }
    x = x * D_8008B654->scale_x + D_8008B654->offset_x;
    y = y * D_8008B654->scale_y + D_8008B654->offset_y;
    y = D_8008B654->scale_y * 2.0 - y;
    z = z * 32767.0;
    out[2] = w;
    out[0] = x;
    out[1] = y;
    out[3] = z;
    return clip;
}
