#include "types.h"

extern u32 D_80073438;
extern u32 D_80073440;
extern u32 func_80037258(void);
extern s32 func_80024B90(u16 value);
extern s32 func_80028A58(u16 value);
extern void func_8003A8CC(u16 index, u16 *entries);
extern u8 *func_8003A368(void);
extern void func_80037290(u32 state);

void func_800372B4(u32 value, u8 *destination)
{
    register u32 saved_value __asm__("$18") = value;
    register u8 *saved_destination __asm__("$19") = destination;
    register u32 state __asm__("$20");
    register u32 table_offset __asm__("$16");
    register u32 index __asm__("$17");
    u16 entries[56];

    if (D_80073440 != 0 && D_80073438 != 0) {
        state = func_80037258();
        table_offset = (u8)func_80024B90((u16)saved_value);
        if (table_offset != 0xFF) {
            register u32 resolved __asm__("$2");
            register u32 lookup_arg __asm__("$4");

            table_offset = (u16)table_offset;
            __asm__("" : "=r"(table_offset) : "0"(table_offset));
            resolved = func_80028A58(table_offset);
            lookup_arg = table_offset;
            __asm__("" : "=r"(lookup_arg) : "0"(lookup_arg));
            table_offset = (u16)resolved;
            __asm__("" : "=r"(table_offset) : "0"(table_offset));
            func_8003A8CC(lookup_arg, entries);
            index = 0;
            table_offset *= 55;
            {
            register u16 *entry __asm__("$3") = entries;

            while (index < 55) {
                if (*entry == saved_value) {
                    u8 *result = func_8003A368();

                    result += table_offset;
                    result += index;
                    *saved_destination = *result;
                    break;
                }
                index++;
                entry++;
            }
            }
        }
        func_80037290(state);
    }
}
