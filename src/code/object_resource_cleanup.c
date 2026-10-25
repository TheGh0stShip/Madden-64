#include "types.h"

extern void* D_80064BA0;

extern void func_80008E48(void* resource);
extern void func_8000C914(void* object);
extern void func_8000CBEC(void* object);
extern void func_800332C8(void* context, void* object);

void object_resource_cleanup(u8* object) {
    if ((*(u16*)(object + 0x206) & 0x40) == 0) {
        void* resource = *(void**)(object + 0x23C);
        if (resource != 0) {
            func_80008E48(resource);
            *(void**)(object + 0x23C) = 0;
        }
    }

    if ((*(u16*)(object + 0x206) & 0x10) != 0) {
        func_8000C914(object);
    }
    func_8000CBEC(object);
    func_800332C8(D_80064BA0, object);
}
