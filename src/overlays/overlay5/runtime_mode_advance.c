#include "types.h"

typedef struct RuntimeModeState {
    u8 pad0[0x10];
    u8 mode;
    u8 previous_mode;
} RuntimeModeState;

extern RuntimeModeState* D_80072380;
extern void func_800E0D10(void);

void func_800DD658(void) {
    D_80072380->previous_mode = D_80072380->mode;
    D_80072380->mode = 8;
    func_800E0D10();
}
