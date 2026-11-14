#include "types.h"

extern s32 frame_identifier_find(u32 identifier);
extern void func_8003A8CC(u32 frame, u16 *values);
extern u8 *func_8003A368(void);

void frame_attribute_set(u16 frame, u32 attribute, u8 value)
{
    u16 values[55];
    u32 group;
    u32 i;
    u8 *base;

    group = (u16)frame_identifier_find(frame);
    func_8003A8CC(frame, values);
    i = 0;

    do {
        if (values[i] == attribute) {
            base = func_8003A368();
            base += group * 55;
            base[i] = value;
            break;
        }
        i++;
    } while (i < 55);
}
