#include "types.h"

/* IJG libjpeg 6a jmemmgr.c: jinit_memory_mgr(). */

typedef struct jpeg_common_struct *j_common_ptr;

struct jpeg_error_mgr {
    void (*error_exit)(j_common_ptr cinfo);
    void *emit_message;
    void *output_message;
    void *format_message;
    void *reset_error_mgr;
    s32 msg_code;
    union {
        s32 i[8];
        char s[80];
    } msg_parm;
};

struct jpeg_memory_mgr {
    void *alloc_small;
    void *alloc_large;
    void *alloc_sarray;
    void *alloc_barray;
    void *request_virt_sarray;
    void *request_virt_barray;
    void *realize_virt_arrays;
    void *access_virt_sarray;
    void *access_virt_barray;
    void *free_pool;
    void *self_destruct;
    long max_memory_to_use;
};

struct jpeg_common_struct {
    struct jpeg_error_mgr *err;
    struct jpeg_memory_mgr *mem;
};

typedef struct small_pool_struct *small_pool_ptr;
typedef struct large_pool_struct *large_pool_ptr;

typedef struct my_memory_mgr {
    struct jpeg_memory_mgr pub;
    small_pool_ptr small_list[2];
    large_pool_ptr large_list[2];
    void *virt_sarray_list;
    void *virt_barray_list;
    long total_space_allocated;
    u32 last_rowsperchunk;
} my_memory_mgr;
typedef my_memory_mgr *my_mem_ptr;

extern long func_800649EC(j_common_ptr cinfo);
extern void func_800649F4(j_common_ptr cinfo);
extern void *func_80064930(j_common_ptr cinfo, u32 size);
extern void object_stream_initialize(void);
extern void func_800637A4(void);
extern void func_8006389C(void);
extern void func_800639CC(void);
extern void func_80063B0C(void);
extern void func_80063BD8(void);
extern void object_stream_update(void);
extern void object_stream_finalize(void);
extern void object_stream_commit(void);
extern void object_stream_complete(void);
extern void func_80064790(void);

void func_800647F0(j_common_ptr cinfo)
{
    my_mem_ptr mem;
    long max_to_use;
    s32 pool;

    cinfo->mem = 0;
    max_to_use = func_800649EC(cinfo);
    mem = (my_mem_ptr)func_80064930(cinfo, sizeof(my_memory_mgr));

    if (mem == 0) {
        func_800649F4(cinfo);
        cinfo->err->msg_code = 0x35;
        cinfo->err->msg_parm.i[0] = 0;
        (*cinfo->err->error_exit)(cinfo);
    }

    mem->pub.alloc_small = object_stream_initialize;
    mem->pub.alloc_large = func_800637A4;
    mem->pub.alloc_sarray = func_8006389C;
    mem->pub.alloc_barray = func_800639CC;
    mem->pub.request_virt_sarray = func_80063B0C;
    mem->pub.request_virt_barray = func_80063BD8;
    mem->pub.realize_virt_arrays = object_stream_update;
    mem->pub.access_virt_sarray = object_stream_finalize;
    mem->pub.access_virt_barray = object_stream_commit;
    mem->pub.free_pool = object_stream_complete;
    mem->pub.self_destruct = func_80064790;

    mem->pub.max_memory_to_use = max_to_use;

    for (pool = 1; pool >= 0; pool--) {
        mem->small_list[pool] = 0;
        mem->large_list[pool] = 0;
    }
    mem->virt_sarray_list = 0;
    mem->virt_barray_list = 0;
    mem->total_space_allocated = sizeof(my_memory_mgr);
    cinfo->mem = &mem->pub;
}
