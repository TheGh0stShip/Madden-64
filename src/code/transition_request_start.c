#include "types.h"

extern s16 D_800740E0;
extern s32 D_800712C8;
extern s32 D_800734F8;
extern u32 D_800876C0;
extern s32 D_80086DE0;
extern u8 D_80041D24[];
extern void func_8002FEA4(void* callback, s32 mode, s32 value);

void func_80041C48(u16 request) {
    if (D_800740E0 != 0) {
        if (D_800712C8 == 0) {
            request = (u16)request;
            if (request != 0) {
                if (request != 0xFFFF) {
                    if (D_800734F8 == -1) {
                        D_800712C8 = 1;
                        D_800876C0 = request;
                        D_80086DE0 = 40;
                        func_8002FEA4(D_80041D24, 2, 1);
                    }
                }
            }
        }
    }
}
