#include "types.h"

typedef struct ImageTableFinalizeContext ImageTableFinalizeContext;

typedef struct ImageTableEvent {
    void (*dispatch)(ImageTableFinalizeContext *context);
    u8 pad04[0x10];
    u32 type;
    u32 value;
} ImageTableEvent;

struct ImageTableFinalizeContext {
    ImageTableEvent *event;
    u8 pad004[0x24];
    s32 mode;
    u8 pad02C[0x34];
    s32 capacity;
    u8 pad064[0x14];
    s32 dimensions;
};

extern s32 D_80003518[];

s32 image_table_finalize(ImageTableFinalizeContext *context, s32 *sizes)
{
    register ImageTableFinalizeContext *saved_context __asm__("$18") = context;
    register s32 *saved_sizes __asm__("$20") = sizes;
    register s32 dimensions __asm__("$17") = context->dimensions;
    register s32 capacity __asm__("$19") = context->capacity;
    register s32 root __asm__("$16");
    register s32 power __asm__("$5");
    register s32 i __asm__("$4");
    register s32 product __asm__("$9");
    register s32 mode_two __asm__("$10");
    register s32 *permutation __asm__("$11");
    u32 stack_padding;

    __asm__("" : : "m"(stack_padding));
    root = 1;
    __asm__("" : "=r"(root) : "0"(root));
    power = root + 1;

    do {
        root = power;
        i = 1;
        while (i < dimensions) {
            power *= root;
            i++;
        }
        if (capacity < power) {
            break;
        }
        power = root + 1;
    } while (1);

    root--;
    if (root < 2) {
        saved_context->event->type = 0x37;
        saved_context->event->value = power;
        saved_context->event->dispatch(saved_context);
    }

    product = 1;
    i = 0;
    if (dimensions > 0) {
        s32 *cursor = sizes;

        do {
            *cursor = root;
            i++;
            product *= root;
            cursor++;
        } while (i < dimensions);
    }

    mode_two = 2;
    permutation = D_80003518;
    __asm__("" : "=r"(permutation) : "0"(permutation));
    i = 0;
    do {
        register s32 changed __asm__("$8") = 0;
        register s32 *permutation_cursor __asm__("$7");

        permutation_cursor = permutation;
        if (dimensions > 0) {
          do {
            register s32 index __asm__("$2");
            register s32 *slot __asm__("$6");
            register s32 next __asm__("$3");
            register s32 next_product __asm__("$5");

            if (saved_context->mode == mode_two) {
                index = *permutation_cursor;
                slot = &sizes[index];
            } else {
                index = i;
                slot = &sizes[index];
            }
            next = *slot + 1;
            next_product = (product / *slot) * next;

            if (capacity < next_product) {
                break;
            }
            *slot = next;
            product = next_product;
            changed = 1;
            permutation_cursor++;
            i++;
          } while (i < dimensions);
        }
        if (!changed) {
            break;
        }
        i = 0;
    } while (1);

    return product;
}
