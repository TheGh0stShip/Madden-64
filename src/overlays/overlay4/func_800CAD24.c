#include "types.h"

typedef struct Command18 {
    u8 type;
    u8 angle;
} Command18;

extern s16 func_800C157C(void *object);
extern void func_800E1BCC(void *object, Command18 *command);

void func_800CAD24(void *object) {
    Command18 command;

    command.angle = (u16)func_800C157C(object) >> 4;
    command.type = 0x18;
    func_800E1BCC(object, &command);
}
