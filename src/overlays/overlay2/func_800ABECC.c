#include "types.h"

typedef struct {
    u8 unk0;
    u8 kind;
    u8 unk2[4];
} Entry6;

extern Entry6 D_800C5C43[];

void func_800ABECC(u16 index, char *out) {
    if (D_800C5C43[index].kind == 9) {
        out[0] = ' ';
    } else {
        out[0] = '-';
    }
    out[1] = 0;
}
