#include "types.h"

typedef struct {
    s32 arg0;
    s32 arg1;
    s32 arg2;
    s8 (*run)(s32 arg0, s32 arg1, s32 arg2);
} ScriptStep;

extern s32 D_8007AB34;
extern ScriptStep D_80074C84[];
extern void func_800E57C8(void);

void func_800E7214(void) {
    s32 arg0;
    s8 advance;

    arg0 = D_80074C84[D_8007AB34].arg0;
    if (!(arg0 & 1)) {
        if (D_80074C84[D_8007AB34].run == 0) {
            return;
        }
        advance = D_80074C84[D_8007AB34].run(arg0, D_80074C84[D_8007AB34].arg1, D_80074C84[D_8007AB34].arg2);
        if (advance >= 0) {
            D_8007AB34 += advance;
            return;
        }
    }
    func_800E57C8();
}
