#include "types.h"

typedef struct Anim {
    u8 flags;
    u8 pad[11];
    s32 *state;
    u16 limit;
    u16 frame;
} Anim;

extern void func_8001A224(void *animation);

s32 animation_step_update(Anim *anim)
{
    anim->flags &= ~6;
    anim->frame++;
    if (anim->frame < anim->limit) {
        anim->state[2] += anim->state[1];
    } else {
        if (!(anim->flags & 1)) {
            anim->frame = 1;
            return -1;
        }
        anim->state[2] = anim->state[5];
        anim->frame = 1;
    }
    func_8001A224(anim);
    return 0;
}
