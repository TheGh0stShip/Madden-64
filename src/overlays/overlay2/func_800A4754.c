#include "types.h"

typedef struct CopyBlock { u8 data[0x58]; s16 tail; } CopyBlock;
typedef struct Request { s32 value; s16 kind; s16 zero1; s16 zero2; s16 pad; s32 mode; s32 zero3; u8 extra[0x10]; } Request;
extern CopyBlock D_8008B9FC;
extern u16 D_800C3A14;
extern u16 D_800C3A68;
extern u16 D_80085BF8;
extern void *D_8008931C;
extern u8 *func_800DD634(void);
extern void func_8000D834(void *, void *);
extern void func_8003647C(s32, s32);
extern void func_80035F88(u16, u16);
extern s32 func_800364E4(u16, u16);
extern void *func_8000D8DC(s32, void *);
extern void func_80016FE4(void *);

void func_800A4754(s32 index)
{
    CopyBlock local = D_8008B9FC;
    u8 *record;
    u16 value = ((u16 *)local.data)[index];
    Request request;
    void *handle;
    if (value == D_800C3A68) return;
    record = func_800DD634();
    if (*(void **)(record + 0x44) != 0) {
        func_8000D834(D_8008931C, *(void **)(record + 0x44));
        *(void **)(record + 0x44) = 0;
    }
    if (D_800C3A14 == 0) {
        D_800C3A14 = value;
        func_8003647C(D_80085BF8, value);
        if (D_800C3A68 != 0) {
            func_80035F88(D_80085BF8, D_800C3A68);
            D_800C3A68 = 0;
        }
    } else if (func_800364E4(D_80085BF8, D_800C3A14) < 0) {
        if (value == D_800C3A14) {
            request.kind = 4;
            request.zero1 = 0;
            request.zero2 = 0;
            request.zero3 = 0;
            request.mode = 0x10;
            request.value = value;
            handle = func_8000D8DC(0, &request);
            *(void **)(record + 0x44) = handle;
            func_80016FE4(handle);
            D_800C3A68 = D_800C3A14;
            D_800C3A14 = 0;
        } else {
            func_80035F88(D_80085BF8, D_800C3A14);
        D_800C3A14 = value;
        func_8003647C(D_80085BF8, value);
        }
    }
}
