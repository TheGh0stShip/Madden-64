#include "types.h"

typedef struct RuntimeRoot {
    u8 pad0[8];
    void *runtime;
} RuntimeRoot;

typedef struct RuntimeOutput {
    void *resource;
    void *first_handle;
    void *second_handle;
    u8 *records;
    u8 *objects;
    u16 source_id;
    s16 active_index;
    u8 enabled;
} RuntimeOutput;

typedef struct RuntimeConfigRecord {
    u16 id;
    u8 kind;
    u8 pad3;
} RuntimeConfigRecord;

typedef struct RuntimeConfig {
    u16 source_id;
    u16 group;
    u16 *sequence;
    u16 resource_id;
    u16 output_id;
    s32 finalize_id;
    RuntimeConfigRecord *records;
    s32 unused14;
    s32 *values;
    u16 flags;
} RuntimeConfig;

typedef struct RuntimeResource {
    u8 pad0[4];
    s16 first_count;
    s16 second_count;
} RuntimeResource;

typedef struct RuntimeEntry {
    u8 pad0[0x94];
    void *object;
    void *buffer;
    u8 pad9C[6];
    u16 flags;
} RuntimeEntry;

typedef struct RuntimeObjectData {
    u8 pad0[0xC];
    void *field_C;
    u8 pad10[0xE8];
    s32 value_F8;
} RuntimeObjectData;

typedef struct RuntimeObject {
    u8 pad0[8];
    RuntimeObjectData *data;
} RuntimeObject;

typedef struct RuntimeNodeArgs {
    s32 id;
    u16 mode;
    u16 kind;
    u8 pad08[4];
    s32 type;
    u8 pad10[8];
    void *extra;
    u8 pad1C[8];
    void *buffer;
} RuntimeNodeArgs;

typedef struct RuntimeNodeExtra {
    u8 pad0[8];
    void *field_8;
    u8 pad0C[0x40];
} RuntimeNodeExtra;

typedef struct RuntimeRequest {
    u16 source_id;
    u16 sequence;
    u16 field_04;
    u8 pad06[6];
    void *buffer;
    s32 field_10;
    u8 pad14[4];
    RuntimeNodeArgs args;
    RuntimeNodeExtra extra;
    u8 pad8C[2];
    u16 saved_mode;
} RuntimeRequest;

extern void *func_8000D5BC(s32, s32, s32);
extern void *func_8000D740(void *, s32, void *);
extern void func_8000DE34(s32, void *);
extern void func_8000EC58(void *);
extern void func_8000F330(void *, s32);
extern void func_80016FC4(u16);
extern u16 func_80016FD4(void);
extern void func_80017CDC(void *, s32);
extern void func_8002E17C(void *, void *, s32);
extern void *func_80032E00(s32, s32);
extern void func_80033308(s32, void *, s32, s32);
extern s32 func_80035598(u16, u16);
extern void func_80036268(u16, u16, void *);
extern void func_800408C8(s32, void *);
extern s32 D_8008A754;

