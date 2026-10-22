#include "types.h"

typedef void* OSMesg;
typedef struct OSMesgQueue OSMesgQueue;
typedef struct OSEventState {
    OSMesgQueue* queue;
    OSMesg message;
} OSEventState;

extern OSEventState D_8007D288[];
extern u32 __osDisableInt(void);
extern void __osRestoreInt(u32 mask);

void osSetEventMesg(s32 event, OSMesgQueue* queue, OSMesg message) {
    register u32 saveMask;
    OSEventState* state;

    saveMask = __osDisableInt();
    state = &D_8007D288[event];
    state->queue = queue;
    state->message = message;
    __osRestoreInt(saveMask);
}
