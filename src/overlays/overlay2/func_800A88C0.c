#include "types.h"

typedef struct {
    void *slot[8];
} Request;

extern s16 D_800C5C36;
extern u8 D_800C31D8[];
extern u8 D_800C31F0[];
extern u8 D_800C3200[];
extern u8 D_800BFD00[];

s16 func_800BD888(void);
void func_800D67B8(Request *);
void func_800D6454(Request *);
void func_800DD514(void *);

s32 func_800A88C0(void) {
    Request req;
    u8 load;

    load = 1;
    if (D_800C5C36 == 0 && func_800BD888() == 1) {
        load = 0;
        func_800D67B8(&req);
        req.slot[0] = D_800C31D8;
        req.slot[1] = D_800C31F0;
        req.slot[2] = D_800C3200;
        func_800D6454(&req);
    }
    if (load == 1) {
        func_800DD514(D_800BFD00);
    }
    return 25;
}
