#include "types.h"

typedef struct FrameHalfwords {
    u16 values[55];
    u8 pad[0x20DE];
} FrameHalfwords;

extern FrameHalfwords D_80080CFC[];

#ifndef FUNCTION
#define FUNCTION func_8003A48C
#endif

#ifdef FIND_VALUE
u16 FUNCTION(u16 frame, u16 value) {
#else
u16 FUNCTION(u16 frame) {
#endif
    u16 index = 0;

    for (index = 0; index < 55; index++) {
#ifdef FIND_VALUE
        if (D_80080CFC[frame].values[index] == value) {
#else
        if (D_80080CFC[frame].values[index] == 0xFFFF) {
#endif
            break;
        }
    }
    return index;
}
