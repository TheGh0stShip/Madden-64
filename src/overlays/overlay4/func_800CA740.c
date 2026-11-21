#include "types.h"

typedef struct {
    u8 pad00[0x28];
    u16 unk_28;
} Obj800C8EA0;

extern s32 D_80080C10;
extern s32 D_80087A70;
extern u8 D_80087AB0;
extern void *D_80087ABC;
extern s16 D_80089320;
extern u16 D_8008A5B2;

extern void func_800C7368(void);
extern void func_800C1368(void);
extern void func_800C5F80(void);

s32 func_800C8EA0(Obj800C8EA0 *arg0) {
    if (!(arg0->unk_28 & 8)) {
        if (!(D_80080C10 & 8)) {
            if (D_80087A70 != 0x7FFFFFFF) {
                func_800C7368();
                D_80080C10 &= ~0x100;
                if (D_80089320 != 0) {
                    D_8008A5B2 = 6;
                    func_800C1368();
                }
                D_80087AB0 = 0x12;
                D_80087ABC = arg0;
                func_800C5F80();
                return 1;
            }
        }
    }
    return 0;
}
