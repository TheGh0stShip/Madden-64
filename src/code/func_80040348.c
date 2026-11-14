#include "types.h"

typedef struct EventRecord {
    u8 pad0[8];
    s32 offset;
    u16 type;
} EventRecord;

typedef struct EventState {
    void *value;
    u8 pad4[0x14];
} EventState;

typedef struct WorkNode WorkNode;
struct WorkNode {
    WorkNode *next;
    WorkNode *volatile previous;
    u8 pad8[8];
    void *action;
    s32 mode;
};

extern EventState D_8008B080[];
extern WorkNode *volatile D_80071308;
extern WorkNode *volatile D_80071304;
extern void *D_800724E0;
extern volatile u8 D_800712F8;
extern volatile s32 D_80088070;
extern volatile s32 D_800895E0;
extern void func_800332C8(void *, void *);
extern void func_80036B94(void);

void func_80040348(s32 unused, EventRecord *event, WorkNode *node)
{
    event = (EventRecord *)D_80071308;

    if (event != 0) {
        s32 offset = event->offset;
        s32 type = event->type;
        s32 mode;

        if (type & 0x4000) {
            EventState *state;
            type &= 0xBFFF;
            state = &D_8008B080[type];
            state->value = 0;
        } else {
            u8 *bytes = D_8008B080[type].value;
            bytes[offset] &= 0xBF;
        }

        node = D_80071308;
        mode = node->mode;
        if (mode == 1) goto mode_1;
        if (mode == 0) goto mode_done;
        if (mode == 2) goto mode_2;
        if (mode == 3) goto mode_3;
        goto mode_done;
mode_1:
        ((void (*)(s32, s32, WorkNode *))node->action)(type, offset, node);
        goto mode_done;
mode_2:
        (*(s32 *)node->action)++;
        goto mode_done;
mode_3:
        *(s32 *)node->action = 0;
mode_done:

        {
            WorkNode *head = D_80071308;
            WorkNode *next = head->next;
            D_80071308 = next;
            if (next != 0) {
                next->previous = 0;
            } else {
                D_80071304 = 0;
            }
            func_800332C8(D_800724E0, head);
        }

        if (D_80071308 == 0) goto finish;
        if (D_800712F8 == 0) goto dispatch;
        if (D_80088070 == -1) goto set_pending;
dispatch:
        func_80036B94();
        goto finish;
set_pending:
        D_800895E0 = 1;
finish:;
    }
}
