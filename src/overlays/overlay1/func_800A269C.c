#include "types.h"

typedef struct {
    s32 *data;
    s32 unk04[3];
    s16 unk10;
} Request;

extern s32 D_80080C10;
extern s32 D_80084F34;
extern s32 D_800854A4;
extern s16 D_800876DC;
extern s32 D_800878E4;
extern s32 D_8008793C;
extern s16 D_80087AAC;
extern s8 D_8008AF70;
extern s32 D_800AEF88;

s16 func_8002098C(void);
void func_8009BD04(s32);
void func_800ABCA0(s32, s32);
void func_800AE924(Request *);

s32 func_800A269C(void) {
    Request request;

    if (func_8002098C() == 0 && D_8008793C != 0x03200000 && D_800878E4 != 0x03200000 &&
        D_800878E4 != D_80084F34 && !(D_80080C10 & 0x800000) &&
        (D_80087AAC != 0 || ((D_800876DC == 2) | (D_800876DC == 4)) == 0)) {
        request.data = &D_800AEF88;
        request.unk10 = 0;
        func_800AE924(&request);
        func_800ABCA0(0xA, 0);
        D_8008AF70 = 1;
        if ((((D_800876DC == 2) | (D_800876DC == 4)) != 0 || D_800876DC == 5) && D_80087AAC < 0x78) {
            func_8009BD04(2);
        }
        if (D_80080C10 & 0x200) {
            func_8009BD04(2);
        }
        D_800854A4 = 1;
        return 1;
    }
    return 0;
}
