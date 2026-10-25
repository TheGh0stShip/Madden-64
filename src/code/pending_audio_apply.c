#include "types.h"

typedef struct PendingAudio {
    u16 pending;
    u16 owner;
    void* index;
} PendingAudio;

extern PendingAudio D_8006928C;
extern void func_80035F88(u16 owner, void* index);

void func_8001AB74(void) {
    if (D_8006928C.pending != 0) {
        func_80035F88(D_8006928C.owner, D_8006928C.index);
        D_8006928C.pending = 0;
    }
}
