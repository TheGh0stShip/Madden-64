#include "types.h"

extern u8 SOURCE;
void func_800E2068(void *source, u8 *buffer, s32 mode);
u8 *func_8003A7B8(u8 value);
void func_8002E65C(void *destination, void *source);

void overlay5_indexed_text_dispatch(u16 index, void *destination) {
    u8 buffer[0x138];
    u8 *text;

    func_800E2068(&SOURCE, buffer, 0);
    text = func_8003A7B8(buffer[index + 0x126]);
    func_8002E65C(destination, text + 0x55);
}
