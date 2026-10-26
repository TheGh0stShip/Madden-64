#include "types.h"

typedef struct ResourceInput {
    u16 flags;
    u16 pad2;
    u32 first;
    u32 second;
    u8 padC[4];
    u16 count;
} ResourceInput;

typedef struct ResourceData {
    void *first;
    void *second;
    u16 flags;
    u16 fieldA;
    u16 fieldC;
    u16 fieldE;
    void *record;
    s32 index;
    void *handle;
    u16 count;
    u16 pad1E;
    void *first_copy;
    void *global_copy;
    void *global_words;
    void *first_words;
} ResourceData;

typedef struct Resource {
    u8 pad0[8];
    ResourceData *data;
    u8 padC[8];
    s32 active;
    u8 pad18[4];
    void *field1C;
    void *field20;
    void *field24;
} Resource;

extern u8 * volatile D_80069294;
extern s32 D_800692AC;
extern void *D_80069298;
extern Resource *D_8007947C[];
extern void *func_8000D5BC(s32, s32, s32, void *);
extern void func_8001B098(Resource *, ResourceData *);
extern void *func_80032E00(s32 pool, u32 size);
extern void func_80033308(s32 pool, void *destination, u32 size, s32 offset);

void resource_buffers_update(Resource *resource, ResourceInput *input)
{
    register Resource *saved_resource __asm__("$18");
    register ResourceInput *saved_input __asm__("$16");
    register ResourceData *data __asm__("$17");
    register u32 size __asm__("$16");
    register u32 original_size __asm__("$19");
    register void *source __asm__("$2");
    register u8 *lookup_base __asm__("$3");
    register u8 *record_base __asm__("$8");
    register u32 lookup_offset __asm__("$2");
    register void *record __asm__("$7");
    register s32 zero0 __asm__("$4");
    register s32 zero1 __asm__("$5");
    register s32 zero2 __asm__("$6");
    register s32 index __asm__("$3");
    register s32 next_index __asm__("$2");
    register u8 *record_address __asm__("$2");

    saved_resource = resource;
    saved_input = input;
    __asm__("" : "=r"(saved_resource), "=r"(saved_input)
              : "0"(saved_resource), "1"(saved_input));
    data = saved_resource->data;

    data->flags = saved_input->flags;
    data->first = saved_input->first;
    data->second = saved_input->second;
    zero0 = 0;
    zero1 = 0;
    __asm__ volatile("" : "=r"(zero0), "=r"(zero1)
                     : "0"(zero0), "1"(zero1) : "memory");
    lookup_offset = saved_input->flags & 0xFFFC;
    lookup_base = D_80069294;
    record_base = D_80069294;
    record_address = (u8 *)(lookup_offset + (u32)lookup_base);
    index = D_800692AC;
    record = (void *)*(u32 *)record_address;
    zero2 = 0;
    next_index = index + 1;
    record = (void *)((u32)record + (u32)record_base);
    data->record = record;
    data->index = index;
    D_800692AC = next_index;
    D_8007947C[index] = saved_resource;
    saved_resource->active = 1;
    data->fieldA = 0;
    data->handle = func_8000D5BC(zero0, zero1, zero2, record);
    data->count = saved_input->count + 2;
    func_8001B098(saved_resource, data);

    source = D_80069298;
    __asm__("" : "=r"(source) : "0"(source));
    if (source != 0) {
        original_size = *(u32 *)source;
        size = original_size;
        size++;
        data->global_copy = func_80032E00(0, size);
        func_80033308(0, data->global_copy, size, 0);
        size *= 4;
        data->global_words = func_80032E00(0, size);
        func_80033308(0, data->global_words, size, 0);
        *(u32 *)data->global_words = original_size;
    } else {
        __asm__("" : "=r"(source));
        data->global_copy = 0;
        data->global_words = 0;
    }
    source = data->first;
    __asm__("" : "=r"(source) : "0"(source));
    if (source != 0) {
        original_size = *(u32 *)source;
        size = original_size;
        size++;
        data->first_copy = func_80032E00(0, size);
        func_80033308(0, data->first_copy, size, 0);
        size *= 4;
        data->first_words = func_80032E00(0, size);
        func_80033308(0, data->first_words, size, 0);
        *(u32 *)data->first_words = original_size;
    } else {
        __asm__("" : "=r"(source));
        data->first_copy = 0;
        data->first_words = 0;
    }
    saved_resource->field24 = 0;
    saved_resource->field20 = 0;
    saved_resource->field1C = 0;
    data->fieldE = 0;
    data->fieldC = 0;
}
