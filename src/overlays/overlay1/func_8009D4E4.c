#include "types.h"

typedef struct {
    u8 pad00[0xF];
    s8 alpha;
} Vertex;

typedef struct {
    s32 type;
    Vertex *parts[2];
    u8 pad0C[0x2A];
    u16 count;
    u8 pad38[2];
    u16 flags;
} Mesh;

typedef struct {
    u8 pad00[8];
    Mesh *mesh;
} Object;

void func_8009D4E4(Object *obj, s8 alpha) {
    Mesh *mesh = obj->mesh;
    Vertex *v;
    Vertex *base;
    s32 n;
    s32 i;
    s32 k;

    if (mesh->type != 0) {
        if (mesh->type != 3) {
            return;
        }
        k = 1;
        do {
            v = mesh->parts[k];
            v += 3;
            i = 3;
            do {
                v->alpha = alpha;
                v--;
            } while (i-- != 0);
        } while (k-- != 0);
    } else {
        n = mesh->count;
        base = mesh->parts[0];
        if (n-- != 0) {
            v = base - -n;
            do {
                v->alpha = alpha;
                v--;
            } while (n-- != 0);
        }
    }
    mesh->flags |= 0x80;
}
