#include "m2c.h"

typedef struct Node { struct Node *prev; struct Node *next; s16 unk8; s32 id; u8 depth; } Node;
typedef struct { s32 pad[5]; s32 id; } Sel;
typedef struct { s32 unk0; Sel *sel; Node *head; Node *cur; s32 pad[3]; s32 unk1C; } List;
typedef struct { s32 pad[3]; List *list; } Obj;
Node *func_80033298(s32);
void func_800DB0AC(s32 *, u8, s32);
Node *func_800DFC54(Obj *arg0, s32 id, s32 after) {
    List *list = arg0->list;
    Node *n = func_80033298(list->unk0);
    Node *p;

    n->unk8 = 1;
    n->prev = NULL;
    n->next = NULL;
    n->id = id;
    for (p = list->head; p != NULL; p = p->next) {
        if (p->id == after) {
            break;
        }
    }
    n->depth = p->depth + 1;
    if (p->next != NULL) {
        p->next->prev = n;
        n->next = p->next;
        n->prev = p;
        p->next = n;
        for (p = n->next; p != NULL; p = p->next) {
            p->depth++;
        }
    } else {
        p->next = n;
        n->prev = p;
    }
    if (list->sel->id == id) {
        list->cur = n;
    }
    if (list->cur != NULL) {
        func_800DB0AC(&list->unk1C, list->cur->depth, 0);
    }
    return n;
}
