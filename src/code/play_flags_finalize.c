#include "types.h"

extern u8 D_80088AF2;
extern u8 D_80088AF3;
extern u8 D_80088AF6;
extern void func_800259E4(u32 player, s32 flag, s32 value);

void play_flags_finalize(void)
{
    u32 raw_state;
    u32 state;

    if (D_80088AF2 != 1) {
        return;
    }
    func_800259E4(D_80088AF3, 15, 1);
    func_800259E4(D_80088AF3 ^ 1, 18, 1);
    raw_state = D_80088AF6;
    state = raw_state & 0xFF;
    if (state != 0 && state != 8) {
        u32 range = raw_state - 5;
        if (range >= 2) {
          if (state == 7) {
            func_800259E4(D_80088AF3, 17, 1);
            func_800259E4(D_80088AF3 ^ 1, 20, 1);
          } else {
            func_800259E4(D_80088AF3, 16, 1);
            func_800259E4(D_80088AF3 ^ 1, 19, 1);
          }
        }
    }
    D_80088AF2 = 0;
}
