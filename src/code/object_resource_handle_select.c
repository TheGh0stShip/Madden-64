#include "types.h"

typedef struct ResourceOwner {
    u8 pad0[20];
    u32 flags;
} ResourceOwner;

typedef struct ResourceObject {
    u8 pad0[36];
    ResourceOwner *owner;
} ResourceObject;

extern s8 D_80087AFC;
extern s8 D_800876F4;
extern u8 D_80082D86[];
extern s8 D_80073E28[];
extern u32 D_80073DCC[];
extern u32 D_80073DF8[];
extern s8 D_80088484;

extern s32 func_80093F0C(void);
extern u16 func_80034D30(u32 resource, u32 mode, u32 value);
extern void func_800B7DD8(u32 type, u32 duration, u32 first, u32 second,
                         u32 extra);

u32 func_8003FD94(ResourceObject *object)
{
    register u32 resource __asm__("$16");
    s32 group = D_80087AFC;
    s32 slot = D_800876F4;
    s32 selector = D_80082D86[(group * 2131 + slot) * 4];
    s32 resource_index = D_80073E28[selector * 8];

    if (object->owner->flags & 0x00100000) {
        resource = D_80073DCC[resource_index];
    } else {
        resource = D_80073DF8[resource_index];
    }

    if (func_80093F0C() != 0) {
        if (func_80034D30(resource, 2, 0) != 0) {
            return resource;
        }
        if (D_80088484 == 0) {
            func_800B7DD8(2, 20, 0, 0, 0);
        }
    }
    return 0;
}
