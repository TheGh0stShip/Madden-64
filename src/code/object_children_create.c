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
    register u32 saved_count __asm__("$18") = count;
    register void *saved_argument __asm__("$20");
    register u32 saved_type __asm__("$19");
    register ObjectChildList *list __asm__("$16");
    register u32 remaining __asm__("$17");
    register u32 current __asm__("$2");
    ObjectChildList *head;

    saved_argument = argument;
    saved_type = type;
    list = func_80033298(D_800782F0);
    head = D_80064BA8;
    remaining = saved_count;
    __asm__("" : "=r"(remaining), "=r"(saved_count)
            : "0"(remaining), "1"(saved_count));
    list->value = 0;
    list->child = 0;
    list->previous = 0;
    if (head != 0) {
        head->previous = list;
    }
    head = D_80064BA8;
    current = remaining;
    remaining = saved_count - 1;
    D_80064BA8 = list;
    list->next = head;
    if ((u16)current != 0) {
        saved_count = 0xFFFF;
        do {
            func_8000D740(list, (u16)saved_type, saved_argument);
            current = remaining;
            remaining += saved_count;
        } while ((u16)current != 0);
    }
    return list;
}
