#include "types.h"

typedef struct AudioChainNode {
    struct AudioChainNode *next;
    u8 pad04[0x10];
    u32 flags;
} AudioChainNode;

typedef struct AudioChainCounts {
    u8 pad00[4];
    s16 first_count;
    s16 second_count;
} AudioChainCounts;

typedef struct AudioChainRoot {
    u8 pad00[0xC];
    AudioChainNode *node;
} AudioChainRoot;

typedef struct AudioChainPair {
    AudioChainCounts *counts;
    AudioChainRoot *root;
} AudioChainPair;

typedef struct AudioChainContext {
    u8 pad00[8];
    AudioChainPair *pair;
} AudioChainContext;

void audio_chain_flag_update(AudioChainContext *context, s8 enabled)
{
    AudioChainPair *pair = context->pair;
    register AudioChainRoot *root __asm__("$4") = pair->root;
    s32 count = pair->counts->first_count + pair->counts->second_count;
    register AudioChainNode *node __asm__("$3") = root->node;
    register u32 mask __asm__("$4");

    if (enabled) {
        mask = 1;
        if (count-- != 0) {
            do {
                if (node != 0) {
                    node->flags |= mask;
                    node = node->next;
                }
            } while (count-- != 0);
        }
    } else {
        if (count-- != 0) {
            mask = ~1U;
            do {
                if (node != 0) {
                    node->flags &= mask;
                    node = node->next;
                }
            } while (count-- != 0);
        }
    }
}
