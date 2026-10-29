#include "types.h"

typedef struct {
    u8 id;
    u8 pad[7];
} Key;

s16 func_800906B0(s16);
u8 *func_80090090(Key *, Key *);
void func_80090030(u8 *);

void func_80090540(u8 *out) {
    Key a;
    Key b;
    s16 best;
    s16 next;

    best = func_800906B0(-1);
    next = best;
    while (next < 30) {
        next = func_800906B0(next);
        if (next != 30) {
            a.id = best;
            b.id = next;
            best = *func_80090090(&a, &b);
        }
    }
    *out = best;
    func_80090030(out);
}
