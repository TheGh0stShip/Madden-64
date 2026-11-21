#include "types.h"

typedef struct {
    u8 id;
    s8 unk1;
    s8 unk2;
} Pick;

typedef struct {
    u8 pad[0x60];
    u8 unk_60;
    u8 unk_61;
} PlayerInfo;

typedef struct {
    s16 unk_00;
    Pick picks[12];
} Table;

extern Table D_800C5A38;

#define PICK(n) ((Pick *)((u8 *)&D_800C5A38 + 2) + (n))
PlayerInfo *func_8003A7B8(u16);
u8 func_8009024C(s16, s16);
void func_80090030(Pick *);
Pick *func_80090090(Pick *, Pick *);
void func_80090540(Pick *);
void func_800905F8(Pick *);
void *memcpy(void *, const void *, unsigned int);

void func_8008F9BC(void) {
    s16 lists[6][8];
    struct { s16 a; s8 b; } tmp;
    s16 i;
    s16 n0, n1, n2, n3, n4, n5;
    PlayerInfo *info;

    n5 = 0;
    n4 = 0;
    n3 = 0;
    n2 = 0;
    n1 = 0;
    n0 = 0;
    for (i = 0; i < 30; i++) {
        info = func_8003A7B8(i);
        switch (info->unk_60) {
            case 1:
                switch (info->unk_61) {
                    case 0:
                        lists[0][n0] = i;
                        n0++;
                        break;
                    case 1:
                        lists[1][n1] = i;
                        n1++;
                        break;
                    case 2:
                        lists[2][n2] = i;
                        n2++;
                        break;
                }
                break;
            case 0:
                switch (info->unk_61) {
                    case 0:
                        lists[3][n3] = i;
                        n3++;
                        break;
                    case 1:
                        lists[4][n4] = i;
                        n4++;
                        break;
                    case 2:
                        lists[5][n5] = i;
                        n5++;
                        break;
                }
                break;
        }
    }

    D_800C5A38.picks[0].id = func_8009024C(lists[0][0], lists[0][1]);
    for (i = 2; i < 5; i++) {
        D_800C5A38.picks[0].id = func_8009024C(D_800C5A38.picks[0].id, lists[0][i]);
    }
    func_80090030(&D_800C5A38.picks[0]);

    D_800C5A38.picks[1].id = func_8009024C(lists[1][0], lists[1][1]);
    for (i = 2; i < 5; i++) {
        D_800C5A38.picks[1].id = func_8009024C(D_800C5A38.picks[1].id, lists[1][i]);
    }
    func_80090030(&D_800C5A38.picks[1]);
    if (func_80090090(&D_800C5A38.picks[0], &D_800C5A38.picks[1]) != &D_800C5A38.picks[0]) {
        memcpy(&tmp, PICK(1), 3);
        memcpy(PICK(1), PICK(0), 3);
        memcpy(PICK(0), &tmp, 3);
    }

    D_800C5A38.picks[2].id = func_8009024C(lists[2][0], lists[2][1]);
    for (i = 2; i < 5; i++) {
        D_800C5A38.picks[2].id = func_8009024C(D_800C5A38.picks[2].id, lists[2][i]);
    }
    func_80090030(&D_800C5A38.picks[2]);
    if (func_80090090(&D_800C5A38.picks[1], &D_800C5A38.picks[2]) != &D_800C5A38.picks[1]) {
        if (func_80090090(&D_800C5A38.picks[1], &D_800C5A38.picks[0]) != &D_800C5A38.picks[0]) {
            memcpy(&tmp, PICK(0), 3);
            memcpy(PICK(0), PICK(2), 3);
            memcpy(PICK(2), &tmp, 3);
        }
        memcpy(&tmp, PICK(1), 3);
        memcpy(PICK(1), PICK(2), 3);
        memcpy(PICK(2), &tmp, 3);
    }

    D_800C5A38.picks[3].id = 0xFF;
    D_800C5A38.picks[4].id = 0xFF;
    D_800C5A38.picks[5].id = 0xFF;
    func_80090540(&D_800C5A38.picks[3]);
    func_80090540(&D_800C5A38.picks[4]);
    func_80090540(&D_800C5A38.picks[5]);

    D_800C5A38.picks[6].id = func_8009024C(lists[3][0], lists[3][1]);
    for (i = 2; i < 5; i++) {
        D_800C5A38.picks[6].id = func_8009024C(D_800C5A38.picks[6].id, lists[3][i]);
    }
    func_80090030(&D_800C5A38.picks[6]);

    D_800C5A38.picks[7].id = func_8009024C(lists[4][0], lists[4][1]);
    for (i = 2; i < 5; i++) {
        D_800C5A38.picks[7].id = func_8009024C(D_800C5A38.picks[7].id, lists[4][i]);
    }
    func_80090030(&D_800C5A38.picks[7]);
    if (func_80090090(&D_800C5A38.picks[6], &D_800C5A38.picks[7]) != &D_800C5A38.picks[6]) {
        memcpy(&tmp, PICK(7), 3);
        memcpy(PICK(7), PICK(6), 3);
        memcpy(PICK(6), &tmp, 3);
    }

    D_800C5A38.picks[8].id = func_8009024C(lists[5][0], lists[5][1]);
    for (i = 2; i < 5; i++) {
        D_800C5A38.picks[8].id = func_8009024C(D_800C5A38.picks[8].id, lists[5][i]);
    }
    func_80090030(&D_800C5A38.picks[8]);
    if (func_80090090(&D_800C5A38.picks[7], &D_800C5A38.picks[8]) != &D_800C5A38.picks[7]) {
        if (func_80090090(&D_800C5A38.picks[7], &D_800C5A38.picks[6]) != &D_800C5A38.picks[6]) {
            memcpy(&tmp, PICK(6), 3);
            memcpy(PICK(6), PICK(8), 3);
            memcpy(PICK(8), &tmp, 3);
        }
        memcpy(&tmp, PICK(7), 3);
        memcpy(PICK(7), PICK(8), 3);
        memcpy(PICK(8), &tmp, 3);
    }

    D_800C5A38.picks[9].id = 0xFF;
    D_800C5A38.picks[10].id = 0xFF;
    D_800C5A38.picks[11].id = 0xFF;
    func_800905F8(&D_800C5A38.picks[9]);
    func_800905F8(&D_800C5A38.picks[10]);
    func_800905F8(&D_800C5A38.picks[11]);
}
