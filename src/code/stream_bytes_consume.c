#include "types.h"

typedef struct StreamWindow {
    u8* data;
    s32 remaining;
} StreamWindow;

typedef struct StreamOwner {
    u8 pad0[0x14];
    StreamWindow* window;
} StreamOwner;

extern void func_80055568(StreamOwner* owner);

void func_80055588(StreamOwner* owner, s32 count) {
    StreamWindow* window = owner->window;

    if (count > 0) {
        while (window->remaining < count) {
            count -= window->remaining;
            func_80055568(owner);
        }
        window->data += count;
        window->remaining -= count;
    }
}
