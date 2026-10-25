#include "types.h"

extern u16 D_8006B9D8;
extern void *D_8006B9DC;
extern u16 D_800855D4;
extern u8 D_8000105C[];
extern void func_8002619C(void);
extern void *func_80032E00(u32 unused, u32 size);
extern void func_800E2068(void *descriptor, void *buffer, u32 count);
extern void func_8002506C(void);

void interface_transfer_begin(u32 mode)
{
    void *buffer;

    D_8006B9D8 = mode;
    mode = (u16)mode;
    if (mode == 0) {
        goto mode_zero;
    }
    if (mode != 4) {
        goto allocate;
    }
    goto done;
mode_zero:
    func_8002619C();
    goto done;
allocate:
    buffer = func_80032E00(0, 0x5C08);
    D_8006B9DC = buffer;
    func_800E2068(D_8000105C, buffer, 1);
    D_800855D4 = 0;
    func_8002506C();
done:
    return;
}
