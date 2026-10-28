/*
 * Madden 64 func_80004D34: BRR (SNES-style ADPCM) decode of eight voices into
 * 16-sample blocks with four predictor filters, then left/right gain mixing
 * and interleaved stereo output. Plain C; byte-exact under KMC GCC 2.7.2
 * -O2 -G0 -mips3 -mgp32 -mfp32.
 */
typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef signed int s32;
typedef unsigned int u32;

typedef struct {
    s32 x0, x1, x2, x3, x4, x5, x6, x7;
    s32 x8, x9, x10, x11, x12, x13, x14, x15;
} SampleBlock;

typedef struct BrrVoice BrrVoice;
typedef void (*BrrCallback)(BrrVoice *voice);

struct BrrVoice {
    s32 left_gain;
    s32 right_gain;
    s32 previous;
    s32 older;
    u8 *block;
    u8 *loop;
    u32 flags;
    BrrCallback callback;
};

typedef struct {
    s32 unused0;
    s32 output_index;
    s32 sample_count;
    s16 *output[2];
    BrrVoice *voices;
} BrrMixer;

/* LDSYM D_80064A04=0x80064A04 */
extern s32 D_80064A04[16];
#define sNibble D_80064A04

#define MIX_SAMPLE(a, d, n, gain) ((a)[n] += (d)[n] * (gain))
#define MIX_BLOCK(a, d, gain) do { \
    MIX_SAMPLE(a, d, 0, gain);  MIX_SAMPLE(a, d, 1, gain); \
    MIX_SAMPLE(a, d, 2, gain);  MIX_SAMPLE(a, d, 3, gain); \
    MIX_SAMPLE(a, d, 4, gain);  MIX_SAMPLE(a, d, 5, gain); \
    MIX_SAMPLE(a, d, 6, gain);  MIX_SAMPLE(a, d, 7, gain); \
    MIX_SAMPLE(a, d, 8, gain);  MIX_SAMPLE(a, d, 9, gain); \
    MIX_SAMPLE(a, d, 10, gain); MIX_SAMPLE(a, d, 11, gain); \
    MIX_SAMPLE(a, d, 12, gain); MIX_SAMPLE(a, d, 13, gain); \
    MIX_SAMPLE(a, d, 14, gain); MIX_SAMPLE(a, d, 15, gain); \
} while (0)

#define MIX_GAIN_SWITCH(accum, decoded, gain) do { \
    switch (gain) { \
    case 1:  MIX_BLOCK(accum, decoded, 1);  break; \
    case 2:  MIX_BLOCK(accum, decoded, 2);  break; \
    case 3:  MIX_BLOCK(accum, decoded, 3);  break; \
    case 4:  MIX_BLOCK(accum, decoded, 4);  break; \
    case 5:  MIX_BLOCK(accum, decoded, 5);  break; \
    case 6:  MIX_BLOCK(accum, decoded, 6);  break; \
    case 7:  MIX_BLOCK(accum, decoded, 7);  break; \
    case 8:  MIX_BLOCK(accum, decoded, 8);  break; \
    case 9:  MIX_BLOCK(accum, decoded, 9);  break; \
    case 10: MIX_BLOCK(accum, decoded, 10); break; \
    case 11: MIX_BLOCK(accum, decoded, 11); break; \
    case 12: MIX_BLOCK(accum, decoded, 12); break; \
    case 13: MIX_BLOCK(accum, decoded, 13); break; \
    case 14: MIX_BLOCK(accum, decoded, 14); break; \
    case 15: MIX_BLOCK(accum, decoded, 15); break; \
    } \
} while (0)

#define EXPAND_BYTE(block, shift, packed_, byte_index, hi, lo, hi_i, lo_i) { \
    packed = block[byte_index]; \
    residual_storage[lo_i] = (lo) = sNibble[packed & 15]; \
    residual_storage[hi_i] = (hi) = sNibble[packed >> 4]; \
}

