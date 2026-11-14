#include "types.h"

extern volatile u16 D_8008A5B4;
extern void func_8000D01C(void *object);

void object_active_children_update(u8 *object)
{
    u8 *saved_object = object;
    u32 index = 0;
    u32 bound;
    s32 state;

    bound = D_8008A5B4;
    if (index < bound) {
        do {
            state = *(u8 *)(saved_object + 0x240);
            if (state < 2) {
                if (state >= 0) {
                    func_8000D01C(saved_object);
                }
            }
            index++;
        } while (index < D_8008A5B4);
    }
}
