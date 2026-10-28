#include "types.h"

typedef struct DisplayContext {
    u8 flags;
    u8 pad1[3];
    void *field4;
    void *field8;
    struct DisplayStream *descriptor;
} DisplayContext;

typedef struct DisplayStream {
    void *stream;
    u32 field4;
    u32 field8;
    u16 first;
    u16 second;
} DisplayStream;

typedef struct DisplayLocals {
    u32 signature[2];
    u16 command;
    u16 count;
    u32 position;
    u32 first_result;
    u32 second_result;
} DisplayLocals;

extern u8 D_80000A30[];
extern u8 D_80000A3C[];
extern void func_80019944(void *stream, u32 position, u32 mode);
extern void func_80019868(void *stream, void *destination, u32 size, u32 mode);
extern s32 func_8002E148(void *first, void *second, u32 size);
extern s32 func_800199A0(u16 command);
extern void func_800199E4(void *stream, u16 command, void *result, void *field);
extern void resource_command_dispatch(void *stream, u16 command, u16 first,
                                      u16 second, void *result, void *field);

s32 resource_display_finalize(DisplayContext *context)
{
    DisplayContext *saved_context;
    u16 index;
    DisplayStream *descriptor;
    s32 result;
    void *stream;
    u32 flags;
    DisplayLocals locals;
    s32 type;

    saved_context = context;
    index = 0;
    flags = saved_context->flags;
    descriptor = saved_context->descriptor;
    result = 0;
    flags &= 0xE7;
    saved_context->flags = flags;
    stream = descriptor->stream;
    func_80019944(stream, descriptor->field8, 1);
    func_80019868(stream, &descriptor->field4, 4, 1);
    func_80019868(stream, &locals.command, 2, 0);
    func_80019868(stream, &locals.count, 2, 0);
    func_80019868(stream, locals.signature, 8, 2);
    if (func_8002E148(locals.signature, D_80000A30, 8) == 0) {
        saved_context->flags |= 8;
        result = 8;
    }
    if (func_8002E148(locals.signature, D_80000A3C, 8) == 0) {
        saved_context->flags |= 0x10;
        result = 0x10;
    }
    locals.first_result = 0;
    locals.second_result = 0;
    if (locals.count != 0) {
        do {
            func_80019868(stream, &locals.position, 4, 1);
            func_80019868(stream, &locals.command, 2, 0);
            type = func_800199A0(locals.command);
            if (type == 1) {
                goto command_type_one;
            }
            if (type == 0) {
                goto command_default;
            }
            if (type == 2) {
                goto command_type_two;
            }
            goto command_default;

command_type_one:
            func_800199E4(stream, locals.command, &locals.first_result,
                          saved_context->field8);
            saved_context->flags |= 4;
            goto command_done;
command_type_two:
            resource_command_dispatch(stream, locals.command,
                                      descriptor->first,
                                      descriptor->second,
                                      &locals.second_result,
                                      saved_context->field4);
            saved_context->flags |= 2;
            goto command_done;
command_default:
            func_80019944(stream, locals.position - 6, 0);
command_done:
            index++;
        } while ((u16)index < locals.count);
    }
    return result;
}
