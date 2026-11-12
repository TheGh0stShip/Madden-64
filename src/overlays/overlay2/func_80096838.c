#include "types.h"

extern char D_80069DB0[];
extern char D_80069DB4[];
extern u8 D_8008796D;

u16 func_80031A1C(s32);
void func_80036CC4(char *);
void func_800B3700(s32, s32, s32, s32);

void func_80096838(void) {
    u16 value = func_80031A1C(10);
    s32 small;
    char *name;

    do {
        small = value < 5;
    } while (0);
    name = D_80069DB0;
    if (small) {
        name = D_80069DB4;
    }
    func_80036CC4(name);
    func_800B3700(2, D_8008796D, 0, 0);
}
