#include "types.h"

typedef struct {
    u8 pad00[0x3E];
    u8 name[2];
} Tally;

extern Tally *D_800895EC;

s32 func_8004DF94(u8 *text);

void func_800BB384(void) {
    s32 length;
    s8 index;

    length = func_8004DF94(D_800895EC->name);
    if ((s8)length > 0) {
        index = length - 1;
        while ((D_800895EC->name[index] == ' ') & (index >= 0)) {
            D_800895EC->name[index] = 0;
            index--;
        }
    }

    if (func_8004DF94(D_800895EC->name) == 0) {
        D_800895EC->name[0] = 'A';
        D_800895EC->name[1] = 0;
    }
}
