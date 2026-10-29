#include "types.h"

extern s16 D_80084F6C;
extern u8 D_80085860[];

void func_800E2438(void);
void *func_8004B998(void *record);
void func_800E25D0(void *record);
void func_800E2480(void);

void overlay5_runtime_selected_record_load(void) {
    void *record;

    func_800E2438();
    record = func_8004B998(D_80085860 + D_80084F6C * 0x68);
    func_800E25D0(record);
    func_800E2480();
}
