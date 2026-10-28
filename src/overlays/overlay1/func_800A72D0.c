#include "types.h"

extern s32 D_80069E78[];
extern s32 D_8007A080;

void func_80034D30(s32, s32, s32);
s32 func_80093F0C(void);

s32 func_800A72D0(s32 id) {
    s32 result = 0;
    s32 i;
    s32 j;

    if (id != 0) {
        if (func_80093F0C() == 0) {
            return 0;
        }
        if (D_8007A080 != 0) {
            for (i = 0; i < 3; i++) {
                if (D_80069E78[i] == D_8007A080) {
                    break;
                }
            }
            for (j = 0; j < 3; j++) {
                if (D_80069E78[j] == id) {
                    break;
                }
            }
            if (j < i) {
                result = 1;
            }
        } else {
            result = 1;
        }
        if (result != 0) {
            D_8007A080 = id;
            func_80034D30(id, 2, 0);
        }
    } else {
        result = 1;
        D_8007A080 = 0;
    }
    return result;
}
