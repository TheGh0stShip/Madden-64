#include "types.h"

extern u16 D_80073CCC;
extern u16 D_800895BC;
extern u16 D_800895BE;
extern u16 D_800895C0;
extern u16 D_800895C4;
extern u16 D_800895C6;
extern u16 D_800895C8;
extern u16 D_80088D28;

void audio_profile_load(u16 index)
{
    u32 offset = index * 14;
    u16 first = *(u16 *)((u32)&D_80073CCC + offset);
    u16 last;

    D_800895BC = *(u16 *)((u32)&D_80073CCC + offset + 2);
    D_800895BE = *(u16 *)((u32)&D_80073CCC + offset + 4);
    D_800895C0 = *(u16 *)((u32)&D_80073CCC + offset + 6);
    D_800895C4 = *(u16 *)((u32)&D_80073CCC + offset + 8);
    D_800895C6 = *(u16 *)((u32)&D_80073CCC + offset + 10);
    last = *(u16 *)((u32)&D_80073CCC + offset + 12);
    D_80088D28 = first;
    D_800895C8 = last;
}
