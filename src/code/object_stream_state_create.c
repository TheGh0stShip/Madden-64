#include "types.h"

typedef struct ObjectMethods {
    void *allocate;
    void *create;
} ObjectMethods;

typedef struct StreamState {
    void *vtable;
    void *operation;
    u32 value8;
    void *handler;
    u8 pad10[0x10];
    u32 handle;
    u8 pad24[4];
    u32 size;
} StreamState;

typedef struct StreamObject {
    u8 pad00[4];
    ObjectMethods *methods;
    u8 pad08[0x68];
    u32 width;
    u8 pad74[4];
    u32 height;
    u8 pad7C[0xB8];
    u32 mode;
    u8 pad138[0x88];
    StreamState *stream;
} StreamObject;

extern void func_80062AF8(void);
extern void func_80062B0C(void);
extern void func_80062E68(void);
extern void func_80062C40(void);
extern void func_80062CA8(void);
extern void func_800629C8(StreamObject *object);

typedef void *(*AllocateMethod)(StreamObject *, s32, u32);
typedef u32 (*CreateMethod)(StreamObject *, s32, u32);

void object_stream_state_create(StreamObject *object)
{
    StreamState *state;

    state = ((AllocateMethod)object->methods->allocate)(object, 1, 0x30);
    object->stream = state;
    state->vtable = func_80062AF8;
    state->value8 = 0;
    state->size = object->width * object->height;
    if (object->mode == 2) {
        state->operation = func_80062B0C;
        state->handler = func_80062E68;
        state->handle = ((CreateMethod)object->methods->create)(object, 1, state->size);
    } else {
        state->operation = func_80062C40;
        state->handler = func_80062CA8;
        state->handle = 0;
    }
    func_800629C8(object);
}
