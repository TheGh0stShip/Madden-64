#include "types.h"

extern s16 D_800880B8;
extern s16 D_8008777E;
extern s16 D_80087770;
extern s16 D_800880C6;

extern u16 *func_800209AC(void);
extern void func_800ADDD0(u16 first, s16 second, s16 third, s16 fourth,
                         s16 fifth);

void state_values_submit(void)
{
    u16 *value = func_800209AC();

    func_800ADDD0(*value, D_8008777E, D_80087770, D_800880C6,
                  D_800880B8);
}
