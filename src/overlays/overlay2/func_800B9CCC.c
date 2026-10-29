#include "types.h"

typedef struct {
    u8 pad00[0xC];
    u16 minutes;
} Tally;

extern Tally *D_800895EC;
extern char D_80002D20[];
extern char D_80002D24[];
extern char D_800E796E[];
extern char *D_80087794;

void func_800167FC(s16, char *);
void func_8002E688(char *, char *);

void func_800B9CCC(s32 unused, char *buf) {
    u16 time = D_800895EC->minutes + 60;

    func_800167FC(time / 12, buf);
    func_8002E688(buf, D_80002D20);
    func_800167FC(time % 12, D_800E796E);
    func_8002E688(buf, D_800E796E);
    func_8002E688(buf, D_80002D24);
    D_80087794 = buf;
}
