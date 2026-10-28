#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct {
    s32 state;
    void *buffer;
    s32 size;
    void *bufferB;
    void *bufferC;
    u8 pad14[0x26];
    u16 flags;
} Resource;

typedef struct {
    u8 pad00[8];
    Resource *resource;
} Owner;

void func_80032F3C(s32, void *);

void func_8009D9D0(Owner *arg0) {
    Resource *res = arg0->resource;
    s32 state = res->state;

    if (state != 1) {
        if (state == 0) {
            goto release;
        } else if (state == 2) {
        } else if (state == 3) {
        release:
            if (!(res->flags & 0x2000)) {
                if (res->bufferB != NULL) {
                    func_80032F3C(0, res->bufferB);
                    res->bufferB = NULL;
                }
                if (res->bufferC != NULL) {
                    func_80032F3C(0, res->bufferC);
                    res->bufferC = NULL;
                }
            }
            if (res->buffer != NULL) {
                func_80032F3C(0, res->buffer);
                res->size = 0;
                res->buffer = NULL;
            }
        }
    } else {
        if (res->bufferB != NULL) {
            func_80032F3C(0, res->bufferB);
            res->bufferB = NULL;
        }
    }
}
