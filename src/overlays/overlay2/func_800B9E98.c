#include "types.h"

typedef struct {
    u8 pad00[0x4E];
    u8 left_handed;
    u8 dark;
} Tally;

extern Tally *D_800895EC;
extern char *D_80087784[];
char *func_8002E65C(char *, const char *);

void func_800B9E98(u16 slot, char *buf) {
    char light[] = "LIGHT";
    char dark[] = "DARK";

    func_8002E65C(buf, D_800895EC->dark ? dark : light);
    D_80087784[slot] = buf;
}
