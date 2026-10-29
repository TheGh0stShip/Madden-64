#include "types.h"

typedef struct {
    u16 values[0x214C / 2];
} FrameHalfwords;

extern FrameHalfwords D_80080CFC[];
s16 func_80023C60(u16, u16, u16);

s16 func_80023D44(u16 arg0, u16 arg1, u16 arg2, u16 arg3) {
    s16 denom;

    if (D_80080CFC[arg0].values[arg1] == 0xFFFF) {
        return -0x8000;
    }
    denom = func_80023C60(arg0, arg1, arg3);
    if (denom == 0) {
        return 0;
    }
    return (func_80023C60(arg0, arg1, arg2) * 100) / denom;
}
