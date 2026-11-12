#include "types.h"

extern u8 D_80087964;
extern s32 D_80088474;
extern u8 D_8008AFC6;
extern s32 D_8008B334;
extern void *D_80086178;
extern u8 D_80086CE8[];
extern u8 D_8008951A;

void func_800A2E4C(void *state, void *object);
void func_800D5D28(void *object);
void func_800B18DC(void);

void func_800CA508(void *object) {
    if (D_80087964 != D_80088474) {
        if (D_80087964 == 7) {
            s32 previous = D_8008AFC6;
            D_8008AFC6 = 1;
            D_8008B334 = previous;
        } else if (D_80088474 == 7) {
            s32 previous = D_8008AFC6;
            s32 current = D_8008B334;
            if (previous != current) {
                D_8008AFC6 = current;
                if ((current & 0xFF) == 0) {
                    func_800A2E4C(D_80086CE8, D_80086178);
                    D_8008951A = 0;
                }
            }
        }
    }
    func_800D5D28(object);
    func_800B18DC();
}
