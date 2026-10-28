#include "types.h"

typedef struct Overlay5MeterObject {
    u8 pad00[0x48];
    u16 values[4];
    u16 index;
} Overlay5MeterObject;

void func_800259E4(u16 index, s32 kind, s32 enabled);
u16 func_80031A1C(s32 limit);

void overlay5_object_meter_update(Overlay5MeterObject *object) {
    func_800259E4(object->index, 13, 1);
    if (func_80031A1C(100) < 50) {
        object->values[object->index] += 2;
        func_800259E4(object->index, 14, 1);
    }
}
