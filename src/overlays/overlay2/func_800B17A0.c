#include "types.h"

typedef struct {
    u8 pad00[0xC];
    s32 handle;
} Track;

typedef struct {
    u8 pad00[0x28];
    Track *track;
} Owner;

void func_800DB44C(s32, s32 *, s32 *, s32 *);
void func_800DC8B8(s32, u8, s32);

void func_800B17A0(Owner *owner) {
    s32 handle = owner->track->handle;
    s32 first;
    s32 second;
    s32 third;

    func_800DB44C(handle, &first, &second, &third);
    func_800DC8B8(handle, second, 0);
}
