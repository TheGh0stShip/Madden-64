#include "types.h"

typedef struct RequestDD694 {
    u32 id;
    s16 type;
    s16 field6;
    s16 field8;
    u8 padA[2];
    u32 size;
    void* field10;
    u8 pad14[0x10];
} RequestDD694;

typedef struct StateDD694 {
    u8 pad0[0x64];
    void** handles;
} StateDD694;

extern StateDD694* D_80072380;
extern void* func_8000D8DC(s32, RequestDD694*);
extern void func_80017CDC(void*, s32);
extern void func_8001AA3C(void*, s32);
extern void func_80016FE4(void*);

void func_800DD694(u16 id, u8 index, u8 flags) {
    RequestDD694 request;
    StateDD694* state;
    void* handle;

    request.id = id;
    request.type = flags & 0xF;
    request.field6 = 0;
    request.field8 = 0;
    request.field10 = 0;
    if (flags & 0x80) {
        request.size = 0x110;
        handle = func_8000D8DC(0, &request);
        D_80072380->handles[index + 1] = handle;
        func_80017CDC(D_80072380->handles[index + 1], 1);
        func_8001AA3C(D_80072380->handles[index + 1], 0x78);
    } else {
        request.size = 0x10;
        handle = func_8000D8DC(0, &request);
        state = D_80072380;
        state->handles[index + 1] = handle;
        func_80016FE4(state->handles[index + 1]);
    }
}
