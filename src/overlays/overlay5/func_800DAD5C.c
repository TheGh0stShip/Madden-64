#include "types.h"

/*
 * func_800DAD5C: copy the display text for one record of a context into `destination`.
 *
 * func_8003FA40(handle, index, 3) returns a code byte: bits 5-7 select the kind of text and
 * bits 0-4 a small number.  Kinds 0x20 and 0x40 build the text in the record's own 20-byte
 * buffer: func_800167FC writes the number there, func_8002E65C appends a suffix
 * (D_8006E908 or D_8006E914), and when the number is 1 the last character is dropped
 * (a singular form).  Kinds 0xE0 and 0x60 use fixed strings; anything else, or an index
 * past the record count, uses the default text D_8006BFA0.
 */

typedef struct DAD5CRecord {
    char data[20];
} DAD5CRecord;

typedef struct DAD5CContext {
    u8 pad00[0x5A];
    u16 handle;
    u32 count;
    u8 pad60[0x10];
    DAD5CRecord *records;
} DAD5CContext;

extern char D_8006BFA0[];
extern char D_8006E43C[];
extern char D_8006E908[];
extern char D_8006E914[];
extern char D_8006E91C[];

s32 func_8003FA40(s32, s32, s32);
void func_800167FC(s32, void *);
s32 func_8004DF94(void *);
void func_8002E65C(void *, const void *);

void func_800DAD5C(s32 index_arg, void *destination, DAD5CContext *context) {
    s32 code;
    s32 length;
    u16 index;
    char *text = D_8006BFA0;
    u16 handle;
    u32 count;
    DAD5CRecord *records;

    code = index_arg;
    count = context->count;
    handle = context->handle;
    index = code;
    if (index < count) {
        records = context->records;
        code = func_8003FA40(handle, index, 3);
        switch (code & 0xE0) {
            case 0xE0:
                text = D_8006E43C;
                break;
            case 0x20: {
                s32 number;
                char *buffer;

                number = code & 0x1F;
                buffer = records[index].data;
                func_800167FC(number, buffer);
                length = func_8004DF94(buffer);
                func_8002E65C(buffer + length, D_8006E908);
                text = buffer;
                code = number;
                if (code == 1) {
                    length = func_8004DF94(text);
                    text[length - 1] = 0;
                }
                break;
            }
            case 0x40: {
                char *buffer;

                code &= 0x1F;
                buffer = records[index].data;
                func_800167FC(code, buffer);
                length = func_8004DF94(buffer);
                func_8002E65C(buffer + length, D_8006E914);
                if (code == 1) {
                    length = func_8004DF94(buffer);
                    buffer[length - 1] = 0;
                }
                text = buffer;
                break;
            }
            case 0x60:
                text = D_8006E91C;
                break;
        }
    }
    func_8002E65C(destination, text);
}
