#include "types.h"

typedef struct {
    void *slot[6];
    s32 flag;
    s32 pad;
} Request;

extern u8 D_800C2540[];
extern u8 D_800C2568[];
extern u8 D_800C258C[];
extern u8 D_800C25B0[];
extern u8 D_800C29E0[];

void func_800D67B8(Request *);
s32 func_800D6454(Request *);

s16 func_800ACFA4(void) {
    Request req;

    func_800D67B8(&req);
    req.slot[0] = D_800C2540;
    req.slot[1] = D_800C258C;
    req.slot[2] = D_800C25B0;
    req.slot[3] = D_800C2568;
    req.slot[4] = D_800C29E0;
    req.flag = 1;
    return func_800D6454(&req);
}
