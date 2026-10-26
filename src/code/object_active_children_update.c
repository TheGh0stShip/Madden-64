#include "types.h"

extern u16 D_8008A5B4;
extern void func_8000D01C(void *object);

void object_active_children_update(u8 *object)
{
    register u8 *saved_object = object;
    register u32 index = 0;
    register u32 bound;
    register s32 state;

    __asm__ volatile("" : "=r"(index) : "0"(index));
    bound = D_8008A5B4;
    if (index < bound) {
        do {
            state = *(u8 *)(saved_object + 0x240);
            if (state < 2) {
                __asm__ volatile("" : "=r"(state) : "0"(state));
                if (state >= 0) {
                    func_8000D01C(saved_object);
                }
            }
            index++;
        } while (index < D_8008A5B4);
    }
}
