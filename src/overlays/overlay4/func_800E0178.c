#include "types.h"

typedef struct {
    u8 *unk0;
    u8 *unk4;
    u8 *unk8;
    u8 *unkC;
} Tables;

extern Tables *D_8007A178;
extern s16 D_80088AE4;
extern s16 D_800886E0;
extern s16 D_800892B2;
extern s16 D_8006B7AA;
extern u8 **D_800895DC;
extern u8 D_80080C90[][8524];
extern u8 D_80080CEE[][8524];
extern u8 D_80080CEF[][8524];
u8 *func_80032E00(s32 arg0, s32 size);
void func_80032F3C(s32 arg0, u8 *ptr);
void func_800E2178(s32 len, u8 *data);
u16 func_800E2248(void);

s16 func_800DE8D8(s16 arg0) {
    u8 *p;
    u8 *entry;
    u8 *record;
    u8 *buf;
    u8 key;
    u16 n;
    u16 i;
    s32 flag;
    s32 j;
    s32 step;
    s32 t;
    s32 cur;
    s32 next;

    if (arg0 == 0) {
        p = D_8007A178->unk0;
        key = p[D_80080C90[D_80088AE4][0] + 1];
    } else {
        p = D_8007A178->unk4;
        key = p[D_80080C90[D_800886E0][0] + 1];
    }
    if (arg0 == 0) {
        p = D_8007A178->unk8;
    } else {
        p = D_8007A178->unkC;
    }
    entry = p;
    p += (D_800892B2 + 1) * 4;
    record = entry + (p[0] + (p[1] << 8) + (p[2] << 16) + (p[3] << 24));
    n = record[4];
    p = record + 5;
    entry = p + n;
    if (n != 0) {
        for (i = 0; i < n; i++, p++) {
            if (*p == key) {
                break;
            }
        }
        if (i < n) {
            p = entry + i * 2;
            entry += p[0] << 8;
            entry += p[1];
        } else {
            entry += n * 2;
        }
    }
    n = entry[0];
    p = entry + 1;
    if (entry[1] != 0) {
        func_800E2178(n, p);
    } else {
        flag = 1;
        buf = func_80032E00(0, n);
        if (D_8006B7AA != -1) {
            flag = (*D_800895DC[(D_8006B7AA & 0x1FFF) + 1] & 0x60) != 0x20;
        }
        if (flag) {
            t = D_80080CEE[D_800886E0][0];
        } else {
            t = D_80080CEF[D_800886E0][0];
        }
        step = 100 / n;
        cur = 100;
        next = step;
        for (j = 0; j < n; j++) {
            buf[j] = cur - ((cur - next) * t) / 29;
            next += step;
            cur -= step;
        }
        func_800E2178(n, buf);
        func_80032F3C(0, buf);
    }
    p += n;
    p += func_800E2248() * 2;
    n = p[0] << 8;
    n += p[1];
    return n;
}
