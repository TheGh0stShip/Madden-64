#include "types.h"
typedef void (*RuntimeCallback)(void*, s32, s32, s32);

void func_8005B450(u8* state, s32 first, s32 second, s32 third) {
    u8* callbacks = *(u8**)(state + 0x1AC);
    volatile s32 saved_first = first;
    volatile s32 saved_second = second;
    volatile s32 saved_third = third;
    RuntimeCallback callback = *(RuntimeCallback*)(callbacks + 4);

    callback(state, 0, 0, 0);
}
