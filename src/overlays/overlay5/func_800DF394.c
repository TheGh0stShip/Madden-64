#include "types.h"

typedef struct StringEntryDF394 {
    u8 *text;
    u8 pad04[4];
} StringEntryDF394;

typedef struct StringTableDF394 {
    u8 pad00;
    u8 index;
    u8 pad02[2];
    StringEntryDF394 *items;
} StringTableDF394;

typedef struct DescriptorDF394 {
    u8 *text;
    u16 flags;
    u8 pad06[2];
    StringTableDF394 *table;
} DescriptorDF394;

typedef struct NodeDF394 {
    u8 pad00[4];
    struct NodeDF394 *next;
    u8 pad08[4];
    DescriptorDF394 *descriptor;
    u8 key;
} NodeDF394;

typedef struct ListDF394 {
    u8 pad00[8];
    NodeDF394 *head;
} ListDF394;

extern const u8 D_80002518[];
extern const u8 D_80002520[];

extern void func_8002E65C(u8 *destination, u8 *source);
extern s32 func_8002E628(const u8 *first, const u8 *second);

void func_800DF394(u32 key, u8 *destination, ListDF394 *list) {
    NodeDF394 *node;
    u8 *source;
    u8 *end;
    u8 count;
    s32 limit;

    node = list->head;
    count = 0;
    key &= 0xFFFF;
    limit = 0x20;
    while (count <= key) {
        if (node->key == key) {
            if ((node->descriptor->flags & 3) != 3) {
                func_8002E65C(destination, node->descriptor->text);
            } else {
                source = node->descriptor->table->items[node->descriptor->table->index].text;
                func_8002E65C(destination, source);
                if (node->descriptor->flags & 0x20) {
                    end = destination;
                    while (*end != 0) {
                        end++;
                    }
                    source = node->descriptor->table->items[node->descriptor->table->index].text;
                    while (*source != 0) {
                        source++;
                    }
                    *end = 0;
                    if (func_8002E628(D_80002518, destination) == 0) {
                        goto no_increment;
                    }
                    if (func_8002E628(D_80002520, destination) != 0) {
                        goto increment;
                    }
no_increment:
                    *end = limit;
                    goto copy_suffix;
increment:
                    *end = limit;
                    end++;
copy_suffix:
                    func_8002E65C(end, source + 1);
                    return;
                }
            }
            return;
        }
        count++;
        node = node->next;
    }
}
