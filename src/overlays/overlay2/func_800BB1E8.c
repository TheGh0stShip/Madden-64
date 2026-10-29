#include "types.h"

typedef struct {
    s32 v[9];
} Flags9;

extern Flags9 D_80002D58;
extern s32 D_80086E4C;
extern s32 D_80086E50;
extern s32 D_800892E0;
extern s32 D_800892E4;
extern s32 D_800892F8;

void func_800BB1E8(s32 index) {
    Flags9 flags = D_80002D58;

    if (flags.v[index] != 0) {
        D_80086E4C = 0;
        D_80086E50 = D_800892F8;
    } else {
        D_80086E4C = D_800892E0;
        D_80086E50 = D_800892E4;
    }
}
