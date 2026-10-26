#include "types.h"

typedef struct CounterPair {
    volatile s32 first;
    volatile s32 second;
    u8 pad08[0x18];
} CounterPair;

typedef struct CounterOwner {
    u8 pad00[4];
    volatile u32 state;
    u8 pad08[0xC];
    CounterPair *pairs;
} CounterOwner;

extern CounterOwner *D_80064A00;

void func_80004C98(void)
{
    register CounterOwner *owner __asm__("$5");
    register CounterOwner *global_owner __asm__("$2") = D_80064A00;
    register s32 outer __asm__("$8");
    register s32 saved_outer __asm__("$2");

    if (global_owner != 0) {
        owner = global_owner;
        outer = 15;
        do {
            register u32 state __asm__("$3") = owner->state;
            register s32 index __asm__("$6");
            register s32 saved_index __asm__("$7");
            do {
            } while (owner->state == state);
            index = 7;
            do {
                register u32 byte_offset __asm__("$4");
                register CounterPair *check_pair __asm__("$2");
                register CounterPair *update_pair __asm__("$3");
                register s32 field __asm__("$2");
                saved_index = index;
                byte_offset = saved_index << 5;
                check_pair = owner->pairs;
                check_pair = (CounterPair *)(byte_offset + (u32)check_pair);
                __asm__ volatile("" : "=r"(check_pair) : "0"(check_pair));
                if (check_pair->first != 0) {
                    update_pair = owner->pairs;
                    update_pair = (CounterPair *)(byte_offset + (u32)update_pair);
                    __asm__ volatile("" : "=r"(update_pair) : "0"(update_pair));
                    field = update_pair->first;
                    field--;
                    update_pair->first = field;
                }
                check_pair = owner->pairs;
                check_pair = (CounterPair *)(byte_offset + (u32)check_pair);
                __asm__ volatile("" : "=r"(check_pair) : "0"(check_pair));
                if (check_pair->second != 0) {
                    update_pair = owner->pairs;
                    update_pair = (CounterPair *)(byte_offset + (u32)update_pair);
                    __asm__ volatile("" : "=r"(update_pair) : "0"(update_pair));
                    field = update_pair->second;
                    field--;
                    update_pair->second = field;
                }
                index--;
            } while (saved_index != 0);
            saved_outer = outer;
            outer--;
        } while (saved_outer != 0);
    }
}
