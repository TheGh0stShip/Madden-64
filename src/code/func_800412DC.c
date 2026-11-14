#include "types.h"

typedef struct ListNode {
    struct ListNode *next;
    u8 pad04[4];
    u8 *value;
} ListNode;

typedef struct WorkState {
    u8 *rows;
    u8 *links;
    u8 *objects;
    u8 *values;
    u8 *output;
    u8 pad14[2];
    u16 index;
} WorkState;

typedef struct WorkOwner {
    u8 pad00[8];
    WorkState *state;
} WorkOwner;

extern void func_8001A520(ListNode *node);
extern void func_80040F60(void *a, void *b, void *c);

void func_800412DC(WorkOwner *owner, s32 count)
{
    WorkState *state = owner->state;
    s32 outer = 0;
    ListNode *node;

    if (count > 0) {
        do {
            node = *(ListNode **)(state->objects + 12);
            while (node != 0) {
                if (*(s16 *)(node->value + 0x16) < state->index) {
                    func_8001A520(node);
                }
                node = node->next;
            }
            {
                s32 n;
                s32 old_n;
                s32 offset48;
                s32 offset164;
                s32 offset84;
                n = *(s16 *)(state->rows + 4) +
                    *(s16 *)(state->rows + 6);
                node = *(ListNode **)(state->links + 12);
                if (n-- != 0) {
                    offset48 = n * 48;
                    offset164 = n * 164;
                    offset84 = n * 84 + 8;
                    do {
                        old_n = n;
                        func_80040F60(state->rows + offset84,
                                     state->output + offset164,
                                     state->values + offset48);
                        if (node != 0) {
                            node = node->next;
                        }
                        offset48 -= 48;
                        offset164 -= 164;
                        offset84 -= 84;
                        n--;
                    } while (old_n != 0);
                }
            }
            state->index++;
            outer++;
        } while ((u8)outer < count);
    }
}
