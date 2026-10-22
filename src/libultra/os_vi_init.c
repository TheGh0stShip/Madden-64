#include "os_internal.h"

static OSViContext contexts[2];
OSViContext* currentViContext = &contexts[0];
OSViContext* nextViContext = &contexts[1];

extern s32 tvType;
extern OSViMode palMode;
extern OSViMode mpalMode;
extern OSViMode ntscMode;
extern void __osViSwapContext(void);

void __osViInit(void) {
    bzero(contexts, sizeof(contexts));
    currentViContext = &contexts[0];
    nextViContext = &contexts[1];
    nextViContext->retraceCount = 1;
    currentViContext->retraceCount = 1;
    nextViContext->framep = (void*)0x80000000;
    currentViContext->framep = (void*)0x80000000;
    if (tvType == 0) {
        nextViContext->modep = &palMode;
    } else if (tvType == 2) {
        nextViContext->modep = &mpalMode;
    } else {
        nextViContext->modep = &ntscMode;
    }
    nextViContext->state = 0x20;
    nextViContext->control = nextViContext->modep->control;
    while (*(volatile u32*)0xA4400010 > 10) {
    }
    *(volatile u32*)0xA4400000 = 0;
    __osViSwapContext();
}
