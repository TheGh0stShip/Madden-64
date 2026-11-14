/* IJG libjpeg 6a jmemmgr.c: free_pool(). */
#include "types.h"

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

struct jpeg_memory_mgr {
    void *methods[11];
    long max_memory_to_use;
};

struct jpeg_common_struct {
    struct jpeg_error_mgr *err;
    struct jpeg_memory_mgr *mem;
};

struct backing_store_struct {
    void *read_backing_store;
    void *write_backing_store;
    void (*close_backing_store)(j_common_ptr cinfo,
                                struct backing_store_struct *info);
};

struct jvirt_sarray_control {
    u8 pad00[0x28];
    s32 b_s_open;
    struct jvirt_sarray_control *next;
    struct backing_store_struct b_s_info;
};
typedef struct jvirt_sarray_control *jvirt_sarray_ptr;

struct jvirt_barray_control {
    u8 pad00[0x28];
    s32 b_s_open;
    struct jvirt_barray_control *next;
    struct backing_store_struct b_s_info;
};
typedef struct jvirt_barray_control *jvirt_barray_ptr;

typedef union small_pool_struct *small_pool_ptr;
typedef union large_pool_struct *large_pool_ptr;

typedef struct {
    void *next;
    u32 bytes_used;
    u32 bytes_left;
} pool_hdr;

union small_pool_struct {
    pool_hdr hdr;
    double dummy;
};

union large_pool_struct {
    pool_hdr hdr;
    double dummy;
};

typedef struct my_memory_mgr {
    struct jpeg_memory_mgr pub;
    small_pool_ptr small_list[2];
    large_pool_ptr large_list[2];
    jvirt_sarray_ptr virt_sarray_list;
    jvirt_barray_ptr virt_barray_list;
    long total_space_allocated;
    u32 last_rowsperchunk;
} my_memory_mgr;
typedef my_memory_mgr *my_mem_ptr;

extern void func_80064990(j_common_ptr cinfo, void *object, u32 size);
extern void func_80064950(j_common_ptr cinfo, void *object, u32 size);

void object_stream_complete(j_common_ptr cinfo, s32 pool_id)
{
    my_mem_ptr mem = (my_mem_ptr)cinfo->mem;
    small_pool_ptr shdr_ptr;
    large_pool_ptr lhdr_ptr;
    u32 space_freed;

    if (pool_id < 0 || pool_id >= 2) {
        cinfo->err->msg_code = 0xC;
        cinfo->err->msg_parm.i[0] = pool_id;
        (*cinfo->err->error_exit)(cinfo);
    }

    if (pool_id == 1) {
        jvirt_sarray_ptr sptr;
        jvirt_barray_ptr bptr;

        for (sptr = mem->virt_sarray_list; sptr != 0; sptr = sptr->next) {
            if (sptr->b_s_open) {
                sptr->b_s_open = 0;
                (*sptr->b_s_info.close_backing_store)(cinfo,
                                                       &sptr->b_s_info);
            }
        }
        mem->virt_sarray_list = 0;
        for (bptr = mem->virt_barray_list; bptr != 0; bptr = bptr->next) {
            if (bptr->b_s_open) {
                bptr->b_s_open = 0;
                (*bptr->b_s_info.close_backing_store)(cinfo,
                                                       &bptr->b_s_info);
            }
        }
        mem->virt_barray_list = 0;
    }

    lhdr_ptr = mem->large_list[pool_id];
    mem->large_list[pool_id] = 0;

    while (lhdr_ptr != 0) {
        large_pool_ptr next_lhdr_ptr = lhdr_ptr->hdr.next;
        space_freed = lhdr_ptr->hdr.bytes_used +
                      lhdr_ptr->hdr.bytes_left + sizeof(union large_pool_struct);
        func_80064990(cinfo, lhdr_ptr, space_freed);
        mem->total_space_allocated -= space_freed;
        lhdr_ptr = next_lhdr_ptr;
    }

    shdr_ptr = mem->small_list[pool_id];
    mem->small_list[pool_id] = 0;

    while (shdr_ptr != 0) {
        small_pool_ptr next_shdr_ptr = shdr_ptr->hdr.next;
        space_freed = shdr_ptr->hdr.bytes_used +
                      shdr_ptr->hdr.bytes_left + sizeof(union small_pool_struct);
        func_80064950(cinfo, shdr_ptr, space_freed);
        mem->total_space_allocated -= space_freed;
        shdr_ptr = next_shdr_ptr;
    }
}
