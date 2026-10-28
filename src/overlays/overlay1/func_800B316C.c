#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct Message {
    void (*handler)(struct Message *);
    s32 unk04[3];
    u16 result;
} Message;

extern u16 D_8008B674;

void func_800AE9B4(Message *);
s16 func_800AEAAC(void);

void func_800B316C(void) {
    Message message;

    if (func_800AEAAC() == 0) {
        func_800AE9B4(&message);
        if (message.handler != NULL) {
            message.handler(&message);
            D_8008B674 = message.result;
        } else {
            D_8008B674 = 1;
        }
    }
}
