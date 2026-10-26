#include "types.h"

typedef struct AudioNameRecord {
    u8 name[13];
    u8 marker;
    u8 pad0E[26];
} AudioNameRecord;

extern u8 D_80002D10[];
extern AudioNameRecord *func_80037108(void *table, s32 index);

s32 audio_name_find(u8 *name, u8 *result_index)
{
    register u8 *saved_name __asm__("$18");
    register u8 *saved_result __asm__("$16");
    register s32 found __asm__("$17");
    register u32 index __asm__("$8");
    register AudioNameRecord *record __asm__("$6");
    register u32 marker __asm__("$11");
    register s32 one __asm__("$10");
    AudioNameRecord *start;

    saved_name = name;
    __asm__("" : "=r"(saved_name) : "0"(saved_name));
    saved_result = result_index;
    __asm__("" : "=r"(saved_result) : "0"(saved_result));
    found = 0;
    start = func_80037108(D_80002D10, 0);
    index = 0;
    marker = 0xFF;
    one = 1;
    record = start;
record_loop:
    {
        register s32 equal __asm__("$9") = 1;
        register u8 *left __asm__("$4");
        register u8 *right __asm__("$5");
        register u8 *end __asm__("$7");
        if (record->marker == marker) goto next;
        left = saved_name;
        right = record->name;
        end = left + 12;
compare:
        if (*right != *left) {
            equal = 0;
            goto compared;
        }
        if (*right == 0) goto compared;
        __asm__("" : "=r"(left) : "0"(left));
        left++;
        if (left < end) {
            right++;
            goto compare;
        }
compared:
        if (equal != one) {
            index++;
            goto next_advance;
        }
        found = 1;
        if (saved_result != 0) {
            *saved_result = index;
        }
        goto done;
    }
next:
    index++;
next_advance:
    if (index < 24) {
        record++;
        goto record_loop;
    }
done:
    return found;
}
