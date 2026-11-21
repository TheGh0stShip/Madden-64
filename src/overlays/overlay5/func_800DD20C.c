#include "types.h"

typedef struct State {
    void *field00;
    void *config;
    u8 pad08[4];
    void *buffer0C;
    u8 pad10[0x50];
    u8 count60;
    u8 pad61[3];
    void **array64;
    void *field68;
    void *field6C;
    void *owner70;
    void *field74;
    void *field78;
    void *field7C;
    void *field80;
    void *field84;
    void *field88;
    void *field8C;
    void *field90;
    void *field94;
} State;

extern State *D_80072380;
extern void *D_8008931C;

extern void overlay5_runtime_object_system_destroy(void);
extern void overlay5_runtime_list_destroy(void);
extern void func_80032F3C(s32 pool, void *ptr);
extern void func_8000D874(void *owner, void *object);
extern void func_8000D834(void *list, void *object);
extern void func_80094AB0(void *owner);
extern void func_8000BE80(void);
extern void func_8000B7E4(void *object);
extern void func_8000D684(void *object);
extern void func_8001AEA8(void *array);

void func_800DD20C(void) {
    u8 i;

    overlay5_runtime_object_system_destroy();
    overlay5_runtime_list_destroy();
    func_80032F3C(0, D_80072380->field00);
    func_80032F3C(0, D_80072380->buffer0C);
    if (D_80072380->field78) {
        func_8000D874(D_80072380->owner70, D_80072380->field78);
        func_8000D834(D_8008931C, D_80072380->field78);
    }
    if (D_80072380->field7C) {
        func_8000D874(D_80072380->owner70, D_80072380->field7C);
        func_8000D834(D_8008931C, D_80072380->field7C);
    }
    if (D_80072380->field80) {
        func_8000D874(D_80072380->owner70, D_80072380->field80);
        func_8000D834(D_8008931C, D_80072380->field80);
    }
    if (D_80072380->field84) {
        func_8000D874(D_80072380->owner70, D_80072380->field84);
        func_8000D834(D_8008931C, D_80072380->field84);
    }
    if (D_80072380->field90) {
        func_80094AB0(D_80072380->owner70);
    }
    if (D_80072380->field88) {
        func_8000D874(D_80072380->owner70, D_80072380->field88);
        func_8000D834(D_8008931C, D_80072380->field88);
    }
    if (D_80072380->field94) {
        func_8000D874(D_80072380->owner70, D_80072380->field94);
        func_8000D834(D_8008931C, D_80072380->field94);
    }
    for (i = 0; i < D_80072380->count60; i++) {
        if (D_80072380->array64[i + 1]) {
            func_8000D834(D_8008931C, D_80072380->array64[i + 1]);
        }
    }
    func_8000BE80();
    func_8000B7E4(D_80072380->field6C);
    func_8000D684(D_80072380->field74);
    func_80032F3C(0, D_80072380->array64);
    func_8001AEA8(D_80072380->field68);
    func_80032F3C(0, D_80072380);
    D_80072380 = 0;
}
