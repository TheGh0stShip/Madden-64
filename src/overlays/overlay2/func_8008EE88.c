#include "types.h"

typedef struct ScheduleEntry {
    u8 first;
    u8 second;
    u8 pad02[2];
    u8 state;
    u8 selected;
} ScheduleEntry;

extern u8 D_800C509C;
extern u8 D_800C50BC[];

ScheduleEntry *func_8008DC10(s16 week, s16 index);

void func_8008EE88(void) {
    s16 index = 0;
    s16 week = (s8)D_800C509C;

    do {
        ScheduleEntry *entry = func_8008DC10(week, index);

        if ((entry->first != 0xFF) && (entry->state == 0)) {
            if (D_800C50BC[entry->first] == 1) {
                entry->selected = 1;
            } else {
                entry->selected = 0;
            }
            if (D_800C50BC[entry->second] == 1) {
                entry->selected = 1;
            }
        }
        index++;
    } while (index < 15);
}
