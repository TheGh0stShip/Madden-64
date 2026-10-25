#include "types.h"

extern void func_800AD404(void);
extern void func_800AD4F8(void);
extern void func_800AD460(void);
extern void func_800AD49C(void);
extern void func_800ABCA0(s32 mode, s32 value);
extern void func_800AEA9C(s32 enabled);

void subsystem_sequence_start(void)
{
    func_800AD404();
    func_800AD4F8();
    func_800AD460();
    func_800AD49C();
    func_800ABCA0(9, 0);
    func_800AEA9C(1);
}
