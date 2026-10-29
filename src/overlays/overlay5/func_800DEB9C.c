#include "types.h"

typedef struct Overlay5AlternateProcessData {
    u8 pad0[4];
    u8* counters;
    u8 pad8[0x14];
    u8 object1C[1];
} Overlay5AlternateProcessData;

typedef struct Overlay5AlternateProcessOwner {
    u8 pad0[0xC];
    Overlay5AlternateProcessData* data;
} Overlay5AlternateProcessOwner;

extern void func_800DFF4C(Overlay5AlternateProcessOwner* owner);
extern s32 func_800DFD64(Overlay5AlternateProcessOwner* owner, void* first,
                         void* second);
extern void func_800DB478(void* object);

s32 func_800DEB9C(Overlay5AlternateProcessOwner* owner, void* first,
                  void* second, s32 increment) {
    Overlay5AlternateProcessData* data = owner->data;
    s32 result;

    if (increment & 1) {
        data->counters[0xB]++;
        data->counters[0xC]++;
    }
    func_800DFF4C(owner);
    result = func_800DFD64(owner, first, second);
    func_800DB478(data->object1C);
    return result;
}
