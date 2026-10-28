#include "types.h"

extern s32 D_8006DB68;
extern s32 D_8006DB70;

void func_800167FC(s16, s32);
void func_8002E688(s32, s32 *);
s32 func_8004DF94(s32);

void func_80095324(s32 base, s32 first, s32 second, s32 *data) {
    func_800167FC(first, base);
    func_8002E688(base, data);
    func_800167FC(second, base + func_8004DF94(base));
    if (second != 1) {
        func_8002E688(base, &D_8006DB70);
    } else {
        func_8002E688(base, &D_8006DB68);
    }
}
