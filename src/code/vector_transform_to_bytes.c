#include "types.h"
typedef struct Vector3i { s32 x; s32 y; s32 z; } Vector3i;
extern Vector3i D_80078440;
extern s32 D_80078444;
extern s32 D_80078448;
extern void matrix_stack_transform_point(Vector3i *input, Vector3i *output);
void vector_transform_to_bytes(Vector3i *input, s8 *output) {
    Vector3i local;
    local = *input;
    local.x = *(volatile s32 *)&local.x;
    local.y = *(volatile s32 *)&local.y;
    local.z = *(volatile s32 *)&local.z;
    matrix_stack_transform_point(&local, &D_80078440);
    output[0] = (D_80078440.x + 0x200) >> 10;
    output[1] = (D_80078444 + 0x200) >> 10;
    output[2] = (D_80078448 + 0x200) >> 10;
}
