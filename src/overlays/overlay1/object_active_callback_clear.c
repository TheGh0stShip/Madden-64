#include "types.h"

typedef struct CallbackObject {
    u8 pad00[0x21];
    u8 state;
    u8 pad22[6];
    u16 flags;
    u8 pad2A[0x36];
    void (*callback)(void);
} CallbackObject;

void object_active_callback_clear(CallbackObject *object)
{
    if (object != 0) {
        u16 flags = object->flags;

        object->state = 0;
        if (flags & 1) {
            object->flags = flags & ~1;
            object->callback();
        }
    }
}
