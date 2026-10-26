#include "types.h"

typedef struct ResourceCleanup {
    void *field00; void *field04; void *field08; u8 pad0C[0x14];
    void *field20; void *field24; void *field28; u8 pad2C[4]; u32 flags;
    u8 pad34[0xC]; void *field40; void *field44;
} ResourceCleanup;

extern void *D_8008A700;
extern void func_8001A8A8(void *);
extern void func_80032F3C(s32, void *);
extern void func_800332C8(void *, void *);

void func_800173C0(ResourceCleanup *item)
{
    if (!(item->flags & 0x20)) {
        if (item->flags & 0x100) {
            func_8001A8A8(item->field28);
            func_80032F3C(0, item->field28);
            if (item->flags & 0x200) {
                if (item->field20 != 0) func_80032F3C(0, item->field20);
                if (item->field24 != 0) func_80032F3C(0, item->field24);
            }
        }
        if (!(item->flags & 0x80)) func_80032F3C(0, item->field04);
        if (item->field40 != 0) {
            func_80032F3C(0, item->field40);
            item->field44 = 0;
            item->field40 = 0;
        }
        if (item->field00 != 0) {
            func_80032F3C(0, item->field00);
            item->field00 = 0;
        }
        if (!(item->flags & 4)) {
            if (!(item->flags & 0x4008)) {
                if (item->field08 != 0) func_80032F3C(0, item->field08);
            }
        }
    }
    if (item->flags & 0x400) func_800332C8(D_8008A700, item->field20);
}
