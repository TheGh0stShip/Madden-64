#include "types.h"
typedef struct { u8 data[0x28]; } Record;
extern Record D_80087960;
extern s32 D_80001A70;
Record *func_80032E00(s32, s32);
void func_80032F3C(s32, Record *);
void func_800E2068(s32 *, Record *, s32);

void func_80096604(void) {
    Record *buf = func_80032E00(0, 0x28);

    func_800E2068(&D_80001A70, buf, 0);
    D_80087960 = *buf;
    func_80032F3C(0, buf);
}
