#include "types.h"

typedef struct {
    u16 ids[16];
    s16 flags[16];
    u16 selected;
} SlotTable;

typedef struct {
    u8 pad[0x60];
    SlotTable *slots;
} Screen;

extern char D_800C3024[];

char *func_8003A7B8(u16);
char *func_8002E65C(char *dst, char *src); /* strcpy */

void func_8009F3C8(u16 index, char *dst, Screen *screen) {
    SlotTable *slots = screen->slots;
    char *name = func_8003A7B8(slots->ids[index]);

    if (slots->flags[index] == 1 || index == slots->selected) {
        func_8002E65C(dst, name + 1);
    } else {
        func_8002E65C(dst, D_800C3024);
    }
}
