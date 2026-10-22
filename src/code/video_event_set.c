#include "types.h"

extern void osSetEventMesg(s32 event, void* queue, void* message);
extern void* D_8008502C;

void func_80032A4C(void* queue, void* message) {
    D_8008502C = queue;
    osSetEventMesg(5, queue, message);
}
