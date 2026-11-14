#include "types.h"

extern s32 D_8008B650;
extern void *D_8008B348[];
extern s32 D_80084F60[];
extern u8 D_800885F0[];
extern u8 D_800894C8[];
extern void *D_8007E808;
extern void *D_8008B344;

extern void func_8004CDA8(void *entry, s32 value, s32 count);
extern void func_80046CF8(void *buffer, s32 size);
extern void func_8004BDB8(void *state, s32 second, s32 third, void *source,
                          void *buffer, s32 size, void *entry);

void audio_channel_finalize(u8 *channel)
{
    void **buffers = D_8008B348;
    s32 *active = D_80084F60;
    s32 initial = D_8008B650;
    s32 render_index;
    s32 next;
    void *buffer;
    void *source;
    u32 release_address;
    u8 *entry;
    u8 value;

    *(void **)(channel + 0x14) = buffers[initial];
    initial ^= 1;
    if (active[initial] != 0) {
        release_address = initial << 1;
        release_address += initial;
        release_address <<= 3;
        release_address += (u32)D_800885F0;
        func_8004CDA8((void *)release_address, 0, 1);
        active[D_8008B650 ^ 1] = 0;
    }

    buffer = buffers[D_8008B650];
    func_80046CF8(buffer, 0x1000);
    render_index = D_8008B650;
    source = D_8007E808;
    func_8004BDB8(D_800894C8 + render_index * 0x18, 0, 0, source,
                  buffers[render_index], 0xFF6,
                  D_800885F0 + render_index * 0x18);

    active[D_8008B650] = 1;
    next = D_8008B650 ^ 1;
    entry = buffers[next];
    D_8008B650 = next;
    value = entry[0xFED];
    if ((value & 1) == 0) {
        entry[0xFED] = value | 2;
    }
    D_8007E808 = (u8 *)D_8007E808 + 0xFF6;
    D_8008B344 = (u8 *)D_8008B344 - 0xFF6;
}
