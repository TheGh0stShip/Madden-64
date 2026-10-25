#include "types.h"

typedef struct RuntimeObject {
    u8 pad00[0x2C];
    s32 checkpoint;
} RuntimeObject;

extern RuntimeObject *D_8008A058;
extern s32 D_80084F50;
extern s32 D_800857EC;
extern s32 D_800857F4;
extern s16 D_8008B62A;
extern s32 func_800A29C0(RuntimeObject *object);
extern s16 func_800C157C(RuntimeObject *object);

void runtime_checkpoint_refresh(void)
{
    if (func_800A29C0(D_8008A058) >= D_80084F50 || D_8008B62A == -1) {
        D_800857EC = D_8008A058->checkpoint;
        D_800857F4 = func_800C157C(D_8008A058);
    }
    D_8008B62A = 0;
}
