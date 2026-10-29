#include "types.h"

typedef struct {
    s32 unk00;
    s32 unk04;
} Name;

typedef struct {
    u8 pad00[0x10];
    char *text;
} Resource;

extern u8 D_8008A5D8;
extern Resource D_800BF218;

u8 func_8003E3E0(s32);
void func_800167FC(s32, Name *);
void func_8002E65C(char *, char *);
void func_8002E688(char *, Name *);
void func_800DD514(Resource *);

s32 func_800A3EB8(void) {
    Name name;
    char text[21] = "CONFIG...controller ";

    D_8008A5D8 = func_8003E3E0(0x9000);
    func_800167FC(D_8008A5D8 + 1, &name);
    func_8002E65C(D_800BF218.text, text);
    func_8002E688(D_800BF218.text, &name);
    func_800DD514(&D_800BF218);
    return 25;
}
