#include "types.h"

u16 func_800D20A0(u8 *, u16, u16);
void func_800167FC(s16, char *);
void func_8003E850(u16, char *);
char *strcpy(char *, const char *);

void func_800AFA50(u8 *roster, u16 slot, char *buf, u16 field) {
    switch (field) {
        case 0:
            func_800167FC(func_800D20A0(roster, slot, 0), buf);
            break;
        case 1:
            func_8003E850(func_800D20A0(roster, slot, 1), buf);
            break;
        case 0x12:
            if (func_800D20A0(roster, slot, 0x12) == 0) {
                strcpy(buf, "L");
            } else {
                strcpy(buf, "R");
            }
            break;
        default:
            func_800167FC(func_800D20A0(roster, slot, field) * 100 / 253, buf);
            break;
    }
}
