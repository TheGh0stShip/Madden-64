#include "types.h"

typedef struct CallbackObject {
    u8 pad00[8];
    void (*callback)(void);
    u8 pad0C[0x5C];
    s32 threshold68;
    s32 counter6C;
} CallbackObject;

void object_callback_threshold(CallbackObject **objectRef, s32 threshold)
{
    CallbackObject *object = *objectRef;

    if (threshold < 0) {
        if (object->counter6C == 0 || object->threshold68 >= 3) {
            object->callback();
        }
        object->counter6C++;
    } else if (object->threshold68 >= threshold) {
        object->callback();
    }
}
