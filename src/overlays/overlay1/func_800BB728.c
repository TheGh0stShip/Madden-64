#include "types.h"

typedef struct Event {
    struct Event *next;
    struct Event *prev;
    s32 pos[3];
    u8 pad14[4];
    u16 rot[3];
    u8 pad1E[4];
    u16 time;
} Event;

typedef struct {
    u8 pad00[8];
    u16 now;
} Clock;

extern Clock *D_800718E8;
typedef struct {
    s32 pool;
    Event *head;
    u8 pad08[0x15 - 0x8];
    u8 count;
} EventQueue;

extern EventQueue D_80071934;

Event *func_80033298(s32);

Event *func_800BB728(s32 *pos, u16 *rot, u16 time) {
    Event *node;
    Event **head;
    Event *prev;
    u16 now;

    head = &D_80071934.head;
    prev = 0;
    if (*head == 0) {
        node = func_80033298(D_80071934.pool);
        *head = node;
        node->next = 0;
        node->prev = 0;
    } else {
        now = D_800718E8->now;
        node = *head;
        while (node) {
            if (time < now) {
                if (node->time < now && node->time >= time) {
                    break;
                }
            } else {
                if (node->time < now || node->time >= time) {
                    break;
                }
            }
            prev = node;
            node = node->next;
        }
        if (node != 0) {
            if (node->time != time) {
                if (node->prev) {
                    node = node->prev;
                    prev = node->next;
                    node->next = func_80033298(D_80071934.pool);
                    node->next->prev = node;
                    node = node->next;
                    node->next = prev;
                    if (prev) {
                        prev->prev = node;
                    }
                } else {
                    D_80071934.head = func_80033298(D_80071934.pool);
                    D_80071934.head->next = node;
                    node->prev = D_80071934.head;
                    node = D_80071934.head;
                    node->prev = 0;
                }
            } else {
                D_80071934.count--;
            }
        } else {
            node = func_80033298(D_80071934.pool);
            prev->next = node;
            node->next = 0;
            node->prev = prev;
        }
    }
    node->time = time;
    node->pos[0] = pos[0];
    node->pos[1] = pos[1];
    node->pos[2] = pos[2];
    node->rot[0] = rot[0];
    node->rot[1] = rot[1];
    node->rot[2] = rot[2];
    D_80071934.count++;
    return node;
}
