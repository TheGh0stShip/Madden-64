#include "types.h"
typedef struct { u8 data[0x28]; } Record;
extern Record D_80071978;
extern s32 D_80001A70;
Record *func_80032E00(s32, s32);
void func_80032F3C(s32, Record *);
void func_800E2278(s32 *, s32, s32);
void func_800E2068(s32 *, Record *, s32);
void func_800E2190(s32 *, Record *, s32);

void func_800962F0(void) {
    Record *buf;

    func_800E2278(&D_80001A70, 0x28, 0);
    buf = func_80032E00(0, 0x28);
    func_800E2068(&D_80001A70, buf, 0);
    *buf = D_80071978;
    func_800E2190(&D_80001A70, buf, 0);
    func_80032F3C(0, buf);
}
