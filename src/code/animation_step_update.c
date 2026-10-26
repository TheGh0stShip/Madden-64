#include "types.h"

extern void func_8001A224(void *animation);

s32 animation_step_update(u8 *animation)
{
    register u8 *saved_animation __asm__("$5") = animation;
    register u32 frame __asm__("$2");
    register u32 flags __asm__("$3");
    register u32 limit __asm__("$4");
    register u32 *state __asm__("$2");
    __asm__("" : "=r"(saved_animation) : "0"(saved_animation));

    frame = *(u16 *)(saved_animation + 0x12);
    flags = saved_animation[0];
    limit = *(u16 *)(saved_animation + 0x10);
    __asm__("" : "=r"(frame), "=r"(flags), "=r"(limit)
            : "0"(frame), "1"(flags), "2"(limit));
    frame++;
    flags &= 0xF9;
    *(u16 *)(saved_animation + 0x12) = frame;
    frame = (u16)frame < limit;
    saved_animation[0] = flags;

    if (frame != 0) {
        state = *(u32 **)(saved_animation + 0x0C);
        state[2] += state[1];
    } else {
        frame = *(volatile u8 *)saved_animation;
        if ((frame & 1) == 0) {
            *(u16 *)(saved_animation + 0x12) = 1;
            return -1;
        }
        state = *(u32 **)(saved_animation + 0x0C);
        state[2] = state[5];
        *(u16 *)(saved_animation + 0x12) = 1;
    }
    func_8001A224(saved_animation);
    return 0;
}
