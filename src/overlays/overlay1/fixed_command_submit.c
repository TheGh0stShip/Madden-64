#include "types.h"

typedef struct FixedCommand {
    u32 word00;
    u8 value04;
    u8 value05;
    u8 value06;
    u8 value07;
    u8 value08;
} FixedCommand;

extern void func_800442F4(void *context, FixedCommand *command);

void fixed_command_submit(void *context, u8 first, u8 second, u8 third)
{
    FixedCommand command;

    command.word00 = 0;
    command.value04 = first;
    command.value05 = second + 2;
    command.value06 = 0x48;
    command.value07 = 0x8C;
    command.value08 = third;
    func_800442F4(context, &command);
}
