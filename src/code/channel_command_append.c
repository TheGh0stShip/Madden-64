#include "types.h"

typedef struct ChannelCommand {
    u16 command;
    u16 pad;
    void* data;
} ChannelCommand;

extern s16 D_8008B284;
extern u16 D_80085D30[];
extern ChannelCommand D_8008A770[][128];

void func_80033428(u16 command, void* data) {
    s16 channel = D_8008B284;

    D_8008A770[channel][D_80085D30[channel]].command = command;
    D_8008A770[channel][D_80085D30[channel]].data = data;
    D_80085D30[channel]++;
}
