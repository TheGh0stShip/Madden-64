#include "types.h"

typedef struct TransitionCommand {
    void (*callback)(void);
    u8 pad04[0xC];
    s16 value;
} TransitionCommand;

extern void func_80028F34(void);
extern void func_800AD0F8(void);
extern void func_800AE924(TransitionCommand *command);
extern void func_800AEA9C(s32 enabled);

void transition_command_submit(void)
{
    TransitionCommand command;

    func_80028F34();
    command.callback = func_800AD0F8;
    command.value = 0;
    func_800AE924(&command);
    func_800AEA9C(1);
}
