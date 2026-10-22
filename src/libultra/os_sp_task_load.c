#include "os_internal.h"

extern void bcopy(void* source, void* destination, s32 length);

static OSTask taskCopy;

static OSTask* physicalTask(OSTask* input) {
    OSTask* task;

    task = &taskCopy;
    bcopy(input, task, sizeof(OSTask));
    if (task->t.ucode != 0) {
        task->t.ucode = (u64*)osVirtualToPhysical(task->t.ucode);
    }
    if (task->t.ucode_data != 0) {
        task->t.ucode_data =
            (u64*)osVirtualToPhysical(task->t.ucode_data);
    }
    if (task->t.dram_stack != 0) {
        task->t.dram_stack =
            (u64*)osVirtualToPhysical(task->t.dram_stack);
    }
    if (task->t.output_buff != 0) {
        task->t.output_buff =
            (u64*)osVirtualToPhysical(task->t.output_buff);
    }
    if (task->t.output_buff_size != 0) {
        task->t.output_buff_size =
            (u64*)osVirtualToPhysical(task->t.output_buff_size);
    }
    if (task->t.data_ptr != 0) {
        task->t.data_ptr =
            (u64*)osVirtualToPhysical(task->t.data_ptr);
    }
    if (task->t.yield_data_ptr != 0) {
        task->t.yield_data_ptr =
            (u64*)osVirtualToPhysical(task->t.yield_data_ptr);
    }
    return task;
}

void osSpTaskLoad(OSTask* input) {
    OSTask* task;

    task = physicalTask(input);
    if (task->t.flags & 1) {
        task->t.ucode_data = task->t.yield_data_ptr;
        task->t.ucode_data_size = task->t.yield_data_size;
        input->t.flags &= ~1;
        if (task->t.flags & 4) {
            task->t.ucode = (u64*)*(volatile u32*)(
                ((u32)input->t.yield_data_ptr + 0xC00 - 4) |
                0xA0000000);
        }
    }
    osWritebackDCache(task, sizeof(OSTask));
    __osSpSetStatus(0x2B00);
    while (__osSpSetPc(0x04001000) == -1) {
    }
    while (__osSpRawStartDma(1, 0x04001000 - sizeof(*task), task,
                             sizeof(OSTask)) == -1) {
    }
    while (__osSpDeviceBusy()) {
    }
    while (__osSpRawStartDma(1, 0x04001000, task->t.ucode_boot,
                             task->t.ucode_boot_size) == -1) {
    }
}
