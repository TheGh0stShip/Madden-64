#include "types.h"

typedef struct GfxCommand {
    u32 w0;
    u32 w1;
} GfxCommand;

extern GfxCommand *D_80084F5C;

void display_command_update(void) {
    {
        GfxCommand *command = D_80084F5C++;

        command->w0 = 0xBA001402;
        command->w1 = 0;
    }
    {
        GfxCommand *command = D_80084F5C++;

        command->w0 = 0xBA001701;
        command->w1 = 0x800000;
    }
    {
        GfxCommand *command = D_80084F5C++;

        command->w0 = 0xB9000201;
        command->w1 = 0;
    }
    {
        GfxCommand *command = D_80084F5C++;

        command->w0 = 0xB7000000;
        command->w1 = 0x22205;
    }
    {
        GfxCommand *command = D_80084F5C++;

        command->w0 = 0xB900031D;
        command->w1 = 0x552078;
    }
    {
        GfxCommand *command = D_80084F5C++;

        command->w0 = 0xFC60FEC1;
        command->w1 = 0x55FE793C;
    }
    {
        GfxCommand *command = D_80084F5C++;

        command->w0 = 0xBB000001;
        command->w1 = 0xFFFFFFFF;
    }
    {
        GfxCommand *command = D_80084F5C++;

        command->w0 = 0xBA000602;
        command->w1 = 0;
    }
    {
        GfxCommand *command = D_80084F5C++;

        command->w0 = 0xBA001301;
        command->w1 = 0x80000;
    }
    {
        GfxCommand *command = D_80084F5C++;

        command->w0 = 0xBA001102;
        command->w1 = 0;
    }
    {
        GfxCommand *command = D_80084F5C++;

        command->w0 = 0xBA001001;
        command->w1 = 0;
    }
    {
        GfxCommand *command = D_80084F5C++;

        command->w0 = 0xBA000C02;
        command->w1 = 0x2000;
    }
    {
        GfxCommand *command = D_80084F5C++;

        command->w0 = 0xBA000903;
        command->w1 = 0xC00;
    }
    {
        GfxCommand *command = D_80084F5C++;

        command->w0 = 0xB9000002;
        command->w1 = 0;
    }
    {
        GfxCommand *command = D_80084F5C++;

        command->w0 = 0xBA000E02;
        command->w1 = 0x8000;
    }
}
