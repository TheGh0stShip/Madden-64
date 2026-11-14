#include "types.h"

typedef struct PlayerRecord {
    u8 pad00[4];
    u8 type;
    u8 pad05[35];
} PlayerRecord;

extern PlayerRecord *D_80088094;

extern s16 func_8002209C(u16, u16, u16);
extern u16 func_80022E74(u16, u16, u16);
extern void func_8002212C(u16, u16, u16, u16);

void func_80022918(s32 input0, s32 input1, s32 input2)
{
    u16 arg0 = input0;
    u16 arg1 = input1;
    u16 arg2 = input2;
    s32 first;
    s16 second;
    u16 value;
    u16 index = 0;
    u8 type = 1;

    do {
        if (D_80088094[index].type == type) {
            first = func_8002209C(arg0, arg2, index);
            first &= 0xFFFF;
            if (first != 0xFFFF) {
                second = func_8002209C(arg0, arg1, index);
                if (second != -1) {
                    value = func_80022E74(arg0, index, second);
                    func_8002212C(arg0, value, index, second);
                }
                func_8002212C(arg0, arg1, index, first);
            }
        }
        index++;
    } while (index < 40);
}
