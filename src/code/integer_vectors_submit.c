#include "types.h"

typedef struct IntegerVector3 {
    s32 x;
    s32 y;
    s32 z;
} IntegerVector3;

extern f32 D_80002E88;
extern void func_8000F344(void *object, f32 first_x, f32 first_y,
                          f32 first_z, f32 second_x, f32 second_y,
                          f32 second_z);

void integer_vectors_submit(void *object, IntegerVector3 *first,
                            IntegerVector3 *second)
{
    f32 scale = D_80002E88;

    func_8000F344(object,
                  first->x * scale,
                  first->y * scale,
                  first->z * scale,
                  second->x * scale,
                  second->y * scale,
                  second->z * scale);
}
