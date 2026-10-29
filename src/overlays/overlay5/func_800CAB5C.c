#include "types.h"

typedef struct DispatchCAB5C {
    void* field0;
    u8 pad4[8];
    void* fieldC;
    void* field10;
    u8 pad14[4];
    s32 field18;
} DispatchCAB5C;

extern u8 D_8006D3E0[];
extern u8 D_8006BDBC[];
extern u8 D_8006BDC4[];
extern void func_800D67B8(DispatchCAB5C* state);
extern s16 func_800D6454(DispatchCAB5C* state);
extern s16 func_800CABF0(void);
extern s16 func_800CAC24(void);

s16 func_800CAB5C(void) {
    DispatchCAB5C state;
    s16 result;

    func_800D67B8(&state);
    state.field0 = D_8006D3E0;
    state.fieldC = D_8006BDBC;
    state.field10 = D_8006BDC4;
    state.field18 = 1;
    result = func_800D6454(&state);
    if (result == 0) {
        return func_800CABF0();
    }
    if (result == 1) {
        return func_800CAC24();
    }
    return 0x19;
}
