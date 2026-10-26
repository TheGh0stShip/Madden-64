#include "types.h"

extern void *func_80019844(u32 size);
extern void func_8002E58C(void *pointer, s32 value, u32 size);
extern void func_80019944(void *stream, u32 offset, u32 mode);
extern void func_80019868(void *stream, void *output, u32 size, u32 mode);
extern void func_8001A224(void *resource);

void resource_node_process(u32 first, u32 second, u8 *resource)
{
    u8 *node;
    register u8 *first_alloc __asm__("$4");
    u8 *allocated;
    u16 temporary;
    u32 size;

    first_alloc = func_80019844(0x1C);
    *(u8 **)(resource + 0xC) = first_alloc;
    func_8002E58C(first_alloc, 0, 0x1C);
    allocated = func_80019844(0xC);
    **(u8 ***)(resource + 0xC) = allocated;
    func_8002E58C(**(u8 ***)(resource + 0xC), 0, 0xC);
    resource[0] = 0;
    node = **(u8 ***)(resource + 0xC);
    *(u32 *)(node + 0) = first;
    *(u32 *)(node + 4) = second;
    *(u16 *)(resource + 0x12) = 0;
    func_80019944(node, 4, 1);
    func_80019868(node, &temporary, 2, 0);
    func_80019868(node, resource + 0x10, 2, 0);
    func_80019868(node, *(u8 **)(resource + 0xC) + 0xC, 2, 0);
    func_80019868(node, *(u8 **)(resource + 0xC) + 0xE, 2, 0);
    func_80019944(node, 0x50, 1);
    func_80019868(node, *(u8 **)(resource + 0xC) + 0x10, 4, 1);
    func_80019868(node, *(u8 **)(resource + 0xC) + 0x14, 4, 1);
    size = *(u16 *)(*(u8 **)(resource + 0xC) + 0xC) *
           *(u16 *)(*(u8 **)(resource + 0xC) + 0xE);
    *(void **)(resource + 4) = func_80019844(size);
    *(void **)(resource + 8) = func_80019844(0x300);
    allocated = *(u8 **)(resource + 0xC);
    *(u32 *)(allocated + 8) = *(u32 *)(allocated + 0x10);
    func_8001A224(resource);
}
