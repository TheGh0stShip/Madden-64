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
    register void **buffers __asm__("$16") = D_8008B348;
    register s32 *active __asm__("$17") = D_80084F60;
    register s32 initial __asm__("$3") = D_8008B650;
    register s32 render_index __asm__("$2");
    register s32 next __asm__("$4");
    register void *buffer __asm__("$5");
    register void *source __asm__("$7");
    register u32 release_address __asm__("$4");
    u8 *entry;
    u8 value;

    *(void **)(channel + 0x14) = buffers[initial];
    initial ^= 1;
    __asm__("" : "=r"(initial) : "0"(initial));
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

    next = D_8008B650;
    active[next] = 1;
    next ^= 1;
    buffer = buffers[next];
    D_8008B650 = next;
    entry = (u8 *)buffer;
    value = entry[0xFED];
    if ((value & 1) == 0) {
        entry[0xFED] = value | 2;
    }
    D_8007E808 = (u8 *)D_8007E808 + 0xFF6;
    D_8008B344 = (u8 *)D_8008B344 - 0xFF6;
}
