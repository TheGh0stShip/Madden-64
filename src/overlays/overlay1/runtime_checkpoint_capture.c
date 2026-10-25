#include "types.h"

typedef struct RuntimeObject {
    u8 pad00[0x2C];
    s32 checkpoint;
} RuntimeObject;

extern RuntimeObject *D_8008A058;
extern s32 D_80089520;
extern s32 D_80084F50;
extern s32 D_800857EC;
extern s32 D_800857F4;
extern s16 D_8008B62A;
extern s16 func_800C157C(RuntimeObject *object);

void runtime_checkpoint_capture(void)
{
    RuntimeObject *object = D_8008A058;

    D_8008B62A = -1;
    D_80084F50 = D_80089520;
    D_800857EC = object->checkpoint;
    D_800857F4 = func_800C157C(object);
}
