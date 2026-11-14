/* IJG libjpeg 6a jmemmgr.c: alloc_small(). */
#include "types.h"

typedef u32 size_t;
typedef struct jpeg_common_struct *j_common_ptr;

struct jpeg_error_mgr {
    void (*error_exit)(j_common_ptr cinfo);
    void *emit_message;
    void *output_message;
    void *format_message;
    void *reset_error_mgr;
    s32 msg_code;
    union { s32 i[8]; char s[80]; } msg_parm;
};

struct jpeg_memory_mgr { void *methods[11]; long max_memory_to_use; };
struct jpeg_common_struct {
    struct jpeg_error_mgr *err;
    struct jpeg_memory_mgr *mem;
};

typedef struct {
    void *next;
    size_t bytes_used;
    size_t bytes_left;
} pool_hdr;

typedef union small_pool_struct *small_pool_ptr;
typedef union large_pool_struct *large_pool_ptr;
union small_pool_struct { pool_hdr hdr; double dummy; };
union large_pool_struct { pool_hdr hdr; double dummy; };

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

extern size_t D_800049E0[];
extern size_t D_800049E8[];
extern void func_800635A0(j_common_ptr cinfo, s32 code);
extern void *func_80064930(j_common_ptr cinfo, size_t size);

void *object_stream_initialize(j_common_ptr cinfo, s32 pool_id,
                               size_t sizeofobject)
{
    my_mem_ptr mem = (my_mem_ptr)cinfo->mem;
    small_pool_ptr hdr_ptr, prev_hdr_ptr;
    char *data_ptr;
    size_t odd_bytes, min_request, slop;

    if (sizeofobject > (size_t)(1000000000L - sizeof(union small_pool_struct)))
        func_800635A0(cinfo, 1);

    odd_bytes = sizeofobject % sizeof(double);
    if (odd_bytes > 0)
        sizeofobject += sizeof(double) - odd_bytes;

    if (pool_id < 0 || pool_id >= 2) {
        cinfo->err->msg_code = 0xC;
        cinfo->err->msg_parm.i[0] = pool_id;
        (*cinfo->err->error_exit)(cinfo);
    }
    prev_hdr_ptr = 0;
    hdr_ptr = mem->small_list[pool_id];
    while (hdr_ptr != 0) {
        if (hdr_ptr->hdr.bytes_left >= sizeofobject)
            break;
        prev_hdr_ptr = hdr_ptr;
        hdr_ptr = hdr_ptr->hdr.next;
    }

    if (hdr_ptr == 0) {
        min_request = sizeofobject + sizeof(union small_pool_struct);
        if (prev_hdr_ptr == 0)
            slop = D_800049E0[pool_id];
        else
            slop = D_800049E8[pool_id];
        if (slop > (size_t)(1000000000L - min_request))
            slop = (size_t)(1000000000L - min_request);
        for (;;) {
            hdr_ptr = (small_pool_ptr)func_80064930(cinfo,
                                                    min_request + slop);
            if (hdr_ptr != 0)
                break;
            slop /= 2;
            if (slop < 50)
                func_800635A0(cinfo, 2);
        }
        mem->total_space_allocated += min_request + slop;
        hdr_ptr->hdr.next = 0;
        hdr_ptr->hdr.bytes_used = 0;
        hdr_ptr->hdr.bytes_left = sizeofobject + slop;
        if (prev_hdr_ptr == 0)
            mem->small_list[pool_id] = hdr_ptr;
        else
            prev_hdr_ptr->hdr.next = hdr_ptr;
    }

    data_ptr = (char *)(hdr_ptr + 1);
    data_ptr += hdr_ptr->hdr.bytes_used;
    hdr_ptr->hdr.bytes_used += sizeofobject;
    hdr_ptr->hdr.bytes_left -= sizeofobject;

    return (void *)data_ptr;
}
