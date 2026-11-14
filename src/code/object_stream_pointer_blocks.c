/* IJG libjpeg 6a jmemmgr.c: alloc_sarray() and alloc_barray(). */
#include "types.h"

#ifndef FUNCTION
#define FUNCTION func_8006389C
#endif
#ifndef SIZE_SHIFT
#define SIZE_SHIFT 0
#endif

typedef u32 size_t;
typedef u32 JDIMENSION;
typedef u8 JSAMPLE;
typedef s16 JCOEF;
typedef JCOEF JBLOCK[64];
typedef JSAMPLE *JSAMPROW;
typedef JSAMPROW *JSAMPARRAY;
typedef JBLOCK *JBLOCKROW;
typedef JBLOCKROW *JBLOCKARRAY;
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
typedef struct my_memory_mgr {
    struct jpeg_memory_mgr pub;
    void *small_list[2];
    void *large_list[2];
    void *virt_sarray_list;
    void *virt_barray_list;
    long total_space_allocated;
    JDIMENSION last_rowsperchunk;
} my_memory_mgr;
typedef my_memory_mgr *my_mem_ptr;

extern void *object_stream_initialize(j_common_ptr cinfo, s32 pool_id,
                                      size_t sizeofobject);
extern void *func_800637A4(j_common_ptr cinfo, s32 pool_id,
                           size_t sizeofobject);

#if SIZE_SHIFT
JBLOCKARRAY FUNCTION(j_common_ptr cinfo, s32 pool_id,
                     JDIMENSION blocksperrow, JDIMENSION numrows)
#else
JSAMPARRAY FUNCTION(j_common_ptr cinfo, s32 pool_id,
                    JDIMENSION samplesperrow, JDIMENSION numrows)
#endif
{
    my_mem_ptr mem = (my_mem_ptr)cinfo->mem;
#if SIZE_SHIFT
    JBLOCKARRAY result;
    JBLOCKROW workspace;
#else
    JSAMPARRAY result;
    JSAMPROW workspace;
#endif
    JDIMENSION rowsperchunk, currow, i;
    long ltemp;

#if SIZE_SHIFT
    ltemp = (1000000000L - 16) /
            ((long)blocksperrow * sizeof(JBLOCK));
#else
    ltemp = (1000000000L - 16) /
            ((long)samplesperrow * sizeof(JSAMPLE));
#endif
    if (ltemp <= 0) {
        cinfo->err->msg_code = 0x45;
        (*cinfo->err->error_exit)(cinfo);
    }
    if (ltemp < (long)numrows)
        rowsperchunk = (JDIMENSION)ltemp;
    else
        rowsperchunk = numrows;
    mem->last_rowsperchunk = rowsperchunk;

#if SIZE_SHIFT
    result = (JBLOCKARRAY)object_stream_initialize(cinfo, pool_id,
                                  (size_t)(numrows * sizeof(JBLOCKROW)));
#else
    result = (JSAMPARRAY)object_stream_initialize(cinfo, pool_id,
                                  (size_t)(numrows * sizeof(JSAMPROW)));
#endif

    currow = 0;
    while (currow < numrows) {
        rowsperchunk = rowsperchunk < numrows - currow ?
                       rowsperchunk : numrows - currow;
#if SIZE_SHIFT
        workspace = (JBLOCKROW)func_800637A4(cinfo, pool_id,
                    (size_t)((size_t)rowsperchunk * (size_t)blocksperrow *
                             sizeof(JBLOCK)));
        for (i = rowsperchunk; i > 0; i--) {
            result[currow++] = workspace;
            workspace += blocksperrow;
        }
#else
        workspace = (JSAMPROW)func_800637A4(cinfo, pool_id,
                    (size_t)((size_t)rowsperchunk * (size_t)samplesperrow *
                             sizeof(JSAMPLE)));
        for (i = rowsperchunk; i > 0; i--) {
            result[currow++] = workspace;
            workspace += samplesperrow;
        }
#endif
    }

    return result;
}
