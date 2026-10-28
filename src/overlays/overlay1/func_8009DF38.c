#include "types.h"

typedef struct {
    s32 x;
    s32 y;
    s32 z;
} Vec3;

void func_8002CBD4(void);
void func_8002CD28(s16);
void func_8002D884(Vec3 *);
void func_8002DB7C(void);
void func_8002DBD0(Vec3 *, Vec3 *);

void func_8009DF38(Vec3 *in, Vec3 *out) {
    Vec3 tmp;

    func_8002D884(&tmp);
    func_8002CBD4();
    func_8002DB7C();
    tmp.x = (in->x << 16) - tmp.x;
    tmp.y = (in->y << 16) - tmp.y;
    tmp.z = (in->z << 16) - tmp.z;
    func_8002DBD0(&tmp, out);
    func_8002D884(&tmp);
    out->x -= tmp.x;
    out->y -= tmp.y;
    out->z -= tmp.z;
    out->x >>= 16;
    out->y >>= 16;
    out->z >>= 16;
    func_8002CD28(out->z);
}
