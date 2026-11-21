#include "types.h"

typedef struct {
    void *slot[6];
    s32 flag;
    s32 pad;
} Request;

extern u8 D_80088118[];
extern u8 D_8008BE68[];
extern u8 D_800C08D8[];
extern u8 D_800C093C[];
extern u8 D_800C0974[];
extern u8 D_800C26C8[];
extern u8 D_800C26E0[];
extern u8 D_800C26F4[];
extern u8 D_800C2704[];
extern u8 D_800C271C[];
extern u8 D_800C273C[];
extern u8 D_800C2760[];
extern u8 D_800C2774[];
extern u8 D_800C2788[];
extern u8 D_800C2960[];
extern u8 D_800C29E0[];
extern s8 D_800C5C38;

s16 func_800AD9B8(u16);
void func_800D67B8(Request *);
s16 func_800D6454(Request *);
void func_800E2190(void *, void *, s32);
void func_80096714(void);
void func_80094028(void);
void func_80092B98(void);
s16 func_800E17A8(s32, s32);
void func_80094080(void);

void func_800ADA3C(u16 arg0) {
    Request req;
    s16 ok;
    s16 result;

    ok = 1;
    if (func_800AD9B8(arg0) != 0) {
        func_800D67B8(&req);
        req.slot[0] = D_800C2960;
        req.slot[3] = D_800C08D8;
        req.slot[4] = D_800C29E0;
        req.flag = 1;
        ok = !func_800D6454(&req);
    }
    if (ok == 1) {
        func_800E2190(D_8008BE68, D_80088118, 0);
        func_80096714();
        func_80094028();
        func_80092B98();
        func_80092B98();
        result = func_800E17A8(0, 0);
        func_80094080();
        func_80092B98();
        func_80092B98();
        func_80092B98();
        func_80092B98();
        if (result == 4) {
            func_800D67B8(&req);
            req.slot[0] = D_800C2704;
            req.slot[1] = D_800C271C;
            req.slot[2] = D_800C273C;
            req.slot[3] = D_800C08D8;
            req.flag = 0;
            func_800D6454(&req);
            func_800D67B8(&req);
            req.slot[0] = D_800C2760;
            req.slot[1] = D_800C2774;
            req.slot[2] = D_800C2788;
            req.slot[3] = D_800C08D8;
            req.flag = 0;
            func_800D6454(&req);
        } else if (result != 0) {
            func_800D67B8(&req);
            req.slot[0] = D_800C26C8;
            req.slot[1] = D_800C26E0;
            req.slot[2] = D_800C26F4;
            req.slot[3] = D_800C08D8;
            req.flag = 0;
            func_800D6454(&req);
        } else {
            D_800C5C38 = 1;
            func_800D67B8(&req);
            req.slot[0] = D_800C0974;
            req.slot[1] = D_800C093C;
            req.slot[3] = D_800C08D8;
            func_800D6454(&req);
        }
    }
}
