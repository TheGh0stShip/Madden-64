#include "types.h"

typedef struct ObjectStreamInfo {
    u8 pad00[0xC];
    u32 valueC;
    u32 limit;
} ObjectStreamInfo;

typedef struct ObjectMethod {
    void *entry0;
    void *entry4;
} ObjectMethod;

typedef struct ObjectStreamState {
    u8 pad00[0x1AC];
    ObjectStreamInfo *info;
    u8 pad1B0[0x10];
    ObjectMethod *reader;
    u8 pad1C4[4];
    ObjectMethod *writer;
} ObjectStreamState;

typedef void (*ReadMethod)(ObjectStreamState *, u32, u32, u32,
                           u32, u32 *, u32);
typedef void (*WriteMethod)(ObjectStreamState *, u32, void *, u32);

void object_stream_process(ObjectStreamState *object, u32 arg1, u32 arg2,
                           u32 arg3, u8 *destination, u32 *position,
                           u32 end)
{
    ObjectStreamInfo *info = object->info;
    u32 available = end - *position;
    u32 produced;

    if (info->limit < available) {
        available = info->limit;
    }
    produced = 0;
    ((ReadMethod)object->reader->entry4)(object, arg1, arg2, arg3,
                                         info->valueC, &produced, available);
    ((WriteMethod)object->writer->entry4)(object, info->valueC,
                                           destination + *position * 4,
                                           produced);
    *position += produced;
}
