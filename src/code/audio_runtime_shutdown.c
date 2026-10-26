#include "types.h"

extern s32 D_80085028;
extern u8 D_80087B70[];
extern u16 D_80085D42;
extern void *D_8007A538;
extern void *D_80084F60[];
extern u8 D_800885F0[];
extern void *D_8008B348;

extern void func_80004B54(void);
extern void func_80035A7C(u16 value);
extern void func_8002FF70(void *node);
extern void func_8004CDA8(void *entry, s32 value, s32 count);
extern void func_80032F3C(s32 pool, void *allocation);

void audio_runtime_shutdown(void)
{
    register s32 counter __asm__("$17");
    register void **slot __asm__("$16");
    register u8 *entry __asm__("$18");
    register s32 more __asm__("$19");
    s32 offset;

    if (D_80085028 == 1) {
        func_80004B54();
        counter = 65;
        offset = 0x410;
        do {
            *(u32 *)(D_80087B70 + offset) = 0;
            offset -= 16;
        } while (counter-- != 0);
    }

    counter = 1;
    func_80035A7C(D_80085D42);
    slot = &D_80084F60[1];
    entry = D_800885F0 + 0x18;
    func_8002FF70(D_8007A538);
    do {
        more = counter;
        if (*slot != 0) {
            func_8004CDA8(entry, 0, 1);
            *slot = 0;
        }
        slot--;
        entry -= 0x18;
        counter--;
    } while (more != 0);

    __asm__("" : "=r"(more) : "0"(more));
    func_80032F3C(0, D_8008B348);
}
