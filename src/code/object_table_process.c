#include "types.h"

typedef struct ObjectTableState {
    u8 pad00[0x10];
    u8 **subtract_tables;
    u8 pad14[4];
    u8 **add_tables;
    u8 pad1C[0x28];
    s16 *work[1];
    u8 pad48[0x0C];
    s32 reverse;
} ObjectTableState;

typedef struct ObjectTableContext {
    u8 pad000[0x70];
    s32 width;
    u8 pad074[4];
    s32 dimensions;
    u8 pad07C[0xC4];
    u8 *mapping;
    u8 pad144[0x84];
    ObjectTableState *state;
} ObjectTableContext;

extern void func_800632F4(void *output, s32 size);

void object_table_process(ObjectTableContext *context, u8 **sources,
    u8 **outputs, s32 count)
{
    register ObjectTableState *state __asm__("$16");
    register s32 dimensions __asm__("$18");
    register s32 width __asm__("$22");
    u8 *volatile mapping;
    u8 **volatile outputs_base = outputs;
    volatile s32 output_count = count;
    register u8 **source_slot __asm__("$23");
    register u8 **output_slot __asm__("$21");
    s32 last;
    s32 row_offset;
    s32 work_bytes;
    u64 stack_padding0;
    u64 stack_padding1;
    u64 stack_padding2;
    u64 stack_padding3;

    __asm__("" : : "m"(stack_padding0), "m"(stack_padding1),
        "m"(stack_padding2), "m"(stack_padding3));
    state = context->state;
    dimensions = context->dimensions;
    width = context->width;
    mapping = context->mapping;
    if (count > 0) {
        last = width - 1;
        row_offset = last * dimensions;
        work_bytes = width * 2 + 2;
        output_slot = outputs_base;
        source_slot = sources;
        do {
            register s32 dimension __asm__("$12") = 0;

            func_800632F4(*output_slot, width);
            if (dimensions > 0) {
                register ObjectTableState *state_cursor __asm__("$15") = state;
                register u8 **current_source __asm__("$30") = output_slot;
                register s32 table_offset __asm__("$24") = 0;

                do {
                    register u8 *source __asm__("$10") = *source_slot + dimension;
                    register u8 *output __asm__("$9") = *current_source;
                    register s16 *work __asm__("$8");
                    register s32 step __asm__("$14");
                    register s32 source_step __asm__("$25");
                    register u8 *add_table __asm__("$20");
                    register u8 *subtract_table __asm__("$19");
                    register s32 remaining __asm__("$7") = width;
                    register s32 accumulator __asm__("$6") = 0;
                    register s32 previous __asm__("$11") = 0;
                    register s32 older __asm__("$13") = 0;
                    volatile s32 byte_step;

                    if (state->reverse != 0) {
                        source += row_offset;
                        output += last;
                        work = (s16 *)((u8 *)state_cursor->work[0] + work_bytes);
                        step = -1;
                        source_step = -dimensions;
                    } else {
                        work = state_cursor->work[0];
                        step = 1;
                        source_step = dimensions;
                    }

                    add_table = *(u8 **)((u8 *)state->add_tables + table_offset);
                    subtract_table = *(u8 **)((u8 *)state->subtract_tables + table_offset);
                    byte_step = step << 1;
                    if (remaining != 0) {
                        do {
                            register s32 current __asm__("$4");
                            register s32 twice __asm__("$2");
                            register s32 next __asm__("$3");
                            register s16 *next_work __asm__("$5") =
                                (s16 *)((u8 *)work + byte_step);
                            s32 sample = *next_work;
                            s32 index = *source;

                            accumulator = (accumulator + sample + 8) >> 4;
                            accumulator += index;
                            accumulator = mapping[accumulator];
                            output[0] += add_table[accumulator];
                            accumulator -= subtract_table[add_table[accumulator]];
                            source += source_step;
                            current = accumulator;
                            twice = accumulator << 1;
                            accumulator += twice;
                            next = previous + accumulator;
                            accumulator += twice;
                            previous = older + accumulator;
                            older = current;
                            accumulator += twice;
                            work[0] = next;
                            output += step;
                            remaining--;
                            work = next_work;
                        } while (remaining != 0);
                    }
                    work[0] = previous;
                    table_offset += 4;
                    dimension++;
                    state_cursor = (ObjectTableState *)((u8 *)state_cursor + 4);
                } while (dimension < dimensions);
            }
            state->reverse = state->reverse == 0;
            output_slot++;
            source_slot++;
        } while (output_slot < outputs_base + output_count);
    }
}
