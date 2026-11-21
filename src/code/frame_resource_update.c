#include "types.h"

typedef struct {
    u32 id : 7;
    u32 b : 7;
    u32 c : 13;
    u32 d : 5;
} Resource;

extern u8 *D_8006B9DC;

u8 func_80024BD4(u16);

void frame_resource_update(u16 index, u16 code, u16 type, s16 db, u16 dc, u16 dd) {
    s32 offset = 0;
    s32 count = 2;
    s16 result = 0;
    Resource *res;
    u16 id;
    s16 i;
    s32 v;

    switch (type) {
    case 0x21:
    case 0x22:
    case 0x23:
        break;
    case 0x24:
    case 0x25:
    case 0x26:
        offset = 0xF0;
        count = 1;
        break;
    }
    res = (Resource *)(D_8006B9DC + (offset + 0x5A9C));
    id = func_80024BD4(code);
    res += index * count;
    for (i = 0; i < count; i++) {
        if (id == res->id) {
            break;
        }
        if ((res->id == 0x7F) & (db != 0)) {
            res->id = id;
            res->d = 0;
            res->c = 0;
            res->b = 0;
            break;
        }
        res++;
    }
    if (i == count) {
        result = -1;
    }
    if (result == 0) {
        v = res->b + db;
        res->b = v;
        if ((v & 0x7F) != v) {
            res->b = 0x7F;
        }
        v = res->c + (s16)dc;
        res->c = v;
        if ((v & 0x1FFF) != v) {
            res->c = 0x1FFF;
        }
        v = res->d + (s16)dd;
        res->d = v;
        if ((v & 0x1F) != v) {
            res->d = 0x1F;
        }
    }
}
