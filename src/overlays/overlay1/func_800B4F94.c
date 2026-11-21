#include "types.h"

typedef struct {
    u8 pad00[0x98];
    u8 gap[2][7];
    u8 negative[2][7];
    s32 result[2][2];
    u8 first[2][2];
    u8 second[2][2];
    u8 mode[2];
} Board;

typedef struct {
    u16 unk_00;
    u16 count;
    s32 entries[1];
} Table;

extern Board *D_8006EA74;
extern s32 D_8006EA7C[7];
extern s32 D_8006EA98[7];
extern u8 D_8006EAB4[][2];
extern Table *D_800E5C7C[7];
extern Table *D_800E5C98[7];
extern Table *D_800E5DCC[7];
extern Table *D_800E5DE8[7];
extern Table D_800E5E04;
extern Table D_800E5E0C;

u16 func_80031964(void);
u16 func_80031A1C(u16);

void func_800B0870(void) {
    s32 sums[2];
    u8 used[2][2];
    u32 side;
    u32 i;
    s32 r;
    u8 j;
    u8 idx;
    u8 single;
    u8 first;
    u8 second;
    Table **tbl;

    sums[0] = sums[1] = 0;
    for (side = 0; side < 2; side++) {
        for (i = 0; i < 7; i++) {
            sums[side] += D_8006EA74->gap[side][i];
        }
    }
    used[0][0] = used[0][1] = used[1][0] = used[1][1] = 0xFF;
    for (side = 0; side < 2; side++) {
        for (j = 0; j < 2; j++) {
            idx = 0;
            r = func_80031A1C(sums[side]);
            while (r > 0) {
                r -= D_8006EA74->gap[side][idx];
                if (r <= 0) {
                    break;
                }
                idx++;
            }
            while (idx == used[side][0] || idx == used[side][1] || idx == used[side ^ 1][0] || idx == used[side ^ 1][1]) {
                idx = (idx + 1) % 7;
            }
            used[side][j] = idx;
            single = 0;
            switch (D_8006EAB4[D_8006EA74->mode[side]][j]) {
                case 0:
                    first = D_8006EA7C[idx];
                    second = D_8006EA98[idx];
                    tbl = D_800E5C7C;
                    if (D_8006EA74->negative[side][idx] == 1) {
                        tbl = D_800E5C98;
                    }
                    break;
                case 1:
                    first = D_8006EA98[idx];
                    second = D_8006EA7C[idx];
                    tbl = D_800E5DCC;
                    if (D_8006EA74->negative[side][idx] == 1) {
                        tbl = D_800E5DE8;
                    }
                    break;
                case 2:
                    second = D_8006EA7C[idx];
                    single = 1;
                    tbl = (Table **)&D_800E5E04;
                    first = second;
                    break;
                case 3:
                    second = D_8006EA7C[idx];
                    single = 1;
                    tbl = (Table **)&D_800E5E0C;
                    first = second;
                    break;
                case 4:
                    if (func_80031964() & 1) {
                        tbl = D_800E5DCC;
                        first = D_8006EA98[idx];
                        second = D_8006EA7C[idx];
                    } else {
                        tbl = D_800E5C7C;
                        first = D_8006EA7C[idx];
                        second = D_8006EA98[idx];
                    }
                    break;
            }
            if (single == 1) {
                r = func_80031A1C(((Table *)tbl)->count);
                D_8006EA74->result[side][j] = ((Table *)tbl)->entries[r];
            } else {
                r = func_80031A1C(tbl[idx]->count);
                D_8006EA74->result[side][j] = tbl[idx]->entries[r];
            }
            D_8006EA74->first[side][j] = first;
            D_8006EA74->second[side][j] = second;
        }
    }
}
