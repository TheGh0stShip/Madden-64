#include "types.h"

extern void* D_80065524;
extern void* D_8008774C;
extern void* D_8008931C;
extern void func_8000D874(void* object, void* list);
extern void func_8000D834(void* object, void* list);

void func_80011488(void) {
    func_8000D874(D_80065524, D_8008774C);
    func_8000D834(D_8008931C, D_8008774C);
}
