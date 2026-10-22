#include "types.h"

void func_800BF1C8(void);
void func_800BCFBC(void);

void func_800C396C(s16 mode) {
    *(s16*)0x80087AC2 = mode;
    func_800BF1C8();
    func_800BCFBC();
}
