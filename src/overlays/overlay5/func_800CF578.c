#include "types.h"

typedef struct {
    u8 unk_00[0x14];
    s32 unk_14;
    s32 unk_18;
    s8 *unk_1C;
    u8 unk_20[0x8];
} TeamRecord;

typedef struct {
    u8 unk_00[0x4C];
    s32 unk_4C[24];
    s32 unk_AC[24];
    u8 unk_10C[0x14];
    s32 unk_120;
    s32 unk_124;
} SlotState;

extern s8 D_800721B8[];
extern s8 D_800721C0[];
extern u8 D_8007A38C;
extern u8 D_80084FA8;
extern s32 D_80087784[];
extern s32 D_8008779C[];
extern TeamRecord *D_80088094;
extern s8 D_800892B0;

SlotState *func_800DD634(void);
s16 func_8002209C(u16, u16, u16);

void func_800CF578(s32 arg0, s32 arg1) {
    SlotState *state;
    u32 i;
    u32 j;
    u32 count;
    s8 *list;

    state = func_800DD634();
    state->unk_4C[18] = 0;
    state->unk_AC[13] = 0;
    for (i = 0; i < D_8007A38C; i++) {
        if (D_800892B0 == 0) {
            list = D_80088094[D_800721B8[i]].unk_1C;
        } else {
            list = D_80088094[D_800721C0[i]].unk_1C;
        }
        for (count = 0; list[count] != -1; count++) {
        }
        D_80087784[i] = D_80088094[*list].unk_18;
        state->unk_4C[i] = 0;
        state->unk_4C[6 + i] = 0;
        state->unk_4C[12 + i] = 0;
        state->unk_4C[18 + i] = 0;
        state->unk_AC[i] = 0;
        state->unk_AC[6 + i] = 0;
        state->unk_AC[12 + i] = 0;
        state->unk_AC[18 + i] = 0;
        for (j = 0; j < count; j++) {
            if (j != 5) {
                D_8008779C[j * 6 + i] = D_80088094[list[j]].unk_14;
                if (func_8002209C((s8)D_80084FA8, arg0, (s8)(u8)list[j]) != -1) {
                    state->unk_4C[j * 6 + i] = state->unk_120;
                }
                if (func_8002209C((s8)D_80084FA8, arg1, (s8)(u8)list[j]) != -1) {
                    state->unk_AC[j * 6 + i] = state->unk_124;
                }
            }
        }
    }
}
