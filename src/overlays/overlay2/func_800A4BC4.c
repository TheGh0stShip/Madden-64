#include "types.h"

typedef struct { u8 data[5]; } Name5;
typedef struct { u8 data[40]; } Name40;
extern Name5 D_8008BA78;
extern Name40 D_8008BA80;
extern u8 D_8008BAA8[];
extern u8 D_8006BEDC[];
extern u8 D_80073523[];
extern u8 D_80073524[];
extern u8 D_80073525[];
extern u16 D_80087A92;
extern volatile u8 D_80087A69;
extern u8 D_800C2B3C[];
extern u8 D_800C2B44[];
extern u8 D_800C2B4C[];
extern u8 D_800C2B54[];
extern u8 *D_800C2B5C[];
extern u8 *D_800C2B28[];
extern void *func_800DD634(void);
extern u16 func_8003DC54(u16);
extern u8 *func_8003A7B8(u16);
extern void func_8002E65C(u8 *, u8 *);
extern void func_8002E688(u8 *, u8 *);
extern void func_8001EC20(void *, s32);

void func_800A4BC4(u16 index, u8 *arg)
{
    Name5 special = D_8008BA78;
    Name40 flags = D_8008BA80;
    u8 *record;
    u8 *names;
    u16 id;
    u32 letter;
    u8 single[2];
    u8 *fields;
    record = *(u8 **)(arg + 0x68);
    id = *(index + record + 0x89);
    fields = arg + 0x74;
    func_800DD634();
    names = func_8003A7B8(func_8003DC54(id));
    if (id == 30) func_8002E65C(record + 0x5A, D_8006BEDC);
    else func_8002E65C(record + 0x5A, names + 1);
    func_8002E65C(record, D_800C2B5C[id]);
    letter = flags.data[id];
    if (letter != 0) {
        single[0] = letter;
        single[1] = 0;
        func_8002E688(record, single);
    }
    if (id == 30) func_8002E65C(record + 0x32, special.data);
    else func_8002E65C(record + 0x32, names + 0x40);
    func_8002E688(record + 0x32, D_8008BAA8);
    func_8002E688(record + 0x32, names + 0x2B);
    if (D_80073523[id * 16] & 2) *(u8 **)(fields + 0xC) = D_800C2B3C;
    else *(u8 **)(fields + 0xC) = D_800C2B44;
    if (D_80073524[id * 16] == 1) *(u8 **)(fields + 0x10) = D_800C2B4C;
    else *(u8 **)(fields + 0x10) = D_800C2B54;
    *(u8 **)(fields + 0x14) = D_80073525 + id * 16;
    if (D_80073523[id * 16] & 8) { letter = 0; goto record_join; }
    if (id == D_80087A92) { letter = D_80087A69; goto choice_done; }
    letter = (*(u8 **)(record + 0x84))[id];
record_join: letter &= 0xFF;
choice_done: *(u8 **)(fields + 0x18) = D_800C2B28[(u8)letter];
    func_8001EC20(*(u8 **)(record + 0xB4), 1);
    func_8001EC20(*(u8 **)(record + 0xB4), 17);
    func_8001EC20(*(u8 **)(record + 0xB4), 2);
    func_8001EC20(*(u8 **)(record + 0xB4), 3);
    func_8001EC20(*(u8 **)(record + 0xB4), 4);
    func_8001EC20(*(u8 **)(record + 0xB4), 5);
    func_8001EC20(*(u8 **)(record + 0xB4), 6);
}
