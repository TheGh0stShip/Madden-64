#include "types.h"

typedef struct AudioSlot {
    s32 left;
    s32 right;
    s32 field08;
    s32 field0C;
    void *source;
    void *callback;
    u32 flags;
    u32 pad1C;
} AudioSlot;

typedef struct AudioContext {
    u8 pad00[0x14];
    AudioSlot *slots;
} AudioContext;

typedef struct AudioResource {
    void *source;
    void *callback;
    s32 left_scale;
    s32 right_scale;
} AudioResource;

extern s32 D_80073508;
extern AudioContext *D_80064A00;
extern AudioResource D_80087B70[];
extern s8 D_80087B10[];
extern s8 D_80087B08[];
extern u8 D_8008B790[];

void audio_channel_process(s32 channel, s32 left_input, s32 right_input)
{
    register s32 left __asm__("$5") = left_input;
    register s32 right __asm__("$6") = right_input;
    register AudioContext *context __asm__("$7");
    register s32 slot __asm__("$8");
    register s32 channel_offset __asm__("$7");
    AudioSlot *entry;
    s32 owner;
    s32 scale;
    register s32 clamp __asm__("$3");
    register s32 scan_test __asm__("$2");

    if (D_80073508 == 0) return;
    context = D_80064A00;
    if (context == 0) return;
    if (D_80087B70[channel].source == 0) return;
    if (D_80087B10[channel] >= 0) return;

    clamp = 0x7F;
    if (left < 0x80) clamp = left;
    left = clamp;
    __asm__("" : "=r"(left) : "0"(left));
    clamp = 0x7F;
    if (right < 0x80) clamp = right;
    right = clamp;
    __asm__("" : "=r"(right) : "0"(right));
    slot = 5;
    if (channel == 0x14) slot = 6;
    if (channel == 0x15) slot = 6;
    if (channel == 0x17) slot = 7;
    if (channel == 0x18) slot = 7;

    scan_test = slot;
    __asm__("" : "=r"(scan_test) : "0"(scan_test));
    slot--;
    if (scan_test == 0) goto scan_done;
    entry = (AudioSlot *)((u32)(slot << 5) + (u32)context->slots);
scan:
    if ((entry->flags & 5) == 0) goto scan_done;
    context = (AudioContext *)slot;
    entry--;
    slot--;
    if (context != 0) {
        goto scan;
    }
scan_done:
    if (slot < 0) return;

    owner = D_80087B08[slot];
    if (owner >= 0) {
        D_80087B10[owner] = -1;
        D_80087B08[slot] = -1;
        D_8008B790[slot] = 0;
    }
    channel_offset = channel << 4;
    if (D_80087B70[channel].source == 0) return;

    scale = D_80073508 + 1;
    left = (left + 1) * scale;
    right = (right + 1) * scale;
    left *= D_80087B70[channel].left_scale;
    right *= D_80087B70[channel].right_scale;
    entry = &D_80064A00->slots[slot];
    left >>= 14;
    right >>= 14;
    if (left >= 16) left = 15;
    if (right >= 16) right = 15;
    if (left < 0) left = 0;
    if (right < 0) right = 0;
    entry->left = left;
    entry->right = right;
    entry->source = D_80087B70[channel].source;
    entry->callback = D_80087B70[channel].callback;
    entry->field0C = 0;
    entry->field08 = 0;
    if (entry->callback != 0) entry->flags |= 6;
    else entry->flags |= 4;
    D_80087B10[channel] = slot;
    D_80087B08[slot] = channel;
}
