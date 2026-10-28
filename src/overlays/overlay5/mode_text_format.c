#include "types.h"

extern u8 DEFAULT_TEXT;
extern u8 SUFFIX_1;
extern u8 SUFFIX_2;
extern u8 SUFFIX_3;
extern u8 SUFFIX_4;
extern u8 COMMON_SUFFIX;
void func_8002E65C(void *destination, void *source);
void func_800167FC(u8 value, u8 *text);
void func_8002E688(void *destination, void *source);

void overlay5_mode_text_format(s32 value, u8 *text) {
    u8 mode = value;

    if (mode >= 5) {
        func_8002E65C(text, &DEFAULT_TEXT);
        return;
    }

    func_800167FC(value, text);
    switch (mode) {
        case 1:
            func_8002E688(text, &SUFFIX_1);
            break;
        case 2:
            func_8002E688(text, &SUFFIX_2);
            break;
        case 3:
            func_8002E688(text, &SUFFIX_3);
            break;
        case 4:
            func_8002E688(text, &SUFFIX_4);
            break;
    }
    func_8002E688(text, &COMMON_SUFFIX);
}
