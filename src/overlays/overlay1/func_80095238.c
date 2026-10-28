#include "types.h"

typedef struct {
    s32 *data;
    s32 unk04[3];
    s16 unk10;
} Request;

extern s16 D_8006B7AA;
extern s16 D_8006B7AC;
extern s16 D_8006B7BC;
extern s16 D_8006B7BE;
extern s32 D_80084F30;
extern s32 D_80084F34;
extern u8 D_80086DDC[];
extern s16 D_800886E0;
extern s16 D_80088AE4;
extern u8 D_80088AF6;
extern s16 D_80089320;
extern s16 D_80089354;
extern s16 D_800894FC;
extern s32 D_800AD074;

void func_80029AD0(void);
void func_800AE924(Request *);
void func_800BEE28(void);

void func_80095238(void) {
    Request request;

    if (D_80088AF6 != 0) {
        func_80029AD0();
        request.data = &D_800AD074;
        request.unk10 = 0;
        func_800AE924(&request);
    }
    D_80089320 = -1;
    D_8006B7AA = 0x56;
    D_8006B7AC = 0x51;
    D_8006B7BC = 9;
    D_8006B7BE = 6;
    D_80084F34 = 0xFEC00000;
    D_80084F30 = 0;
    D_80089354 = 0x19;
    func_800BEE28();
    if (D_800894FC == 0) {
        D_800894FC = 1;
    }
    D_80086DDC[D_80088AE4] = 2;
    D_80086DDC[D_800886E0] = 2;
}
