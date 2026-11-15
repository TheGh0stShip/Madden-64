#include "types.h"

typedef struct RuntimeRequestE1E74 {
    u32 field00;
    u16 field04;
    u8 field06[4];
    u8 field0A[1];
} RuntimeRequestE1E74;

extern s16 D_80084F6C;
extern u8 D_80085860[];

void func_800E2438(void);
void func_800E2354(void);
s32 func_800497A8(void *, u16, u32, void *, void *);
s32 func_800E25D0(s32);
void func_800E2480(void);
void func_800E1B0C(void);

s32 func_800E1E74(s32 request_arg) {
    RuntimeRequestE1E74 *request = (RuntimeRequestE1E74 *)request_arg;
    s32 status;

    func_800E2438();
    func_800E2354();
    status = func_800E25D0(func_800497A8(
        D_80085860 + D_80084F6C * 0x68, request->field04,
        request->field00, request->field0A, request->field06));
    func_800E2480();
    if ((s16)status != 0) {
        return (s16)status;
    }
    func_800E1B0C();
    return 0;
}
