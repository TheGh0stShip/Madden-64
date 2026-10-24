#include "types.h"

extern s32 D_800712C8;
extern s8 D_800724A8;
extern s32 D_80085C08[];
extern u8 D_80086188;
extern s32 D_8008929C;

void func_800BC2E4(s32* source) {
    if (D_800712C8 == 0 && D_8008929C == 0 && D_800724A8 != 0) {
        s32 first = source[0];

        D_80086188 = 0;
        if (first != -1) {
            do {
                u32 index = D_80086188;

                D_80085C08[index] = source[index++];
                D_80086188 = index;
            } while (source[D_80086188] != -1);
        }
        D_8008929C = 1;
        D_80085C08[D_80086188] = -1;
    }
}
