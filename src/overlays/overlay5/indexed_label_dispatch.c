#include "types.h"

extern u8 SOURCE;
extern u8 SUFFIX;
void func_800E2068(void *source, u8 *buffer, s32 mode);
void func_800167FC(s16 value, void *destination);
void func_8002E688(void *destination, void *suffix);

void overlay5_indexed_label_dispatch(u16 index, void *destination) {
    u8 buffer[0x138];

    func_800E2068(&SOURCE, buffer, 0);
    func_800167FC(*(s16 *)(buffer + index * 2 + 0xEE), destination);
    if (index < 9) {
        func_8002E688(destination, &SUFFIX);
    }
}
