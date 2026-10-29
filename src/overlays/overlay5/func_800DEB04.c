#include "types.h"

typedef struct Overlay5ProcessData {
    u8 pad0[4];
    u8* counters;
    u8 pad8[0x14];
    u8 object1C[1];
} Overlay5ProcessData;

typedef struct Overlay5ProcessOwner {
    u8 pad0[0xC];
    Overlay5ProcessData* data;
} Overlay5ProcessOwner;

extern void func_800DFF4C(Overlay5ProcessOwner* owner);
extern s32 func_800DFC54(Overlay5ProcessOwner* owner, void* first,
                         void* second);
extern void func_800DB478(void* object);

s32 func_800DEB04(Overlay5ProcessOwner* owner, void* first, void* second,
                  s32 increment) {
    Overlay5ProcessData* data = owner->data;
    s32 result;

    if (increment & 1) {
        data->counters[0xB]++;
        data->counters[0xC]++;
    }
    func_800DFF4C(owner);
    result = func_800DFC54(owner, first, second);
    func_800DB478(data->object1C);
    return result;
}
