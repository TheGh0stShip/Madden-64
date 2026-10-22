#include "types.h"

typedef struct UiEntry {
    s16 value;
    u8 pad[214];
} UiEntry;

extern s16 D_80087B68;
extern UiEntry D_80088B7E[];

s16 func_800169D4(void) {
    return D_80087B68;
}

s16 func_800169E4(s16 index) {
    return D_80088B7E[index].value;
}

void func_80016A14(s16 value) {
    D_80087B68 = value;
}
