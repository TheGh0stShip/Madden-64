#include "types.h"

extern void object_index_stream_decode(void *object, void *records);
extern s32 object_lookup_finalize(void *object, void *records, s32 first,
                                  s32 count);
extern void object_lookup_process(void *object, void *record, s32 index);

typedef void *(*AllocateCallback)(void *object, s32 count, s32 size);
typedef void (*ObjectCallback)(void *object, s32 value);

void object_lookup_initialize(u8 *object, s32 count)
{
    register u8 *saved_object __asm__("$19") = object;
    register s32 saved_count __asm__("$16") = count;
    register u8 *records __asm__("$17");
    register s32 index __asm__("$18");
    register s32 record_count __asm__("$20");
    ObjectCallback callback;
    volatile u64 padding;

    __asm__("" : "=r"(saved_object), "=r"(saved_count)
               : "0"(saved_object), "1"(saved_count));
    records = ((AllocateCallback)**(void ***)(saved_object + 4))(
        object, 1, saved_count << 5);
    index = 0;
    *(u32 *)(records + 0x00) = 0;
    *(u32 *)(records + 0x04) = 0x1F;
    *(u32 *)(records + 0x08) = 0;
    *(u32 *)(records + 0x0C) = 0x3F;
    *(u32 *)(records + 0x10) = 0;
    *(u32 *)(records + 0x14) = 0x1F;
    object_index_stream_decode(saved_object, records);
    record_count = object_lookup_finalize(saved_object, records, 1,
                                          saved_count);
    if (record_count > 0) {
        saved_count = (s32)records;
        do {
            object_lookup_process(saved_object, (void *)saved_count, index);
            index++;
            saved_count += 0x20;
        } while (index < record_count);
    }
    *(s32 *)(saved_object + 0x84) = record_count;
    *(u32 *)(*(u8 **)saved_object + 0x14) = 0x5F;
    *(s32 *)(*(u8 **)saved_object + 0x18) = record_count;
    callback = *(ObjectCallback *)(*(u8 **)saved_object + 4);
    callback(saved_object, 1);
}
