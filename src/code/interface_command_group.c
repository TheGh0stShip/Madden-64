#include "types.h"

#ifndef FUNCTION
#define FUNCTION interface_command_group_primary
#endif

#ifndef FIRST_COMMAND
#define FIRST_COMMAND 0x24
#endif

#ifndef SECOND_COMMAND
#define SECOND_COMMAND 0x25
#endif

#ifndef THIRD_COMMAND
#define THIRD_COMMAND 0x2C
#endif

extern void func_80025794(u8 row, u8 column, s32 command, s32 value);
extern void func_8002586C(u8 row, u8 column, s32 command, s32 value);
extern void func_80025944(u8 row, s32 command, s32 value);

void FUNCTION(u8* entry, s32 value) {
    func_80025794(entry[0x1E], entry[0x1F], FIRST_COMMAND, 1);
    {
        s16 signed_value = value;
        func_80025794(entry[0x1E], entry[0x1F], SECOND_COMMAND, signed_value);
        func_8002586C(entry[0x1E], entry[0x1F], THIRD_COMMAND, signed_value);
        func_80025944(entry[0x1E], 10, signed_value);
    }
}
