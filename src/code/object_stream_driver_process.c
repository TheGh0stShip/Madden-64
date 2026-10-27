#include "types.h"

typedef void (*VoidCallback)(void);
typedef void (*ObjectCallback)(void *object);
typedef void (*DecodeCallback)(void *object, s32 value, s32 *position, s32 mode);

typedef struct ObjectChild {
    ObjectCallback update;
    s32 position;
    s32 limit;
} ObjectChild;

typedef struct ObjectStreamDriver {
    VoidCallback begin;
    ObjectCallback end;
    s32 active;
} ObjectStreamDriver;

typedef struct ObjectDecoder {
    u8 pad00[4];
    DecodeCallback decode;
} ObjectDecoder;

s32 func_800548B8(u8 *object)
{
    ObjectStreamDriver *driver;
    ObjectChild *child;
    s32 previous;
    s32 state;

    if (*(s32 *)(object + 0x10) != 0xCC) {
        (*(ObjectStreamDriver **)(object + 0x1A0))->begin();
        *(s32 *)(object + 0x8C) = 0;
        *(s32 *)(object + 0x10) = 0xCC;
    }

    driver = *(ObjectStreamDriver **)(object + 0x1A0);
    while (driver->active != 0) {
        while (*(u32 *)(object + 0x8C) < *(u32 *)(object + 0x74)) {
            child = *(ObjectChild **)(object + 8);
            if (child != 0) {
                child->position = *(s32 *)(object + 0x8C);
                (*(ObjectChild **)(object + 8))->limit = *(s32 *)(object + 0x74);
                (*(ObjectChild **)(object + 8))->update(object);
            }
            previous = *(s32 *)(object + 0x8C);
            (*(ObjectDecoder **)(object + 0x1A4))->decode(
                object, 0, (s32 *)(object + 0x8C), 0);
            if (*(s32 *)(object + 0x8C) == previous) {
                return 0;
            }
        }
        (*(ObjectStreamDriver **)(object + 0x1A0))->end(object);
        ((ObjectCallback)(*(ObjectStreamDriver **)(object + 0x1A0))->begin)(object);
        *(s32 *)(object + 0x8C) = 0;
        driver = *(ObjectStreamDriver **)(object + 0x1A0);
    }
    if (*(s32 *)(object + 0x44) != 0) {
        state = 0xCE;
    } else {
        state = 0xCD;
    }
    *(s32 *)(object + 0x10) = state;
    return 1;
}
