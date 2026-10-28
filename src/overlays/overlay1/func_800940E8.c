#include "types.h"

typedef struct {
    u8 unk00[0xB0];
} Unit;

typedef struct {
    s8 type;
} Message;

typedef struct {
    u8 unk00[0xC];
    s32 unk0C;
    s32 unk10;
} Path;


#ifndef NULL
#define NULL 0
#endif

s32 func_800293CC();                            /* extern */
s32 func_8002FFEC(s32 *);                   /* extern */
s32 func_8003190C(s32);                     /* extern */
s32 func_80041BB4(s32);                     /* extern */
s32 func_80090B14();                            /* extern */
s32 func_8009C900(s32, s32);            /* extern */
s32 func_8009C99C();                            /* extern */
s32 func_8009EDB0();                            /* extern */
s32 func_800A3294();                            /* extern */
s32 func_800A6590(Path *, u8, s32, s32 *);       /* extern */
s32 func_800AA1E4();                            /* extern */
s32 func_800AEA9C(s32);                     /* extern */
s32 func_800B1E98();                            /* extern */
s32 func_800B9794();                            /* extern */
s32 func_800BCF98();                            /* extern */
s32 func_800E1A84(Unit *, Message *);             /* extern */
extern s32 D_80080C10;
extern s32 D_80084F34[];
extern s32 D_80086178;
extern s16 D_80086BE2;
extern Path D_80086CE8;
extern Unit D_80087138[8];
extern s16 D_800876DC;
extern u8 D_80087964;
extern u16 D_800886E0;
extern s16 D_80088AE4;
extern s8 D_80088AF3;
extern s16 D_800894FC;
extern s16 D_8008A3D8;
extern s32 D_8008F9C4;

void func_800940E8(void) {
    Message msg;

    func_8002FFEC(&D_8008F9C4);
    func_800B1E98();
    func_800AA1E4();
    func_8003190C(0x1000);
    msg.type = 0x34;
    func_800E1A84(&D_80087138[0], &msg);
    func_800E1A84(&D_80087138[1], &msg);
    func_800E1A84(&D_80087138[2], &msg);
    func_800E1A84(&D_80087138[3], &msg);
    msg.type = 0x3A;
    func_800E1A84(&D_80087138[4], &msg);
    func_800E1A84(&D_80087138[5], &msg);
    func_800E1A84(&D_80087138[6], &msg);
    func_800E1A84(&D_80087138[7], &msg);
    func_8009EDB0();
    func_800B9794();
    func_800BCF98();
    D_800894FC = 0;
    if (D_80086BE2 == 0) {
        D_800886E0 = 0;
        D_80088AE4 = 1;
    }
    D_80086BE2 ^= 1;
    if (D_8008A3D8 == 1) {
        func_800A3294();
    }
    if (D_800876DC == 5) {
        func_80041BB4(0x19);
    }
    func_800293CC();
    D_80088AF3 = (s8) D_800886E0;
    func_80090B14();
    func_8009C900(0x28, 1);
    func_8009C99C();
    D_80084F34[0] = -D_80084F34[0];
    D_80086CE8.unk0C = D_80086178;
    D_80086CE8.unk10 = D_80086178;
    func_800A6590(&D_80086CE8, D_80087964, D_80086178, D_80084F34);
    D_80080C10 &= 0xFFFEFFFF;
    func_800AEA9C(0);
}
