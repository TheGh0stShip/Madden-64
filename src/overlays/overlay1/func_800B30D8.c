#include "types.h"

typedef struct {
    s32 data[5];
} Event;

extern Event D_80085D80[];
extern s16 D_80087752;

void func_8002E17C(void *, void *, s32);

void func_800B30D8(Event *out) {
    if (D_80087752 == 0) {
        out->data[0] = 0;
        return;
    }
    D_80087752--;
    *out = D_80085D80[0];
    if (D_80087752 != 0) {
        func_8002E17C(&D_80085D80[0], &D_80085D80[1], D_80087752 * sizeof(Event));
    }
}
