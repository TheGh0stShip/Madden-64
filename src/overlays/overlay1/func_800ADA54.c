#include "types.h"

typedef struct {
    u32 unk_00;
    s16 unk_04;
    s16 unk_06;
    u32 unk_08;
} DmaReq;

typedef struct {
    u32 unk_00;
    u8 pad_04[8];
    u32 unk_0C;
    u8 pad_10[0x14];
} Entry24;

extern u32 D_800869C8;
extern void *D_8007A16C;
extern DmaReq *D_8007A170;
extern Entry24 D_8006B7F8[];
extern u32 D_8007A0BC[];

void func_8000DBA4(void *node, void *context);
void func_800A9330(s32 a, s32 b) {
    u16 idx = a;
    u16 n = b;
    u32 dst;
    s32 pad[2];

    if (n != 0) {
        b = 1;
    }
    dst = D_800869C8;
    dst += (u16)(a ^ 1) * 0x40;
    dst += (u16)b * 0x20;
    D_8007A170->unk_04 = 0;
    D_8007A170->unk_06 = 0x10;
    D_8007A170->unk_00 = D_8006B7F8[idx].unk_00;
    D_8007A170->unk_08 = dst;
    func_8000DBA4(D_8007A16C, 0);
    dst = D_800869C8 + 0x80;
    dst += idx * 0x180;
    D_8007A170->unk_06 = 0x40;
    D_8007A170->unk_00 = D_8007A0BC[idx];
    dst += n * 0x80;
    D_8007A170->unk_08 = dst;
    func_8000DBA4(D_8007A16C, 0);
    dst = D_800869C8;
    dst += 0x380;
    dst += (u16)(a ^ 1) * 0x40;
    dst += (u16)b * 0x20;
    D_8007A170->unk_04 = 0;
    D_8007A170->unk_06 = 0x10;
    D_8007A170->unk_00 = D_8006B7F8[idx].unk_0C;
    D_8007A170->unk_08 = dst;
    func_8000DBA4(D_8007A16C, 0);
}