static __inline__ void brr_apply_end_flags(BrrVoice *voice, u8 header)
{
    if ((header & 3) != 0) {
        if ((header & 2) != 0) {
            voice->block = voice->loop;
            if (voice->callback != (BrrCallback)0) {
                voice->callback(voice);
            }
        } else {
            voice->callback = (BrrCallback)0;
            voice->flags &= ~11U;
        }
    }
}

void func_80004D34(BrrMixer *mixer)
{
    s16 *output;
    s32 remaining;
    s32 output_index;
    s32 voice_index;
    BrrVoice *voice_base;

    output_index = mixer->output_index;
    remaining = mixer->sample_count;
    output_index ^= 1;
    mixer->output_index = output_index;
    output = mixer->output[output_index];
    voice_base = mixer->voices;

    if (remaining != 0) {
      do {
        s32 left[16];
        s32 right[16];
        u8 *block;
        s32 previous;
        s32 older;
        u8 header;
        BrrVoice *voice;

        voice_index = 7;
        left[0] = 0;
        right[0] = 0;
        left[1] = 0;
        right[1] = 0;
        left[2] = 0;
        right[2] = 0;
        left[3] = 0;
        right[3] = 0;
        left[4] = 0;
        right[4] = 0;
        left[5] = 0;
        right[5] = 0;
        left[6] = 0;
        right[6] = 0;
        left[7] = 0;
        right[7] = 0;
        left[8] = 0;
        right[8] = 0;
        left[9] = 0;
        right[9] = 0;
        left[10] = 0;
        right[10] = 0;
        left[11] = 0;
        right[11] = 0;
        left[12] = 0;
        right[12] = 0;
        left[13] = 0;
        right[13] = 0;
        left[14] = 0;
        right[14] = 0;
        left[15] = 0;
        right[15] = 0;
        voice = voice_base + 7;

voice_loop:
        {
            u32 state;

            state = voice->flags;

            switch (state) {
            case 0:
            case 2:
                goto voice_done;
            case 1:
            case 3:
                goto decode_voice;
            case 5:
            case 7:
                voice->flags &= ~4U;
                goto decode_voice;
            case 4:
            case 6:
                goto activate_voice;
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
                goto stop_voice;
            default:
                goto voice_done;
            }

decode_voice:
            {
                s32 decoded[16];
                s32 r0, r1, r2, r3, r4, r5, r6, r7;
                s32 r8, r9, r10, r11, r12, r13, r14, r15;
                s32 residual_storage[16];
                s32 filter;
                s32 shift;
                s32 sample;
                s32 packed;
                s32 residual14;
                do {
                block = voice->block;
                packed = block[1];
                previous = voice->previous;
                header = block[0];
                older = voice->older;
                residual_storage[1] = r1 = sNibble[packed & 15];
                residual_storage[0] = r0 = sNibble[packed >> 4];
                EXPAND_BYTE(block, shift, packed, 2, r2, r3, 2, 3);
                EXPAND_BYTE(block, shift, packed, 3, r4, r5, 4, 5);
                EXPAND_BYTE(block, shift, packed, 4, r6, r7, 6, 7);
                EXPAND_BYTE(block, shift, packed, 5, r8, r9, 8, 9);
                EXPAND_BYTE(block, shift, packed, 6, r10, r11, 10, 11);
                EXPAND_BYTE(block, shift, packed, 7, r12, r13, 12, 13);
                } while (0);
                packed = block[8];
                residual_storage[15] = r15 = sNibble[packed & 15];
                residual14 = sNibble[packed >> 4];
                shift = header >> 4;
                filter = (header >> 2) & 3;
                residual_storage[14] = r14 = residual14;

#define R(n) r##n
                switch (filter) {
                case 0:
                    packed=r0<<shift; decoded[0]=packed;
                    packed=r1<<shift; decoded[1]=packed;
                    packed=r2<<shift; decoded[2]=packed;
                    packed=r3<<shift; decoded[3]=packed;
                    packed=r4<<shift; decoded[4]=packed;
                    packed=r5<<shift; decoded[5]=packed;
                    packed=r6<<shift; decoded[6]=packed;
                    packed=r7<<shift; decoded[7]=packed;
                    packed=r8<<shift; decoded[8]=packed;
                    packed=r9<<shift; decoded[9]=packed;
                    packed=r10<<shift; decoded[10]=packed;
                    packed=r11<<shift; decoded[11]=packed;
                    packed=r12<<shift; decoded[12]=packed;
                    packed=r13<<shift; decoded[13]=packed;
                    decoded[14]=older=r14<<shift;
                    decoded[15]=previous=r15<<shift;
                    break;
                case 1:
#define C1(n) { previous = (R(n) << shift) + ((previous * 15 << 4) >> 8); decoded[n] = previous; }
                    C1(0); C1(1); C1(2); C1(3);
                    C1(4); C1(5); C1(6); C1(7);
                    C1(8); C1(9); C1(10); C1(11);
                    C1(12); C1(13);
                    older = (r14 << shift) + ((previous * 15 << 4) >> 8);
                    previous = (r15 << shift) + ((older * 15 << 4) >> 8);
                    decoded[14] = older;
                    decoded[15] = previous;
#undef C1
                    break;
                case 2:
                    {
#define C2(n) { sample = (R(n) << shift) + (((previous * 61 << 3) - (older * 15 << 4)) >> 8); older = previous; previous = sample; decoded[n] = sample; }
                    C2(0); C2(1); C2(2); C2(3);
                    C2(4); C2(5); C2(6); C2(7);
                    C2(8); C2(9); C2(10); C2(11);
                    C2(12); C2(13); C2(14); C2(15);
#undef C2
                    }
                    break;
                case 3:
                    {
#define C3(n) { sample = (R(n) << shift) + (((previous * 115 << 2) - (older * 13 << 4)) >> 8); older = previous; previous = sample; decoded[n] = sample; }
                    C3(0); C3(1); C3(2); C3(3);
                    C3(4); C3(5); C3(6); C3(7);
                    C3(8); C3(9); C3(10); C3(11);
                    C3(12); C3(13); C3(14); C3(15);
#undef C3
                    }
                    break;
                }
#undef R
                MIX_GAIN_SWITCH(left, decoded, voice->left_gain);
                MIX_GAIN_SWITCH(right, decoded, voice->right_gain);

                voice->block = block + 9;
                brr_apply_end_flags(voice, header);
                { s32 final_previous=previous; s32 final_older=older;  voice->previous=final_previous; voice->older=final_older; }
            }
            goto voice_done;
activate_voice:
            voice->flags = (voice->flags & ~4U) | 1U;
            goto voice_done;
stop_voice:
            voice->callback = (BrrCallback)0;
            voice->flags &= ~11U;
voice_done: ;
            voice--;
        }
        if (voice_index-- != 0) goto voice_loop;

#define STORE_PAIR(n) { \
    output[(n) * 2] = (s16)(left[n] >> 5); \
    output[(n) * 2 + 1] = (s16)(right[n] >> 5); \
}
        STORE_PAIR(0);  STORE_PAIR(1);  STORE_PAIR(2);  STORE_PAIR(3);
        STORE_PAIR(4);  STORE_PAIR(5);  STORE_PAIR(6);  STORE_PAIR(7);
        STORE_PAIR(8);  STORE_PAIR(9);  STORE_PAIR(10); STORE_PAIR(11);
        STORE_PAIR(12); STORE_PAIR(13); STORE_PAIR(14); STORE_PAIR(15);
#undef STORE_PAIR

        { s32 next_remaining = remaining - 16; remaining = next_remaining; }
        output += 32;
      } while (remaining != 0);
    }
}
