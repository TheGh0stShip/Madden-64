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
    CounterOwner *owner;
    CounterOwner *global_owner = D_80064A00;
    s32 outer;
    s32 saved_outer;

    if (global_owner != 0) {
        owner = global_owner;
        outer = 15;
        do {
            u32 state = owner->state;
            s32 index;
            s32 saved_index;
            do {
            } while (owner->state == state);
            index = 7;
inner_loop:
            {
                u32 byte_offset;
                CounterPair *check_pair;
                CounterPair *update_pair;
                s32 field;
                u32 pair_address;
                saved_index = index;
                byte_offset = saved_index << 5;
                check_pair = owner->pairs;
                pair_address = byte_offset;
                pair_address += (u32)check_pair;
                check_pair = (CounterPair *)pair_address;
                if (check_pair->first != 0) {
                    update_pair = owner->pairs;
                    pair_address = byte_offset;
                    pair_address += (u32)update_pair;
                    update_pair = (CounterPair *)pair_address;
                    field = update_pair->first;
                    field--;
                    update_pair->first = field;
                }
                check_pair = owner->pairs;
                pair_address = byte_offset;
                pair_address += (u32)check_pair;
                check_pair = (CounterPair *)pair_address;
                if (check_pair->second != 0) {
                    update_pair = owner->pairs;
                    pair_address = byte_offset;
                    pair_address += (u32)update_pair;
                    update_pair = (CounterPair *)pair_address;
                    field = update_pair->second;
                    field--;
                    update_pair->second = field;
                }
                index--;
            }
            if (saved_index != 0) {
                goto inner_loop;
            }
            saved_outer = outer;
            outer--;
        } while (saved_outer != 0);
    }
}
