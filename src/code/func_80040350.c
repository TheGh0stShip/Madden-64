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
    WorkNode *previous;
    u8 pad8[8];
    void *action;
    s32 mode;
};

extern EventState D_8008B080[];
extern WorkNode *D_80071308;
extern WorkNode *D_80071304;
extern void *D_800724E0;
extern u8 D_800712F8;
extern s32 D_80088070;
extern s32 D_800895E0;
extern void func_800332C8(void *, void *);
extern void func_80036B94(void);

void func_80040350(s32 unused, EventRecord *event)
{
    if (event != 0) {
        register s32 reserve_v1 __asm__("$3");
        register s32 offset __asm__("$5") = event->offset;
        register WorkNode *node __asm__("$6");
        s32 mode;
        __asm__("" : "=r"(reserve_v1));
        unused = event->type;
        if (unused & 0x4000) {
            EventState *state = &D_8008B080[unused & 0xBFFF];
            state->value = 0;
            __asm__("" : : "r"(reserve_v1));
        } else {
            register u32 byte_offset __asm__("$2");
            register u8 *value __asm__("$3");
            byte_offset = unused << 1;
            byte_offset += unused;
            byte_offset <<= 3;
            __asm__("" : "=r"(byte_offset) : "0"(byte_offset));
            __asm__("" : : "r"(reserve_v1));
            value = *(u8 **)((u8 *)D_8008B080 + byte_offset);
            value[offset] &= 0xBF;
        }

        node = D_80071308;
        mode = node->mode;
        if (mode == 1) goto mode_1;
        if (mode == 0) goto mode_done;
        if (mode == 2) goto mode_2;
        if (mode == 3) goto mode_3;
        goto mode_done;
mode_1:
        ((void (*)(void))node->action)();
        goto mode_done;
mode_2:
        (*(s32 *)node->action)++;
        goto mode_done;
mode_3:
        *(s32 *)node->action = 0;
mode_done:

        {
            register WorkNode *head __asm__("$5") = D_80071308;
            register WorkNode *next __asm__("$2") = head->next;
            D_80071308 = next;
            if (next != 0) {
                next->previous = 0;
                __asm__ volatile("" : : : "memory");
            } else {
                __asm__("" : : : "$2");
                D_80071304 = 0;
            }
            func_800332C8(D_800724E0, head);
        }

        if (D_80071308 == 0) goto finish;
        if (D_800712F8 == 0) goto dispatch;
        __asm__ volatile("" : : : "memory");
        if (D_80088070 == -1) goto set_pending;
dispatch:
        func_80036B94();
        goto finish;
set_pending:
        D_800895E0 = 1;
finish:;
    }
}
