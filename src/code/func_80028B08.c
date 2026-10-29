#include "types.h"

typedef struct {
    u8 data[0x134];
} Blob28B08;

void *func_80032E00(s32, s32);
void func_80032F3C(s32, void *);
void func_800E2068(char *, void *, s32);
void func_800E2190(char *, void *, s32);
extern char D_80001190[];
extern Blob28B08 D_800C2EF0;

void func_80028B08(void) {
    Blob28B08 *buf;

    buf = func_80032E00(0, 0x134);
    func_800E2068(D_80001190, buf, 0);
    *buf = D_800C2EF0;
    func_800E2190(D_80001190, buf, 0);
    func_80032F3C(0, buf);
}
