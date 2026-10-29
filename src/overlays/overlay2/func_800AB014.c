#include "types.h"

typedef struct {
    void *unk00;
    void *unk04;
    s32 unk08;
    void *unk0C;
    void *unk10;
    s32 unk14;
    s32 unk18;
    s32 unk1C;
} Request;

extern u8 D_8006BCA4[];
extern u8 D_8006BCA8[];
extern u8 D_800C1024[];
extern u8 D_800C1038[];

void func_8008D480(s32);
s16 func_800D6454(Request *);
void func_800D67B8(Request *);

void func_800AB014(void) {
    Request request;

    func_800D67B8(&request);
    request.unk00 = D_800C1024;
    request.unk04 = D_800C1038;
    request.unk0C = D_8006BCA4;
    request.unk10 = D_8006BCA8;
    request.unk18 = 1;
    if (func_800D6454(&request) == 0) {
        func_8008D480(0x12C);
    }
}
