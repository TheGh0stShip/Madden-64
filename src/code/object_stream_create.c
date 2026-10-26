#include "types.h"

extern void *func_800649EC(void *object);
extern void func_800649F4(void *object);
extern u8 *func_80064930(void *object, s32 size);
extern void object_stream_initialize(void);
extern void func_800637A4(void);
extern void func_8006389C(void);
extern void func_800639CC(void);
extern void func_80063B0C(void);
extern void func_80063BD8(void);
extern void object_stream_update(void);
extern void object_stream_finalize(void);
extern void object_stream_commit(void);
extern void object_stream_complete(void);
extern void func_80064790(void);

void func_800647F0(u8 *object_arg)
{
    register u8 *object __asm__("$17");
    register u8 *state __asm__("$16");
    register void *saved __asm__("$18");
    register u8 *cursor __asm__("$3");
    register s32 index __asm__("$4");

    object = object_arg;
    __asm__("" : "=r"(object) : "0"(object));
    *(u32 *)(object + 4) = 0;
    saved = func_800649EC(object_arg);
    state = func_80064930(object, 0x50);
    __asm__("" : "=r"(state) : "0"(state));
    if (state == 0) {
        __asm__("" : "=r"(state) : "0"(state));
        func_800649F4(object);
        {
            register u8 *inner_v1 __asm__("$3");
            register u8 *inner_v0 __asm__("$2");
            inner_v1 = *(u8 **)object;
            *(s32 *)(inner_v1 + 0x14) = 0x35;
            inner_v0 = *(u8 **)object;
            *(s32 *)(inner_v0 + 0x18) = 0;
            inner_v0 = *(u8 **)object;
            (*(void (**)(void *))inner_v0)(object);
        }
    }

    *(void (**)(void))(state + 0x00) = object_stream_initialize;
    *(void (**)(void))(state + 0x04) = func_800637A4;
    *(void (**)(void))(state + 0x08) = func_8006389C;
    *(void (**)(void))(state + 0x0C) = func_800639CC;
    *(void (**)(void))(state + 0x10) = func_80063B0C;
    *(void (**)(void))(state + 0x14) = func_80063BD8;
    *(void (**)(void))(state + 0x18) = object_stream_update;
    *(void (**)(void))(state + 0x1C) = object_stream_finalize;
    *(void (**)(void))(state + 0x20) = object_stream_commit;
    *(void (**)(void))(state + 0x24) = object_stream_complete;
    *(void (**)(void))(state + 0x28) = func_80064790;
    *(void **)(state + 0x2C) = saved;

    index = 1;
    cursor = state + 4;
    do {
        *(u32 *)(cursor + 0x30) = 0;
        *(u32 *)(cursor + 0x38) = 0;
        __asm__ volatile("" : : : "memory");
        index--;
        cursor -= 4;
    } while (index >= 0);

    *(u32 *)(state + 0x40) = 0;
    *(u32 *)(state + 0x44) = 0;
    *(u32 *)(state + 0x48) = 0x50;
    *(u8 **)(object + 4) = state;
}
