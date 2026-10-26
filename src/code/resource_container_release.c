#include "types.h"

typedef struct ResourceContainer {
    u8 *header;
    void *first;
    void *second;
    void *third;
    u8 *records;
} ResourceContainer;

extern void func_8000D684(void *pointer);
extern void func_80032F3C(s32 unused, void *pointer);

void resource_container_release(void *owner)
{
    register ResourceContainer *container __asm__("$17") =
        *(ResourceContainer **)((u8 *)owner + 8);
    s32 count = container->header[5] + container->header[7];
    register s32 index __asm__("$16") = count - 1;
    register s32 condition __asm__("$2");

    if ((count & 0xFF) == 0) goto release_arrays;
loop:
    {
        void *pointer = *(void **)(container->records + (index & 0xFF) * 0xA4 + 0x98);
        condition = index;
        if (pointer != 0) {
            func_80032F3C(0, pointer);
            condition = index;
        }
        if ((condition & 0xFF) != 0) {
            index--;
            goto loop;
        }
    }

release_arrays:
    func_8000D684(container->first);
    func_8000D684(container->second);
    func_80032F3C(0, container->third);
    func_80032F3C(0, container->records);
    func_80032F3C(0, container->header);
}
