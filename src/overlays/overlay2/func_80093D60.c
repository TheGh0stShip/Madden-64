#include "types.h"

typedef struct {
    u16 unk_0;
    u16 id;
} Unk80093D60Entry;

typedef struct {
    u16 ids[0x214C / 2];
} Unk80080CFC;

extern Unk80080CFC D_80080CFC[];
void func_80032F3C(s32, Unk80093D60Entry *);
s32 func_8003FBF8(u16, s32);
Unk80093D60Entry *func_800D3FF4(s32, s32, s32, s32, s32);

void func_80093D60(s32 arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4, u32 arg5, s32 *arg6)
{
    Unk80093D60Entry *list;
    s32 k;
    u32 count;
    s32 i;
    u16 id;

    count = 0;
    list = func_800D3FF4(arg4 | 0x80004, 10, arg0, arg1, arg3);
    for (k = 0; count < arg5; k++) {
            id = list[k].id;
            for (i = 0; i < *arg6; i++) {
                if (D_80080CFC[arg2].ids[i] == id) {
                    break;
                }
            }
            if (D_80080CFC[arg2].ids[i] != id) {
                if (func_8003FBF8(id, 0) == 11) {
                    D_80080CFC[arg2].ids[*arg6] = id;
                    count++;
                    (*arg6)++;
                }
            }
    }
    func_80032F3C(0, list);
}
