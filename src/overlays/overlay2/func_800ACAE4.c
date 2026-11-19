#include "m2c.h"

M2C_UNK func_80092B98();                            /* extern */
M2C_UNK func_80094028();                            /* extern */
M2C_UNK func_80094080();                            /* extern */
s32 func_800ACFA4();                             /* extern */
M2C_UNK func_800E1418();                     /* extern */
s16 func_800E154C();                             /* extern */
M2C_UNK func_800E1F28();                            /* extern */
extern s16 D_80084F6C;

s32 func_800ACAE4(void) {
    s16 done = 0;
    s32 result = 1;
    s32 tries = 0;
    s16 r;
    s16 saved;

    func_80094028();
    func_80092B98();
    func_80092B98();
    do {
        r = func_800E154C(D_80084F6C);
        if (r == 0) {
            done = 1;
        } else if (r == 3 && (func_80094080(), func_80092B98(), func_80092B98(), func_80092B98(), func_80092B98(), (s16) func_800ACFA4(D_80084F6C) == 0)) {
            done = 1;
            func_80094028();
            func_80092B98();
            func_80092B98();
            func_800E1F28();
        } else {
            saved = D_80084F6C;
            func_80094028();
            func_80092B98();
            func_80092B98();
            func_800E1418(0);
            if (D_80084F6C == saved) {
                result = 0;
                done = 1;
            }
        }
        tries++;
        if ((u8) tries >= 4) {
            done = 1;
        }
    } while (!done);
    func_80094080();
    func_80092B98();
    func_80092B98();
    func_80092B98();
    func_80092B98();
    return result;
}
