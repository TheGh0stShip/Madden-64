#include "types.h"

typedef struct RecordD3C24 {
    u8 data[0x214C];
} RecordD3C24;

extern RecordD3C24 D_80080D6A[];
extern s32 func_8003B7FC(RecordD3C24*);
extern s32 func_8003B02C(RecordD3C24*);
extern s32 func_8003B3A0(RecordD3C24*);
extern s32 func_8003B6AC(RecordD3C24*);

s32 func_800D3C24(s16 index, s16 mode) {
    s16 value;

    value = 0;
    switch (mode) {
    case 0:
        value = (u16)func_8003B7FC(&D_80080D6A[index]) * 10;
        break;
    case 1:
        value = (u16)func_8003B02C(&D_80080D6A[index]) * 10;
        break;
    case 2:
        value = (u16)func_8003B3A0(&D_80080D6A[index]) * 10;
        break;
    case 3:
        value = (u16)func_8003B6AC(&D_80080D6A[index]) * 10;
        break;
    }
    value = (s16)value;
    value /= 13;
    if ((s16)value >= 78) {
        value = 77;
    }
    return (s16)value;
}
