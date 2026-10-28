#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct Node {
    struct Node *next;
    struct Node *prev;
    u8 pad08[0x1A];
    u16 id;
} Node;

typedef struct {
    Node *head;
    Node *cur;
    u8 pad08[4];
    u8 active;
} Queue;

extern Queue D_8007193C;
extern u16 D_80087AC4;

void func_800B71FC(u16, Node *, Node *);
u16 func_800B74D8(u16);

void func_800BBC20(void) {
    if (D_8007193C.active) {
        if (D_8007193C.cur != NULL) {
            do {
                if (func_800B74D8(D_8007193C.cur->id) > func_800B74D8(D_80087AC4)) {
                    break;
                }
                D_8007193C.head = D_8007193C.cur;
                D_8007193C.cur = D_8007193C.cur->next;
            } while (D_8007193C.cur != NULL);
        }
        if (D_8007193C.head != NULL) {
            do {
                if (func_800B74D8(D_8007193C.head->id) < func_800B74D8(D_80087AC4)) {
                    break;
                }
                D_8007193C.cur = D_8007193C.head;
                D_8007193C.head = D_8007193C.head->prev;
            } while (D_8007193C.head != NULL);
        }
        if (D_8007193C.head == NULL) {
            D_8007193C.head = D_8007193C.cur;
            D_8007193C.cur = D_8007193C.cur->next;
        }
        if (D_8007193C.cur == NULL) {
            D_8007193C.cur = D_8007193C.head;
            D_8007193C.head = D_8007193C.head->prev;
        }
        func_800B71FC(D_80087AC4, D_8007193C.head, D_8007193C.cur);
    }
}
