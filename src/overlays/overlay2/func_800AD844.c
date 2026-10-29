#include "types.h"

typedef struct {
    void *slot[8];
} Request;

extern u8 D_80088118[];
extern u8 D_8008BE68[];
extern u8 D_8008BE70[];
extern u8 D_8008BE88[];
extern u8 D_8008BE90[];
extern u8 D_800C08D8[];
extern u8 D_800C0958[];
extern u8 D_800C0974[];
extern s8 D_800C5C38;

void func_80094028(void);
void func_80092B98(void);
s16 func_800E1690(s32, s32);
void func_80094080(void);
void func_800E1FCC(s32, s32);
void func_800E2278(void *, s32, s32);
void func_80028B08(void);
void func_800962F0(void);
void func_80096604(void);
void func_8009652C(void);
void func_800E2068(void *, void *, s32);
void func_800D67B8(Request *);
void func_800D6454(Request *);

void func_800AD844(void) {
    Request req;
    s16 result;

    func_80094028();
    func_80092B98();
    func_80092B98();
    result = func_800E1690(0, 0);
    func_80094080();
    if (result != 0) {
        func_800E1FCC(0x86D0, 0);
        func_800E2278(D_8008BE68, 0x358, 0);
        func_800E2278(D_8008BE70, 0x134, 0);
        func_800E2278(D_8008BE88, 0x1458, 0);
        func_800E2278(D_8008BE90, 0x3C0, 0);
        func_80028B08();
        func_800962F0();
        func_80096604();
        func_8009652C();
        return;
    }
    func_800E2068(D_8008BE68, D_80088118, 0);
    func_80096604();
    func_8009652C();
    D_800C5C38 = 1;
    func_800D67B8(&req);
    req.slot[0] = D_800C0974;
    req.slot[1] = D_800C0958;
    req.slot[3] = D_800C08D8;
    func_800D6454(&req);
}
