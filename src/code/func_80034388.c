#include "types.h"

typedef struct {
    u8 frames;
    u8 group;
} Anim;

typedef struct {
    Anim *anim;
    u8 pad04[4];
} AnimSlot;

typedef struct {
    u8 pad00[4];
    Anim *current;
    s16 playing;
    s16 frame;
    s16 length;
    u8 pad0E[2];
    u16 speed;
    u8 pad12[2];
    s16 index;
    u8 pad16[2];
    AnimSlot *slots;
} AnimPlayer;

typedef struct {
    u8 pad00[8];
    AnimPlayer *player;
    u8 pad0C[8];
    s32 flags;
} AnimOwner;

extern void resource_descriptor_select(AnimPlayer *player);
extern u16 encoded_stream_weight_sum(Anim *anim, s32 frame);
extern void func_800346B4(AnimOwner *owner);

void func_80034388(AnimOwner *owner, s16 index) {
    AnimPlayer *player;
    Anim *current;
    Anim *next;
    u16 base;
    s16 saved_index = index;
    u8 slot = saved_index;
    AnimSlot *slots;

    player = owner->player;
    resource_descriptor_select(player);
    slots = player->slots;
    next = ((AnimSlot *)((u8 *)slots + ((u32)slot << 3)))[1].anim;
    current = player->current;
    if (current != 0 && next->group == current->group && next->group != 0) {
        if (next != current) {
            base = encoded_stream_weight_sum(current, player->length);
            player->speed = player->speed * encoded_stream_weight_sum(next, 0) / base;
            player->current = next;
            player->length = next->frames;
            player->playing = 1;
            player->frame = 0;
            player->index = saved_index;
            if (player->speed != 0) {
                func_800346B4(owner);
            }
        }
    } else {
        player->current = next;
        if (next != 0) {
            u8 frames = next->frames;

            do {
                player->playing = 0;
                player->frame = 0;
                player->speed = 0;
                player->index = saved_index;
                player->length = frames;
            } while (0);
        }
        owner->flags |= 0x20000;
    }
}
