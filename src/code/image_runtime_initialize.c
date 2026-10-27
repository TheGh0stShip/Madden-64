#include "types.h"

extern void image_table_update(void);
extern void func_80060EF4(void);
extern void func_80060EFC(void *owner);
extern void image_table_process(void *object);
extern void image_table_decode(void *object);
extern void object_children_allocate(void *object);

typedef void *(*AllocateCallback)(void *object, s32 count, s32 size);
typedef void (*ObjectCallback)(void *object);

void image_runtime_initialize(u8 *object)
{
    register u8 *saved_object __asm__("$16") = object;
    register u8 *runtime __asm__("$2");
    register ObjectCallback callback __asm__("$2");

    __asm__("" : "=r"(saved_object) : "0"(saved_object));
    runtime = ((AllocateCallback)**(void ***)(saved_object + 4))(
        object, 1, 0x58);
    *(u8 **)(saved_object + 0x1C8) = runtime;
    *(void **)(runtime + 0x00) = image_table_update;
    *(void **)(runtime + 0x08) = func_80060EF4;
    *(void **)(runtime + 0x0C) = func_80060EFC;
    *(u32 *)(runtime + 0x44) = 0;
    *(u32 *)(runtime + 0x34) = 0;

    if (*(s32 *)(saved_object + 0x78) >= 5) {
        *(u32 *)(*(u8 **)saved_object + 0x14) = 0x36;
        *(u32 *)(*(u8 **)saved_object + 0x18) = 4;
        callback = *(ObjectCallback *)*(u8 **)saved_object;
        callback(saved_object);
    }
    if (*(s32 *)(saved_object + 0x60) >= 0x101) {
        *(u32 *)(*(u8 **)saved_object + 0x14) = 0x38;
        *(u32 *)(*(u8 **)saved_object + 0x18) = 0x100;
        callback = *(ObjectCallback *)*(u8 **)saved_object;
        callback(saved_object);
    }
    image_table_process(saved_object);
    image_table_decode(saved_object);
    if (*(s32 *)(saved_object + 0x58) == 2) {
        object_children_allocate(saved_object);
    }
}
