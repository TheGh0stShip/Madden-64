#include "types.h"

typedef struct Overlay5RandomObject {
    u8 pad00[0x48];
    u16 values[4];
    u16 index;
} Overlay5RandomObject;

u16 func_80022538(u16 index, s32 lower, s32 upper, s32 mode);
void func_80025A4C(u16 index, u16 value, s32 kind, s32 enabled);
u16 func_80031A1C(s32 limit);

void overlay5_object_randomize_update(Overlay5RandomObject *object) {
    u16 value;

    value = func_80022538(object->index, 1, 21, 0);
    func_80025A4C(object->index, value, 26, 1);
    if (func_80031A1C(100) == 0) {
        func_80025A4C(object->index, value, 28, 1);
    } else if (func_80031A1C(100) < 98) {
        object->values[object->index]++;
        func_80025A4C(object->index, value, 27, 1);
    }
}
