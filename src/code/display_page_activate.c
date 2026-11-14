#include "types.h"

extern volatile u32 D_80087908[];
extern volatile u32 D_80086170[];
extern u32 func_80046918(void);
extern void func_8004D168(u32 value);
extern void func_8000BB98(u32 page);

void display_page_activate(u32 page)
{
    u32 state = func_80046918();

    func_8004D168(1);
    if (D_80087908[(u16)(page ^ 1)] | (D_80086170[(u16)(page ^ 1)] & 1)) {
        D_80087908[(u16)page] = 1;
        func_8004D168(state);
    } else {
        func_8004D168(state);
        func_8000BB98((u16)page);
    }
}
