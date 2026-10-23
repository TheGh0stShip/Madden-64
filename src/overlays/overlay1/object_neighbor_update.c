#include "types.h"

typedef struct ObjectNode ObjectNode;

typedef struct {
    u8 pad00[0x16];
    u16 mode;
} ObjectDescriptor;

typedef struct {
    u8 pad00[0xA8];
    s32 position_x;
    s32 position_y;
} ObjectSource;

struct ObjectNode {
    u8 pad00[0x10];
    ObjectSource* source;
    u32 flags;
    u8 pad18[4];
    s32 position_x;
    s32 position_y;
    u8 pad24[0x24];
    ObjectDescriptor* descriptor;
    ObjectNode* previous;
    ObjectNode* next;
};

extern void func_800B9820(ObjectNode* node);
extern s32 func_800B9A20(ObjectNode* left, ObjectNode* right);

void func_800BE018(ObjectNode* node) {
    register ObjectNode* current asm("$16");
    register s32 result asm("$18") = 0;
    register s32 limit asm("$19");
    register u32 value asm("$3");
    ObjectSource* source;

    func_800B9820(node);
    if (!(node->flags & 0x200)) {
        goto check_result;
    }

    current = node->previous;
    if (current == 0) {
        goto scan_next;
    }
    limit = 0x280000;
scan_previous:
    if (node->position_y - current->position_y > limit) {
        goto scan_next;
    }
    if (current->flags & 0x200) {
        result |= func_800B9A20(current, node);
    }
    current = current->previous;
    __asm__ volatile("" ::: "memory");
    if (current != 0) {
        goto scan_previous;
    }

scan_next:
    __asm__ volatile("" ::: "memory");
    current = node->next;
    if (current == 0) {
        goto check_result;
    }
    limit = 0x280000;
scan_next_loop:
    if (current->position_y - node->position_y > limit) {
        goto check_result;
    }
    if (current->flags & 0x200) {
        result |= func_800B9A20(current, node);
    }
    current = current->next;
    __asm__ volatile("" ::: "memory");
    if (current != 0) {
        goto scan_next_loop;
    }

check_result:
    value = (u16)result;
    if (value != 1) {
        return;
    }
    value = node->descriptor->mode;
    if (value == 0) {
        goto restore_position;
    }
    if (value != 2) {
        return;
    }

restore_position:
    source = node->source;
    node->position_x = source->position_x;
    node->position_y = source->position_y;
}
