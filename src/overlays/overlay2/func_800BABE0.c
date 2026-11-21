#include "types.h"

typedef struct {
    u32 unk_0;
    char *unk_4;
} Unk800877BC;

typedef struct {
    u8 unk_00[0x10];
    s16 unk_10[18];
} Unk800895EC;

extern u32 D_800877BC[];
extern Unk800895EC *D_800895EC;
extern u32 D_800E6BDC[];
extern char D_800E7B90[][7];
void func_800167FC(s16, char *);
void func_8001EC20(void *, s32);

void func_800BABE0(u16 start, void *arg1)
{
    u16 count = 0;
    u16 i = 0;
    s32 slot;
    s32 idx;

    for (; count < 5; i++) {
        slot = start + i;
        if (slot >= 18) {
            break;
        }
        if (D_800895EC->unk_10[slot] != -1) {
            idx = count * 2;
            D_800877BC[idx] = D_800E6BDC[slot];
            func_800167FC(D_800895EC->unk_10[slot], D_800E7B90[count]);
            D_800877BC[idx + 1] = (u32)D_800E7B90[count];
            if (arg1 != 0) {
                func_8001EC20(arg1, idx + 15);
                func_8001EC20(arg1, idx + 16);
            }
            count++;
        }
    }
}