void interface_runtime_update(RuntimeRoot *root, RuntimeConfig *config) {
    RuntimeRequest request;
    RuntimeOutput *output = root->runtime;
    void *first_handle;
    void *second_handle;
    RuntimeResource *resource;
    RuntimeEntry *entries;
    RuntimeEntry *entry_base;
    s32 entry_count;
    s32 allocation_size;
    s32 record_index;
    u16 source_id;
    s32 group;
    u16 output_id;
    u16 resource_id;
    s32 outer_offset;
    s32 inner_condition;
    s32 destination_offset;
    s32 source_offset;

    output->enabled = 1;
    source_id = config->source_id;
    group = config->group;
    output_id = config->output_id;
    output->active_index = 0;
    output->source_id = output_id;
    first_handle = (output->first_handle = func_8000D5BC(0, 0, 0));
    second_handle = (output->second_handle = func_8000D5BC(0, 0, 0));
    resource_id = config->resource_id;
    resource = func_80032E00(0, func_80035598(group, resource_id));
    output->resource = resource;
    func_80036268(group, resource_id, resource);
    entry_count = resource->first_count + resource->second_count;
    allocation_size = entry_count;
    entry_count *= 0x30;
    output->records = func_80032E00(0, entry_count);
    func_80033308(0, output->records, entry_count, 0);
    allocation_size *= 0xA4;
    entries = func_80032E00(0, allocation_size);
    output->objects = (u8 *) entries;
    func_80033308(0, entries, allocation_size, 0);
    request.saved_mode = func_80016FD4();
    func_80016FC4(group);

    do {
        request.args.type = 0x18A;
        request.args.mode = 2;
        request.source_id = source_id;
        request.field_04 = 0;
        request.field_10 = 0;
    } while (0);

    record_index = 0;
    request.sequence = config->sequence[0];
    if (request.sequence != 0) {
        entry_base = entries;
        for (; request.sequence != 0;) {
            void *node;

            if (config->records != 0) {
                if (((RuntimeConfigRecord *) ((record_index * 4) + (u32) config->records))->id != 0) {
                    void *buffer = func_80032E00(0, 0x800);
                    RuntimeObjectData *object;

                    request.buffer = buffer;
                    entry_base[record_index].buffer = buffer;
                    request.args.buffer = buffer;
                    node = func_8000D740(
                        first_handle,
                        8,
                        (request.args.id =
                             ((RuntimeConfigRecord *) ((record_index * 4) + (u32) config->records))->id,
                         &request));
                    object = ((RuntimeObject *) node)->data;
                    request.args.kind =
                        ((RuntimeConfigRecord *) ((record_index * 4) + (u32) config->records))->kind;
                    request.args.extra = &request.extra;
                    request.extra.field_8 = object->field_C;
                    entry_base[record_index].object = func_8000D740(second_handle, 0, &request.args);
                    func_80017CDC(entry_base[record_index].object, 1);
                } else {
                    node = func_8000D740(first_handle, 8, &request);
                    entry_base[record_index].buffer = 0;
                    entry_base[record_index].object = 0;
                }
            } else {
                node = func_8000D740(first_handle, 8, &request);
            }

            {
                RuntimeObjectData *object_data = ((RuntimeObject *) node)->data;

                if (config->values != 0) {
                    s32 value = *((s32 *) ((record_index * 4) + (u32) config->values));
                    object_data->value_F8 = value;
                    func_8000DE34(*((s32 *) ((record_index * 4) + (u32) config->values)), object_data);
                } else {
                    object_data->value_F8 = 0;
                    func_8000DE34(0, object_data);
                }
            }

            func_8000EC58(node);
            func_8000F330(node, 4);
            entry_base[record_index].flags = config->flags;
            record_index++;
            request.sequence = config->sequence[record_index];
        }
    }

    func_80016FC4(request.saved_mode);
    entry_count = resource->first_count + resource->second_count;
    if ((entry_count--) != 0) {
        outer_offset = (entry_count * 0x54) + 8;
        do {
            void **pointer;

            allocation_size = 11;
            pointer = (void **) (((u8 *) resource) + outer_offset + 0x50);
            do {
                inner_condition = allocation_size;
                if (*pointer != 0) {
                    *pointer = (u8 *) *pointer + (u32) resource;
                }
                pointer--;
                allocation_size--;
            } while (inner_condition != 0);
            outer_offset -= 0x54;
        } while ((entry_count--) != 0);
    }

    entry_count = resource->first_count + resource->second_count;
    if ((entry_count--) != 0) {
        destination_offset = entry_count * 0xA4;
        source_offset = (entry_count * 0x54) + 8;
        do {
            u8 *source;
            u8 *destination;

            do {
                destination = (u8 *) entries + destination_offset;
                source = destination;
                source = (u8 *) resource + source_offset;
                func_8002E17C(destination, source, 0x24);
                func_8002E17C(destination + 0x6C, source, 0x24);
            } while (0);
            destination_offset -= 0xA4;
            source_offset -= 0x54;
        } while ((entry_count--) != 0);
    }

    func_800408C8(config->finalize_id, output->objects);
    D_8008A754 = 0;
}
