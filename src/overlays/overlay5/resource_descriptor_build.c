#include "types.h"

typedef struct Overlay5ResourceDescriptor Overlay5ResourceDescriptor;
typedef void (*Overlay5DescriptorCallback)(void *arg0, u8 kind, void *arg2);

struct Overlay5ResourceDescriptor {
    void *buffer;
    Overlay5DescriptorCallback first_callback;
    u8 pad08[4];
    u8 multiplier;
    u8 first_kind;
    u8 pad0E[6];
    Overlay5DescriptorCallback second_callback;
    u8 pad18[4];
    u8 count;
    u8 second_kind;
    u8 pad1E[6];
    u8 *sizes;
    u8 pad28[0x20];
    void *callback_arg0;
    void *callback_arg2;
};

typedef struct Overlay5ResourceOwner {
    u8 pad00[0xC];
    Overlay5ResourceDescriptor *descriptor;
} Overlay5ResourceOwner;

void *func_80032E00(s32 mode, s32 size);
void func_800DB00C(Overlay5ResourceDescriptor *descriptor);
void func_800DB55C(Overlay5ResourceDescriptor *descriptor);
void func_800DB934(Overlay5ResourceDescriptor *descriptor);
void func_800DC5BC(Overlay5ResourceDescriptor *descriptor);

void overlay5_resource_descriptor_build(
    Overlay5ResourceOwner *owner,
    Overlay5ResourceDescriptor *descriptor
) {
    u8 *size_ptr;
    u8 *size_end;
    u32 total;

    owner->descriptor = descriptor;
    total = 0;
    if (descriptor->first_callback != 0) {
        descriptor->first_callback(
            descriptor->callback_arg0,
            descriptor->first_kind,
            descriptor->callback_arg2
        );
    }
    if (descriptor->second_callback != 0) {
        descriptor->second_callback(
            descriptor->callback_arg0,
            descriptor->second_kind,
            descriptor->callback_arg2
        );
    }
    if (total < descriptor->count) {
        size_ptr = descriptor->sizes;
        size_end = (u8 *)((u32)descriptor->count + (u32)size_ptr);
        do {
            total += descriptor->multiplier * *size_ptr;
            size_ptr++;
        } while (size_ptr < size_end);
    }
    descriptor->buffer = func_80032E00(0, total);
    func_800DB00C(descriptor);
    func_800DB55C(descriptor);
    func_800DB934(descriptor);
    func_800DC5BC(descriptor);
}
