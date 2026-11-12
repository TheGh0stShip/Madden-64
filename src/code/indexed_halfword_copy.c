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
    CopyDescriptor* descriptor = request->descriptor;
    u8* destination;
    void* source;
    u32 byte_count;
    u32 destination_index;

    byte_count = descriptor->count;
    destination = (u8*)((CopyOwner*)descriptor->owner)->buffer;
    source = descriptor->source;
    destination_index = descriptor->destination_index;
    destination = *(u8**)(destination + 8);
    destination += destination_index * 2;
    func_8002E17C(destination, source, byte_count * 2);
}
