#include "types.h"

typedef struct Overlay5RequestState {
    u8 pad00[0x74];
    void *owner;
    u8 pad78[0x28];
    void *request;
} Overlay5RequestState;

extern Overlay5RequestState *D_80072380;
extern void *D_8008931C;

void func_8000D874(void *owner, void *request);
void func_8000D834(void *system, void *request);

void overlay5_resource_request_destroy(void) {
    func_8000D874(D_80072380->owner, D_80072380->request);
    func_8000D834(D_8008931C, D_80072380->request);
    D_80072380->request = 0;
}
