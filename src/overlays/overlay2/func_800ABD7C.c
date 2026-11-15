#include "types.h"

extern u8 D_800C5C40[][6];
extern s8 D_800C48A0[];
extern s16 D_800C5016;
extern char D_8006BFA0[];
extern char D_800C2330[];

char *func_8008DDB8(s16 index, s8 value);
void func_8002E65C(char *dst, char *src);
void func_8002E688(char *dst, char *src);
void func_800167FC(u32 value, char *out);

void func_800ABD7C(u16 index, char *out) {
    s32 kind;
    u32 first;
    u32 second;
    char *text;
    char buffer[16];

    kind = D_800C5C40[index][4] & 0xF;
    if (kind == 8) goto compare;
    if (kind >= 9) goto high_kind;
    if (kind == 0) goto zero_kind;
    goto done;

high_kind:
    if (kind != 9) goto done;
    func_8002E65C(out, D_8006BFA0);
    goto done;

zero_kind:
    text = func_8008DDB8((s16)index, D_800C48A0[index]);
    func_8002E65C(out, text);
    goto done;

compare:
    if (D_800C5C40[index][0] == D_800C5016) {
        first = D_800C5C40[index][2];
        second = D_800C5C40[index][3];
    } else {
        first = D_800C5C40[index][3];
        second = D_800C5C40[index][2];
    }
    func_800167FC(first, buffer);
    func_8002E65C(out, buffer);
    func_8002E688(out, D_800C2330);
    func_800167FC(second, buffer);
    func_8002E688(out, buffer);

done:
    return;
}
