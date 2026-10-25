#include "types.h"

typedef s32 (*ObjectTaskPrepare)(u8 *object, u8 *task);
typedef void (*ObjectTaskSubmit)(u8 *object, u8 *task, u8 *result,
                                 u32 limit, u32 first, u32 second, u32 third);

void object_task_schedule(u8 *object, u32 first, u32 second, u32 third)
{
    register u8 *saved_object __asm__("$17") = object;
    register u8 *task __asm__("$18") = *(u8 **)(saved_object + 0x1A4);
    register u32 saved_first __asm__("$19") = first;
    register u32 saved_second __asm__("$20") = second;
    register u32 saved_third __asm__("$21") = third;
    register u32 limit __asm__("$16");
    register u8 *call_object __asm__("$4");
    register u8 *call_task __asm__("$5");
    u8 *scheduler;
    ObjectTaskPrepare prepare;

    if (*(u32 *)(task + 0x30) == 0) {
        prepare = *(ObjectTaskPrepare *)(*(u8 **)(saved_object + 0x1A8) + 0xC);
        if (prepare(saved_object, task + 8) == 0) {
            return;
        }
        *(u32 *)(task + 0x30) = 1;
    }
    limit = *(u32 *)(saved_object + 0x138);
    scheduler = *(u8 **)(saved_object + 0x1AC);
    __asm__ volatile("" : "=r"(call_object)
                     : "0"(saved_object), "r"(limit), "r"(scheduler));
    call_task = task + 8;
    (*(ObjectTaskSubmit *)(scheduler + 4))(
        call_object, call_task, task + 0x34, limit,
        saved_first, saved_second, saved_third);
    if (*(u32 *)(task + 0x34) >= limit) {
        *(u32 *)(task + 0x30) = 0;
        *(u32 *)(task + 0x34) = 0;
    }
}
