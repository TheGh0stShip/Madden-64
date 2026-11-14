#include "types.h"

typedef struct ObjectChildList ObjectChildList;
struct ObjectChildList {
    ObjectChildList *previous;
    ObjectChildList *next;
    void *child;
    u32 value;
};

extern void *D_800782F0;
extern ObjectChildList *D_80064BA8;
extern void *func_80033298(void *pool);
extern void func_8000D740(ObjectChildList *list, u16 type, void *argument);

ObjectChildList *object_children_create(u32 count, u32 type, void *argument)
{
    u32 saved_count = count;
    void *saved_argument;
    u32 saved_type;
    ObjectChildList *list;
    u32 remaining;
    u32 current;
    ObjectChildList *head;

    saved_argument = argument;
    saved_type = type;
    list = func_80033298(D_800782F0);
    remaining = saved_count;
    head = D_80064BA8;
    list->value = 0;
    list->child = 0;
    list->previous = 0;
    if (head != 0) {
        remaining = saved_count;
        head->previous = list;
    }
    head = D_80064BA8;
    current = remaining;
    remaining = saved_count - 1;
    D_80064BA8 = list;
    list->next = head;
    if ((u16)current != 0) {
        saved_count = 0xFFFF;
child_loop:
        func_8000D740(list, (u16)saved_type, saved_argument);
        current = remaining;
        if (list != 0) {
            current = remaining;
        }
        if ((u16)current != 0) {
            remaining += saved_count;
            goto child_loop;
        }
        remaining += saved_count;
    }
    return list;
}
