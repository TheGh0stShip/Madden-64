#include "types.h"

typedef void (*SubmitCallback)(void* owner, s32 argument, s32 first,
                               s32 second);

typedef struct SubmitInterface {
    u8 pad0[0xC];
    SubmitCallback callback;
} SubmitInterface;

typedef struct SubmitOwner {
    u8 pad0[0x1C0];
    SubmitInterface* interface;
} SubmitOwner;

void func_80062C40(SubmitOwner* owner, s32 argument, s32* first,
                   s32 unused, s32 base, s32* second) {
    owner->interface->callback(owner, argument, *first, base + *second * 4);
    (*second)++;
    (*first)++;
}
