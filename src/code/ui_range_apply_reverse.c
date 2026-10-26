#include "types.h"

extern void func_8001EE1C(void *context, u32 first, u32 second);

void ui_range_apply_reverse(void *context, u32 first, u32 second, u32 count)
{
    register void *saved_context __asm__("$19") = context;
    register u32 saved_first __asm__("$17") = first;
    register u32 saved_second __asm__("$18") = second;
    register u32 remaining __asm__("$16") = count;
    register u32 current __asm__("$2");
    __asm__("" : "=r"(saved_context), "=r"(saved_first),
            "=r"(saved_second), "=r"(remaining)
            : "0"(saved_context), "1"(saved_first),
              "2"(saved_second), "3"(remaining));

    if (saved_first < saved_second) {
        current = remaining;
        __asm__ volatile("" : "=r"(current) : "0"(current));
        if (current == 0) {
            goto done;
        }
        do {
            remaining--;
            func_8001EE1C(saved_context, saved_first, saved_second);
            saved_first--;
            saved_second--;
            current = remaining;
            __asm__ volatile("" : "=r"(current) : "0"(current));
        } while (current != 0);
        goto done;
    } else {
        goto ascending_check;
ascending:
        func_8001EE1C(saved_context, saved_first, saved_second);
        saved_first++;
        saved_second++;
ascending_check:
        current = remaining;
        __asm__ volatile("" : "=r"(current) : "0"(current));
        if (current != 0) {
            remaining--;
            goto ascending;
        }
    }
done:
    return;
}
