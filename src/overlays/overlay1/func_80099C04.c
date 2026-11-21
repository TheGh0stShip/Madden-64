#include "types.h"

typedef struct Frame {
    u16 width;
    u16 height;
    u8 unk_04;
    u8 unk_05;
    u8 flags;
    u8 pad07;
    u32 *data;
    u8 pad0C[4];
} Frame;

typedef struct Sprite {
    u8 pad00[0x20];
    Frame *frames;
    u16 unk_24;
    u16 unk_26;
    u8 pad28[0x2C];
    u32 *unk_54;
    s16 unk_58;
    u16 unk_5A;
    u16 unk_5C;
    u16 unk_5E;
    u16 unk_60;
    u8 pad62[0xE];
    s32 unk_70;
} Sprite;

typedef struct Obj {
    u8 pad00[8];
    Sprite *sprite;
} Obj;

void func_80096AF8(u32 *dst, u32 *src);
void func_8002F930(Obj *obj, Frame *frame, u32 *buffer);

void func_80099C04(Obj *obj)
{
    Sprite *sprite = obj->sprite;
    s32 index = sprite->unk_60 & 0x3FFF;
    Frame *frames = sprite->frames;
    u32 *src;
    u32 *dst;
    s32 n;
    u16 v;

    sprite->unk_24 = frames[index].width;
    sprite->unk_26 = frames[index].height;
    sprite->unk_5A = frames[index].unk_04 * 2;
    sprite->unk_5E = frames[index].unk_05;
    if (frames[index].flags & 0x40) {
        v = frames[index].unk_04 * 4;
        sprite->unk_58 = 1;
        sprite->unk_5C = v;
    } else {
        v = sprite->unk_5A;
        sprite->unk_58 = 0;
        sprite->unk_5C = v;
    }
    if (frames[index].flags & 1) {
        if (sprite->unk_70 == 0) {
            func_80096AF8(sprite->unk_54, frames[index].data);
            func_8002F930(obj, &frames[index], sprite->unk_54);
        }
    } else if (sprite->unk_70 == 0) {
        src = frames[index].data;
        dst = sprite->unk_54;
        n = sprite->unk_5A * sprite->unk_5E;
        n += 3;
        n = (u32)n >> 2;
        while (n--) {
            *dst++ = *src++;
        }
        func_8002F930(obj, &frames[index], sprite->unk_54);
    }
}
