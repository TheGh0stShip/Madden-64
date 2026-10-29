#include "types.h"

typedef struct Overlay5ModeOwner {
    u8 pad0[0xC];
    void* object;
} Overlay5ModeOwner;

extern s32 func_800DBA70(void* object);
extern s32 func_800DBB6C(void* object);
extern s32 func_800DBCA0(void* object);
extern s32 func_800DBD88(void* object);

s16 func_800DB220(Overlay5ModeOwner* owner, s32 mode) {
    void* object = owner->object;

    if ((s16)mode == 0) {
        return func_800DBA70(object);
    } else if ((s16)mode == 1) {
        return func_800DBB6C(object);
    } else if ((s16)mode == 2) {
        return func_800DBCA0(object);
    } else if ((s16)mode == 3) {
        return func_800DBD88(object);
    }
    return 0x17;
}
