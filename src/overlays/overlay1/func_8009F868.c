#include "types.h"

typedef struct GfxCommand {
    u32 w0;
    u32 w1;
} GfxCommand;

extern GfxCommand *D_80084F5C;
extern s32 D_8008B654;

void func_80009E14(s32 value);
void func_80009E58(s32 value);
void func_8000A270(s32 value);
void func_8000A3C0(s32 value);
void func_8000A63C(s32 first, s32 second);
void func_8000A830(s32 value);
void func_8000A984(s32 value);
void func_8000AFA8(s32 value);
void func_8000B008(s32 value);
void func_8000B1D8(s32 first, s32 second, s32 third, s32 fourth, s32 fifth);
void func_8000C790(s32 value);

void func_8009F868(u8 *object)
{
    u32 *view;
    GfxCommand *command;

    view = *(u32 **)(object + 8);
    func_8000C790(D_8008B654);
    command = D_80084F5C++;
    command->w0 = 0xE7000000;
    command->w1 = 0;
    func_8000A3C0(0);
    func_8000A63C(0x442048, 0x112048);
    func_80009E14(0);
    func_8000B008(0xE3001);
    func_8000AFA8(0x204);
    func_8000A984(0);
    command = D_80084F5C++;
    command->w0 = 0xFCFFFFFF;
    command->w1 = 0xFFFE793C;
    func_8000A270(0);
    func_80009E58(0);
    func_8000A830(0xC00);
    func_8000B1D8(0x8000, 0x8000, 0, 0, 0);
    command = D_80084F5C;
    command->w0 = 0x0400103F;
    command->w1 = *view;
    D_80084F5C = command + 1;
    D_80084F5C->w0 = 0xB1000206;
    D_80084F5C = command + 2;
    command[1].w1 = 0x604;
}
