#include "types.h"

extern u8 D_80089368;
extern void* D_8008502C;
extern s32 D_80072320;
extern s32 D_80072324;
extern void func_8004D098(s32 event, void* queue, s32 message);

void func_80032ABC(void) {
    D_8008502C = &D_80089368;
    func_8004D098(5, &D_80089368, 0);
    D_80072320 = 0;
    D_80072324 = 0;
}
