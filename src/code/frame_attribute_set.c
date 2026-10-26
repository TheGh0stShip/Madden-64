#include "types.h"

extern s32 frame_identifier_find(u32 identifier);
extern void func_8003A8CC(u32 frame, u16 *values);
extern u8 *func_8003A368(void);

void frame_attribute_set(u16 frame, u32 attribute, u32 value)
{
    register u32 saved_attribute __asm__("$18");
    register u32 group __asm__("$16");
    register u32 saved_value __asm__("$19");
    register u32 index __asm__("$17");
    u16 values[55];
    u16 *cursor;
    register s32 resolved __asm__("$2");
    register u32 original_frame __asm__("$4");

    saved_attribute = attribute;
    __asm__("" : "=r"(saved_attribute) : "0"(saved_attribute));
    group = (u16)frame;
    saved_value = value;

    resolved = frame_identifier_find(group);
    original_frame = group;
    group = (u16)resolved;
    __asm__("" : "=r"(group) : "0"(group), "r"(original_frame));
    func_8003A8CC(original_frame, values);
    index = 0;
    group *= 55;
    cursor = values;
    do {
        if (*cursor == saved_attribute) {
            register u8 *base __asm__("$2") = func_8003A368();
            base += group;
            base[index] = saved_value;
            break;
        }
        index++;
        cursor++;
    } while (index < 55);
}
