#include "types.h"

typedef struct SessionObject {
    void *root;
    void *first;
    void *second;
    u16 identifier;
} SessionObject;

typedef struct GameSession {
    u32 index;
    SessionObject *object;
} GameSession;

typedef struct SessionRuntime {
    void *audio;
    void *timeline;
    s16 active;
    u8 pad0A[38];
} SessionRuntime;

extern SessionRuntime D_8006A534[];
extern void func_8000BE80(void);
extern void func_800458F8(void);
extern void func_8003D78C(void *audio);
extern void func_8003CA4C(void);
extern void func_8000D998(void *first, void *second);
extern void func_80035A7C(u16 identifier);
extern void func_8000B7E4(void *root);
extern void func_80032F3C(s32 pool, void *object);
extern void func_800334B8(void);

void game_session_release(GameSession *session)
{
    register GameSession *saved_session __asm__("$17") = session;
    register u32 index __asm__("$16");
    SessionObject *object;

    __asm__ volatile ("" : "=r" (saved_session) : "0" (saved_session));
    index = saved_session->index;
    func_8000BE80();
    if (D_8006A534[index].timeline != 0) {
        func_800458F8();
    }
    if (D_8006A534[index].audio != 0) {
        func_8003D78C(D_8006A534[index].audio);
    }
    if (D_8006A534[index].active != 0) {
        func_8003CA4C();
    }
    object = saved_session->object;
    func_8000D998(object->first, object->second);
    object = saved_session->object;
    func_80035A7C(object->identifier);
    object = saved_session->object;
    func_8000B7E4(object->root);
    func_80032F3C(0, saved_session->object);
    func_800334B8();
}
