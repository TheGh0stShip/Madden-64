#include "types.h"

typedef struct Overlay5ReadyState {
    u8 pad00[0x10];
    u8 active;
} Overlay5ReadyState;

extern Overlay5ReadyState *D_80072380;

s32 func_800DCC14(void);
void func_800DD20C(void);

void overlay5_runtime_until_ready(void) {
    D_80072380->active = 1;
    while ((u8)func_800DCC14() != 7) {
    }
    func_800DD20C();
}
