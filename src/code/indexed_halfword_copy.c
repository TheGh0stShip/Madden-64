#include "types.h"

typedef struct CopyDescriptor {
    void* owner;
    u16 destination_index;
    u16 count;
    void* source;
} CopyDescriptor;

typedef struct CopyBuffer {
    u8 pad0[8];
    void* destination;
} CopyBuffer;

typedef struct CopyOwner {
    u8 pad0[8];
    CopyBuffer* buffer;
} CopyOwner;

typedef struct CopyRequest {
    u8 pad0[8];
    CopyDescriptor* descriptor;
} CopyRequest;

extern void func_8002E17C(void* destination, void* source, u32 byte_count);

void func_8001B54C(CopyRequest* request) {
    register CopyDescriptor* descriptor __asm__("$3") = request->descriptor;
    register u8* destination __asm__("$4");
    register void* source __asm__("$5");
    register u32 byte_count __asm__("$6");
    register u32 destination_index __asm__("$2");

    destination = (u8*)((CopyOwner*)descriptor->owner)->buffer;
    byte_count = descriptor->count;
    source = descriptor->source;
    destination_index = descriptor->destination_index;
    destination = *(u8**)(destination + 8);
    func_8002E17C(destination + destination_index * 2, source,
                  byte_count * 2);
}
