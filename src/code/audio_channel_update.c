#include "types.h"

typedef struct AudioChannel {
    volatile u32 field00;
    volatile u32 field04;
    volatile u32 field08;
    volatile u32 field0C;
    void *volatile buffer0;
    void *volatile buffer1;
    volatile u32 flags;
    void (*volatile callback)(struct AudioChannel *);
} AudioChannel;

typedef struct AudioContextObject {
    u8 pad00[0xF8];
    volatile u32 flags;
} AudioContextObject;

typedef struct AudioContext {
    u8 pad00[0x14];
    volatile AudioContextObject *object;
} AudioContext;

extern s32 D_80073508;
extern s32 D_800734F8;
extern u16 D_80085D42;
extern s32 D_80086CB8;
extern void *D_8007E808;
extern void *D_8008B344;
extern s32 D_8008B650;
extern AudioContext *D_80064A00;
extern AudioChannel *D_80087B6C;
extern s32 D_80084F60[];
extern s32 D_8008B798[];
extern u8 D_800885F0[];
extern void *volatile D_8008B348;
extern void *volatile D_8008B34C;

extern void *func_80035610(u16 handle, s32 index);
extern void *func_800355D8(u16 handle, s32 index);
extern void func_80045B68(void *first, void *second, s32 count);
extern void func_8003D600(AudioChannel *channel);

void audio_channel_update(s32 index)
{
    register s32 saved_index __asm__("$16") = index;
    register s32 lock __asm__("$17");
    register s32 counter __asm__("$20");
    register s32 *clear_slot __asm__("$19");
    register s32 *second __asm__("$18");
    register u8 *first __asm__("$16");
    register volatile AudioContextObject *object __asm__("$4");
    register AudioChannel *channel __asm__("$17");

    if (D_80073508 == 0) {
        return;
    }
    lock = D_800734F8;
    if (lock != -1) {
        return;
    }

    D_800734F8 = saved_index;
    D_80086CB8 = 0;
    D_8007E808 = (u8 *)func_80035610(D_80085D42, saved_index) + 4;
    D_8008B344 = (u8 *)func_800355D8(D_80085D42, saved_index) - 4;
    D_8008B650 = 0;
    object = D_80064A00->object;
    if (object->flags & 5) {
        D_800734F8 = lock;
        return;
    }

    object = (AudioContextObject *)((u8 *)object + 0xE0);
    __asm__("" : "=r"(object) : "0"(object));
    channel = (AudioChannel *)object;
    D_80087B6C = channel;
    counter = 1;
    clear_slot = &D_80084F60[1];
    second = &D_8008B798[1];
    first = &D_800885F0[0x18];
    do {
        func_80045B68(first, second, 1);
        *clear_slot = 0;
        clear_slot--;
        second--;
        first -= 0x18;
    } while (counter-- != 0);

    func_8003D600(channel);
    func_8003D600(channel);
    channel->field04 = D_80073508 * 2 + 1;
    channel->field00 = channel->field04;
    channel->buffer0 = D_8008B348;
    channel->buffer1 = D_8008B34C;
    channel->field0C = 0;
    channel->field08 = channel->field0C;
    channel->callback = func_8003D600;
    channel->flags |= 6;
}
