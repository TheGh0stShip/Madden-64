#include "types.h"

typedef struct Vector3i {
    s32 x;
    s32 y;
    s32 z;
} Vector3i;

extern Vector3i D_80078440;
extern s32 D_80078444;
extern s32 D_80078448;
extern void func_8002DD68(Vector3i *input, Vector3i *output);

void vector_transform_to_bytes(const Vector3i *input, s8 *output)
{
    Vector3i local;
    register s8 *saved_output __asm__("$17") = output;
    register Vector3i *transformed __asm__("$16");
    register Vector3i *destination __asm__("$5");
    register s32 x __asm__("$2");
    register s32 y __asm__("$3");
    register s32 z __asm__("$5");
    register s32 reload_x __asm__("$2");
    register s32 reload_y __asm__("$3");
    register s32 reload_z __asm__("$4");
    __asm__("" : "=r"(saved_output) : "0"(saved_output));
    __asm__ volatile("" ::: "memory");

    x = input->x;
    y = input->y;
    z = input->z;
    __asm__("" : "=r"(x), "=r"(y), "=r"(z) : "0"(x), "1"(y), "2"(z));
    local.x = x;
    local.y = y;
    local.z = z;
    __asm__ volatile("" ::: "memory");
    reload_x = *(volatile s32 *)((u8 *)&local + 0);
    reload_y = *(volatile s32 *)((u8 *)&local + 4);
    reload_z = *(volatile s32 *)((u8 *)&local + 8);
    __asm__("" : "=r"(reload_x), "=r"(reload_y), "=r"(reload_z)
            : "0"(reload_x), "1"(reload_y), "2"(reload_z));
    transformed = &D_80078440;
    __asm__("" : "=r"(transformed) : "0"(transformed));
    destination = transformed;
    __asm__("" : "=r"(destination) : "0"(destination));
    local.x = reload_x;
    local.y = reload_y;
    local.z = reload_z;
    func_8002DD68(&local, destination);
    saved_output[0] = (transformed->x + 0x200) >> 10;
    saved_output[1] = (D_80078444 + 0x200) >> 10;
    saved_output[2] = (D_80078448 + 0x200) >> 10;
}
