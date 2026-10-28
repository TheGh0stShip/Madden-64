#include "types.h"

typedef struct Overlay5SmallDescriptor {
    u8 bytes[11];
} Overlay5SmallDescriptor;

extern Overlay5SmallDescriptor *DESTINATION;
extern Overlay5SmallDescriptor SOURCE;
extern u8 FLAG;
extern s16 INDEX;
extern void *POINTER;
extern u8 TARGET;
void func_800DD514(void *resource);

s32 overlay5_resource_descriptor_initialize(void) {
    s16 *index;

    FLAG = 0;
    *DESTINATION = SOURCE;
    index = &INDEX;
    *index = 0;
    POINTER = &TARGET;
    func_800DD514((u8 *)index - 0x1C);
    return 25;
}
