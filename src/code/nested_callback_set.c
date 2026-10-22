#include "types.h"

typedef struct NestedCallbackOwner {
    u8 pad[0x1B0];
    void (**callback)(void);
} NestedCallbackOwner;

extern void func_8005687C(void);

void func_80056868(NestedCallbackOwner* owner) {
    *owner->callback = func_8005687C;
}
