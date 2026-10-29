#include "types.h"

typedef struct {
    u8 pad00[0x3E];
    char name[1];
} Tally;

extern Tally *D_800895EC;
extern char *D_80087784[];

void func_8002E65C(char *, char *);

void func_800B9BE0(u16 slot, char *buf) {
    func_8002E65C(buf, D_800895EC->name);
    D_80087784[slot] = buf;
}
