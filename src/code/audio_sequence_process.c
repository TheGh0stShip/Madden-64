#include "types.h"
/* Field access at a byte offset from a base whose layout is not yet named. */
#define M2C_FIELD(expr, type_ptr, offset) (*(type_ptr)((s8 *)(expr) + (offset)))

#ifndef NULL
#define NULL 0
#endif
extern u8 D_80082DBC[];
extern u8 D_80082DC1[];

extern s32 func_800393E0(u8 value);
s32 func_800A365C(s32);                     /* extern */
s32 func_800BE1B0(s32);                         /* extern */
s32 func_800DEC38();                                /* extern */
extern s32 D_8006B190;
extern u16 D_8006B7AA;
extern s16 D_8006B7BC;
extern u16 D_8006B7BE;
extern s32 D_80080C10;
typedef struct {
    s32 stats;
    s32 roster;
    u8 *info;
    s16 mode;
    u8 pad[0x214C - 0xE];
} TeamState;
extern TeamState D_80082DB4[];
extern s32 D_80082DB8;
extern s16 D_80082DC0;
extern s32 D_80084F00;
extern s32 D_80084F04;
extern s16 D_80084F0C;
extern s16 D_80085024;
extern s16 D_800857B4;
extern s32 D_80085A30;
extern u8 D_800876D0;
extern s32 D_80087894;
extern u8 D_800879A4[];
extern u8 D_800879A6;
extern u8 D_800879A7[];
extern u8 D_800879A8;
extern u8 D_80087FE4[];
extern u8 D_80087FE6;
extern u8 D_80087FE7[];
extern u8 D_80087FE8;
extern s32 D_80088094;
extern s16 D_800886E0;
extern s16 D_80088AE4;
extern s16 D_80089320;
extern u8 **D_800895DC;
extern u16 *D_8006B634[];
typedef struct { void *ptr; u8 pad[0x24]; } AudioBank;
extern AudioBank D_80072E08[];
extern u16 D_8008A5B2;
extern s8 D_8008B618;

