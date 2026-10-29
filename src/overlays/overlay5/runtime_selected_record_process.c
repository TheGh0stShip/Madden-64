#include "types.h"

extern s16 D_80084F6C;
extern u8 D_80085860[];
extern u8 D_800880D0[];

s32 func_80030EA0(s32 index);
s32 func_8004A1F8(void *system, void *record, s32 index);
s32 func_800E25D0(s32 mode);

s32 overlay5_runtime_selected_record_process(void) {
    s32 result;
    s32 index;

    if (func_80030EA0(D_80084F6C) == -1) {
        result = 5;
    } else {
        index = D_80084F6C;
        result = func_8004A1F8(
            D_800880D0,
            D_80085860 + index * 0x68,
            index
        );
        if (result == 2) {
            index = D_80084F6C;
            result = func_8004A1F8(
                D_800880D0,
                D_80085860 + index * 0x68,
                index
            );
        }
        if (result != 0 && result != 2) {
            result = (s16)func_800E25D0(result);
        }
    }
    return (s16)result;
}
