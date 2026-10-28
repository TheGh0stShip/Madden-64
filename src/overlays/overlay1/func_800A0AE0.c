#include "types.h"

typedef struct {
    s32 *data;
    s32 value;
    s32 unk08[2];
    s16 kind;
} Request;

extern s16 D_800876DC;
extern s16 D_80087AC0;
extern s16 D_800892C8;
extern s16 D_80089320;
extern s32 D_800AEE34;

void func_8009C9E8(void);
void func_8009CBB8(s32, s32);
void func_800AD54C(void);
void func_800AE924(Request *);

void func_800A0AE0(void) {
    Request request;

    if (D_80089320 != 0 && D_80087AC0 == 0) {
        func_800AD54C();
        func_8009C9E8();
        request.data = &D_800AEE34;
        request.kind = 0x32;
        request.value = D_800876DC;
        func_800AE924(&request);
        func_8009CBB8(0x2D, 0xD2);
        D_800892C8 = 0;
        D_80087AC0 = 1;
    }
}
