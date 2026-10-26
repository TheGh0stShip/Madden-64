#include "types.h"

u32 encoded_stream_weight_sum(u8 *stream, u32 value)
{
    register u32 total __asm__("$8") = 0;
    register s32 index __asm__("$7") = 0;
    register u32 entry __asm__("$6");
    register u32 v0 __asm__("$2");
    register s32 kind __asm__("$3");
    register s32 c8000 __asm__("$10");
    register s32 c4000 __asm__("$14");
    register s32 cc000 __asm__("$13");
    register s32 c8400 __asm__("$9");
    register s32 c8100 __asm__("$12");
    register s32 cbf00 __asm__("$11");

    if (value == 0) {
        value = stream[0];
    }
    __asm__("" : "=r"(index) : "0"(index));
    v0 = index << 16;
    if ((s32)v0 < 0) goto done;
    c8000 = 0x8000;
    c4000 = 0x4000;
    cc000 = 0xC000;
    c8400 = 0x8400;
    c8100 = 0x8100;
    cbf00 = 0xBF00;
    v0 = (s32)v0 >> 15;
loop:
    v0 += (u32)stream;
    entry = *(u16 *)(v0 + 2);
    kind = entry & 0xC000;
    if (kind == c8000) goto kind_8000;
    v0 = c8000 < kind;
    if (v0 != 0) goto greater;
    if (kind == c4000) {
        v0 = index << 16;
        goto loop_test;
    }
    index++;
    goto add_value;
greater:
    if (kind == cc000) goto set_value;
    index++;
    goto add_value;
kind_8000:
    kind = entry & 0xFF00;
    if (kind == c8400) goto stop;
    v0 = c8400 < kind;
    if (v0 != 0) goto kind_8000_greater;
    if (kind == c8100) goto stop;
    v0 = index << 16;
    goto loop_test;
kind_8000_greater:
    v0 = index << 16;
    if (kind != cbf00) goto loop_test;
stop:
    index = -1;
    goto index_ready;
set_value:
    value = entry & 0x3FFF;
    index++;
    goto index_ready;
add_value:
    v0 = value & 0xFFFF;
    total += v0;
index_ready:
    v0 = index << 16;
loop_test:
    if ((s32)v0 >= 0) {
        v0 = (s32)v0 >> 15;
        goto loop;
    }
done:
    return total & 0xFFFF;
}
