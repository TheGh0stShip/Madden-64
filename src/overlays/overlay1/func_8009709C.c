#include "types.h"

typedef struct {
    u8 pad0[0x24];
    u16 *unk_24;
} Obj;

typedef struct {
    Obj *unk_00;
    s32 unk_04;
    s32 unk_08;
    u8 pad0C[0x214C - 0xC];
} Slot;

extern Slot D_80082DB4[];
extern s32 D_80064A9C[];
extern u16 D_8006B7AA[2];
extern s16 D_80088AE4;
extern s32 *D_800895DC;
void func_800920B8(s16 a, s32 b);
void func_80092664(s16 a);
void func_800BEE28(void);
void func_80092830(s16 a);
void indexed_runtime_slot_release(u16 a);

s32 func_80092978(s16 arg0, s32 flags) {
    s32 done;
    s32 i;

    done = 0;
    if (flags & 0x4000) {
        func_800920B8(arg0, 0);
        done = 1;
    } else if (flags & 0x8000) {
        func_800920B8(arg0, 1);
        done = 1;
    } else if (flags & 4) {
        func_800920B8(arg0, 2);
        done = 1;
    } else if (flags & 2) {
        func_80092664(arg0);
        done = 1;
    } else {
        if (D_80082DB4[arg0].unk_00->unk_24 != 0) {
        for (i = 0; done == 0 && i < 4; i++) {
            if (flags & D_80064A9C[i]) {
                func_800BEE28();
                if (arg0 == D_80088AE4) {
                    D_8006B7AA[0] = D_80082DB4[arg0].unk_00->unk_24[i] | (D_8006B7AA[0] & 0x2000);
                    D_80082DB4[arg0].unk_08 = D_800895DC[(D_8006B7AA[0] & 0x1FFF) + 1];
                } else {
                    D_8006B7AA[1] = D_80082DB4[arg0].unk_00->unk_24[i];
                    D_80082DB4[arg0].unk_08 = D_800895DC[(D_8006B7AA[1] & 0x1FFF) + 1];
                }
                func_80092830(arg0);
                done = 1;
            }
        }
        }
    }
    if (done == 1) {
        indexed_runtime_slot_release(arg0);
        return 1;
    }
    return 0;
}
