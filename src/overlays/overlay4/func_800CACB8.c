#include "types.h"

typedef struct { u8 a; u8 b; } Sp800CACB8;
extern s32 func_800C157C(void);
extern void func_800E1BCC(void *, Sp800CACB8 *);

void func_800CACB8(void *arg0) {
    Sp800CACB8 sp;
    sp.a = 5;
    sp.b = (u32)func_800C157C() >> 4;
    func_800E1BCC(arg0, &sp);
}