void audio_sequence_process(void) {
    u8 hdr;
    u8 *info;
    u8 t0, t1, t2, t3, t4;
    u16 i;
    u16 count;
    u16 *list;
    u8 *entry;
    s32 temp_a0;
    s32 temp_a0_2;
    s32 temp_a0_7;
    s32 temp_a0_8;
    s32 temp_a0_9;
    s32 temp_v0;
    s32 temp_v0_2;
    s32 temp_v0_3;
    s32 temp_v0_4;
    s32 temp_v1;
    s32 temp_v1_2;
    s32 temp_v1_3;
    s32 var_a1_2;
    s32 var_v0;
    s32 var_v1_2;
    u16 *temp_v1_4;
    u16 *var_v1;
    u16 temp_t0;
    u32 temp_a0_3;
    u8 *var_a2;
    u8 temp_a0_6;
    u8 temp_a1;
    u8 temp_a2;
    u8 temp_a3;
    u8 temp_a3_2;
    u8 temp_t0_2;
    u8 temp_v1_5;
    u8 var_a1;
    u8 var_v0_2;
    void *temp_a0_4;
    void *temp_a0_5;

    D_80080C10 &= ~0x1C0;
    if (D_8006B7BC != -1) {
        D_80082DB4[D_80088AE4].mode = (s16) D_8006B7BC;
    } else {
        temp_v0 = D_80088AE4;
        D_80082DB4[temp_v0].mode = (s16) (*D_80082DB4[temp_v0].info & 0x1F);
    }
    if (D_80089320 == -1) {
        if (!(D_80080C10 & 0x10000000)) {
            D_80082DB4[D_800886E0].mode = (u16) D_8006B7BE;
        } else {
            D_80082DB4[D_800886E0].mode = 7;
        }
    } else {
        temp_v0_2 = D_800886E0;
        D_80082DB4[temp_v0_2].mode = (s16) (*D_80082DB4[temp_v0_2].info & 0x1F);
    }
    if (!(D_8006B7AA & 0x2000)) {
        D_8008B618 = 0;
        D_80082DB4[0].roster = D_80087894 + (D_80082DB4[0].mode * 0x84);
        D_80082DB4[0].stats = D_80088094 + (D_80082DB4[0].mode * 0x28);
        D_80082DB4[1].roster = D_80087894 + (D_80082DB4[1].mode * 0x84);
        D_80082DB4[1].stats = D_80088094 + (D_80082DB4[1].mode * 0x28);
    } else if ((s16)func_800393E0(M2C_FIELD((s8 *)&D_80082DC1 + (D_80088AE4 * 0x214C), u8 *, 0)) == 0) {
        temp_v1 = D_80088AE4;
        D_80082DB4[temp_v1].roster = (s32) (D_80087894 + (D_80082DB4[temp_v1].mode * 0x84));
        D_80082DB4[temp_v1].stats = (s32) (D_80088094 + (D_80082DB4[temp_v1].mode * 0x28));
        temp_v0_3 = D_800886E0;
        D_8008B618 = 0;
        var_a2 = D_80087894 + (D_80082DB4[temp_v0_3].mode * 0x84);
        D_80082DB4[temp_v0_3].roster = var_a2;
        D_80082DB4[temp_v0_3].stats = (s32) (D_80088094 + (D_80082DB4[temp_v0_3].mode * 0x28));
    } else {
        temp_v1_2 = D_80088AE4;
        D_80082DB4[temp_v1_2].roster = (s32) (D_80085A30 + (D_80082DB4[temp_v1_2].mode * 0x84));
        D_80082DB4[temp_v1_2].stats = (s32) (D_80088094 + (D_80082DB4[temp_v1_2].mode * 0x28));
        temp_v1_3 = D_800886E0;
        D_8008B618 = 1;
        D_80082DB4[temp_v1_3].roster = (s32) (D_80087894 + (D_80082DB4[temp_v1_3].mode * 0x84));
        D_80082DB4[temp_v1_3].stats = (s32) (D_80088094 + (D_80082DB4[temp_v1_3].mode * 0x28));
    }
    D_80085024 = 0;
    D_800857B4 = -1;
    hdr = *D_80082DB4[D_80088AE4].info;
    if ((hdr & 0x60) == 0x20) {
        D_80080C10 |= 0x40;
        for (i = 0; i < 5; i++) {
            D_80087FE4[i] = (D_80082DB4[D_80088AE4].info + i)[1] >> 4;
            D_800879A4[i] = (D_80082DB4[D_80088AE4].info + i)[1] & 0xF;
        }
        D_80085024 = i;
    } else if (D_80089320 != -1 && (hdr & 0x60) != 0x60) {
        list = D_8006B634[hdr & 0x1F];
        count = *list++;
        entry = NULL;
        for (i = 0; i < count; i++) {
            entry = D_800895DC[*list + 1];
            if ((*entry & 0x60) == 0x20) {
                break;
            }
            list++;
        }
        if (i != count) {
            for (i = 0; i < 5; i++) {
                D_80087FE4[i] = (entry + i)[1] >> 4;
                D_800879A4[i] = (entry + i)[1] & 0xF;
            }
            D_80085024 = i;
        }
    }
    info = D_80082DB4[D_80088AE4].info;
    if ((info[0] & 0x60) == 0x40) {
        if (!(D_8006B7AA & 0x2000)) {
            D_800876D0 = info[1];
        } else {
            D_800876D0 = 9 - info[1];
        }
    }
    if ((s16)func_800393E0(M2C_FIELD((s8 *)&D_80082DC1 + (D_80088AE4 * 0x214C), u8 *, 0)) != 0 && (D_8006B7AA & 0x2000)) {
        switch (func_800DEC38()) {
        case 3:
            if (D_80072E08[D_80082DB4[D_80088AE4].mode].ptr != &D_8006B190) {
        case 4:
                if (D_80085024 == 5) {
                    t0 = D_800879A4[3];
                    D_800879A4[3] = D_800879A4[4];
                    D_800879A4[4] = t0;
                    t0 = D_80087FE4[3];
                    D_80087FE4[3] = D_80087FE4[4];
                    D_80087FE4[4] = t0;
                    t0 = D_800879A4[0];
                    D_800879A4[0] = D_800879A6;
                    D_800879A6 = t0;
                    t0 = D_80087FE4[0];
                    D_80087FE4[0] = D_80087FE6;
                    D_80087FE6 = t0;
                }
                break;
            }
        case 0:
        case 1:
        case 2:
            if (D_80085024 == 5) {
                t1 = D_800879A4[3];
                D_800879A4[3] = D_800879A4[4];
                D_800879A4[4] = t1;
                t1 = D_80087FE4[3];
                D_80087FE4[3] = D_80087FE4[4];
                D_80087FE4[4] = t1;
                t1 = D_80087FE4[0];
                D_80087FE4[0] = D_80087FE4[2];
                D_80087FE4[2] = t1;
            }
            break;
        }
    }
    if ((*M2C_FIELD((s8 *)&D_80082DBC + (D_80088AE4 * 0x214C), u8 **, 0) & 0x60) == 0x60) {
        if (D_80089320 != -1) {
            temp_a0_7 = D_80080C10 | 0x100;
            D_80080C10 = temp_a0_7;
            if (D_8008A5B2 == 1) {
                if (temp_a0_7 & 2) {
                    func_800BE1B0(temp_a0_7);
                }
                func_800A365C(3);
            }
            goto block_54;
        }
        goto block_55;
    }
block_54:
    if (D_80089320 == -1) {
block_55:
        temp_a0_8 = D_80080C10 | 0x100;
        D_80080C10 = temp_a0_8;
        if (D_8008A5B2 == 1) {
            if (temp_a0_8 & 4) {
                func_800BE1B0(temp_a0_8);
            }
            func_800A365C(3);
        }
    }
    if (((u32) (D_8006B7AA - 0x13) < 2U) || ((u32) (D_8006B7AA - 0x18) < 2U)) {
        temp_a0_9 = D_80080C10 | 0x100;
        D_80080C10 = temp_a0_9;
        if (D_8008A5B2 == 1) {
            if (temp_a0_9 & 2) {
                func_800BE1B0(temp_a0_9);
            }
            func_800A365C(3);
        }
    }
}
