#include "types.h"

extern void func_80024694(void);
extern s32 func_80024D28(u32 current);
extern u32 func_8002A6AC(u32 item);
extern void func_80024E9C(void);

u32 interface_lowest_cost_select(void)
{
    register u32 best_cost __asm__("$18") = 0;
    register u32 best __asm__("$17");
    register u32 current __asm__("$16");
    register u32 sentinel __asm__("$19");

    func_80024694();
    best = (u16)func_80024D28(0xFFFF);
    current = best;
    if (best != 0xFFFF) {
        sentinel = 0xFFFF;
        do {
            u32 cost = func_8002A6AC(current);
            if (cost >= best_cost) {
                best = current;
                best_cost = cost;
            }
            current = (u16)func_80024D28(current);
        } while (current != sentinel);
    }
    func_80024E9C();
    return best;
}
