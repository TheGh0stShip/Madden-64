#include "types.h"

extern s32 func_800649B0(void *object, s32 total_size, s32 total_count, s32 allocated);
extern void func_800649B8(void *object, void *destination, s32 size);
extern void **func_8006389C(void *object, s32 mode, u32 size, s32 count);
extern void **func_800639CC(void *object, s32 mode, u32 size, s32 count);

void object_stream_update(u8 *object_arg)
{
    register u8 *object __asm__("$19") = object_arg;
    register u8 *container __asm__("$20");
    register u8 *node __asm__("$16");
    register s32 amount __asm__("$17");
    register s32 secondary __asm__("$18");
    register s32 available __asm__("$3");
    register s32 quotient __asm__("$2");
    register u32 product __asm__("$3");
    register u32 product2 __asm__("$2");

    container = *(u8 **)(object + 4);
    node = *(u8 **)(container + 0x40);
    amount = 0;
    secondary = 0;
    while (node != 0) {
        if (*(void **)node == 0) {
            product = *(u32 *)(node + 0xC) * *(u32 *)(node + 8);
            product2 = *(u32 *)(node + 4) * *(u32 *)(node + 8);
            amount += product;
            secondary += product2;
        }
        node = *(u8 **)(node + 0x2C);
    }

    node = *(u8 **)(container + 0x44);
    while (node != 0) {
        if (*(void **)node == 0) {
            product = (*(u32 *)(node + 0xC) * *(u32 *)(node + 8)) << 7;
            amount += product;
            product2 = (*(u32 *)(node + 4) * *(u32 *)(node + 8)) << 7;
            secondary += product2;
        }
        node = *(u8 **)(node + 0x2C);
    }

    if (amount > 0) {
        available = func_800649B0(object, amount, secondary,
                                  *(s32 *)(container + 0x48));
        quotient = available < secondary;
        if (quotient != 0) {
            goto calculate_amount;
        }
        amount = 0x3B9ACA00;
        goto amount_ready;
calculate_amount:
        amount = available / amount;
        if (amount <= 0) {
            amount = 1;
        }
amount_ready:

        node = *(u8 **)(container + 0x40);
        if (node != 0) {
            __asm__ volatile("");
            secondary = 1;
            do {
                if (*(void **)node == 0) {
                    register u32 count __asm__("$5");
                    register u32 chunk __asm__("$4");
                    register s32 needed __asm__("$2");
                    count = *(u32 *)(node + 4);
                    chunk = *(u32 *)(node + 0xC);
                    needed = ((count - 1) / chunk) + 1;
                    if (amount >= needed) {
                        *(u32 *)(node + 0x10) = count;
                    } else {
                        register u32 scaled __asm__("$3");
                        register u32 allocation __asm__("$6");
                        scaled = amount * chunk;
                        *(u32 *)(node + 0x10) = scaled;
                        allocation = *(u32 *)(node + 4) * *(u32 *)(node + 8);
                        func_800649B8(object, node + 0x30, allocation);
                        *(s32 *)(node + 0x28) = secondary;
                    }
                    *(void **)(node + 0) = func_8006389C(
                        object, 1, *(u32 *)(node + 8), *(s32 *)(node + 0x10));
                    *(u32 *)(node + 0x14) = *(u32 *)(container + 0x4C);
                    *(u32 *)(node + 0x18) = 0;
                    *(u32 *)(node + 0x1C) = 0;
                    *(u32 *)(node + 0x24) = 0;
                }
                node = *(u8 **)(node + 0x2C);
            } while (node != 0);
        }

        node = *(u8 **)(container + 0x44);
        secondary = 1;
        while (node != 0) {
            if (*(void **)node == 0) {
                register u32 count __asm__("$5");
                register u32 chunk __asm__("$4");
                register s32 needed __asm__("$2");
                count = *(u32 *)(node + 4);
                chunk = *(u32 *)(node + 0xC);
                needed = ((count - 1) / chunk) + 1;
                if (amount >= needed) {
                    *(u32 *)(node + 0x10) = count;
                } else {
                    register u32 scaled __asm__("$3");
                    register u32 allocation __asm__("$6");
                    scaled = amount * chunk;
                    *(u32 *)(node + 0x10) = scaled;
                    allocation = (*(u32 *)(node + 4) * *(u32 *)(node + 8)) << 7;
                    func_800649B8(object, node + 0x30, allocation);
                    *(s32 *)(node + 0x28) = secondary;
                }
                *(void **)(node + 0) = func_800639CC(
                    object, 1, *(u32 *)(node + 8), *(s32 *)(node + 0x10));
                *(u32 *)(node + 0x14) = *(u32 *)(container + 0x4C);
                *(u32 *)(node + 0x18) = 0;
                *(u32 *)(node + 0x1C) = 0;
                *(u32 *)(node + 0x24) = 0;
            }
            node = *(u8 **)(node + 0x2C);
        }
    }
}
