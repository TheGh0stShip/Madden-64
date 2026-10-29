#include "types.h"

typedef struct {
    u8 pad00[0x12];
    u16 heading;
} HeadingSource;

extern void func_8002CAD0(void);
extern void func_8002D14C(u16 angle);
extern void func_8002DD68(s32 x, s32 y);
extern void func_8002CD28(void);

void func_800E2730(HeadingSource *src, s32 x, s32 y) {
    u16 angle;

    angle = 0x1000 - (src->heading & 0xFFF);
    func_8002CAD0();
    func_8002D14C(angle);
    func_8002DD68(x, y);
    func_8002CD28();
}
