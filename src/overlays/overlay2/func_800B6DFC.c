#include "types.h"

typedef struct {
    char *name;
    s32 value;
} NameEntry;

extern NameEntry D_800C07C8[];

void func_8002E65C(char *, char *);

void func_800B6DFC(u16 index, char *buf) {
    func_8002E65C(buf, D_800C07C8[index].name);
}
