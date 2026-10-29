#include "types.h"

typedef struct {
    void *src;
    void *dst;
    s32 unk08;
    void *unk0C;
    void *unk10;
    s32 unk14;
    s32 unk18;
    s32 unk1C;
} Request;

extern u8 D_800C2434[4];
extern u8 D_800C242C[];
extern u8 D_800C243C[];
extern u8 D_800C3150[];
extern u8 D_800C3154[];

void func_800D67B8(Request *);
s16 func_800D6454(Request *);

s32 func_8009DFE0(u8 *id) {
    Request request;
    u32 i;

    for (i = 0; i < 4; i++) {
        D_800C2434[i] = id[i];
    }
    func_800D67B8(&request);
    request.src = D_800C242C;
    request.dst = D_800C243C;
    request.unk0C = D_800C3150;
    request.unk10 = D_800C3154;
    request.unk18 = 0;
    return func_800D6454(&request) == 0;
}
