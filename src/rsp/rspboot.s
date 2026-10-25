.set noreorder
.section .text
.balign 4

/* Standard RSP task bootstrap, loaded at RSP IMEM 0x04001000. */
rspbootTextStart:
    .word 0x09000419 /* j 0x04001064 */
    .word 0x20010FC0 /* addi $1, $zero, 0x0FC0 */
    .word 0x8C220010 /* lw $2, 0x10($1) */
    .word 0x20030F7F /* addi $3, $zero, 0x0F7F */
    .word 0x20071080 /* addi $7, $zero, 0x1080 */
    .word 0x40870000 /* mtc0 $7, SP_MEM_ADDR */
    .word 0x40820800 /* mtc0 $2, SP_DRAM_ADDR */
    .word 0x40831000 /* mtc0 $3, SP_RD_LEN */
    .word 0x40043000 /* mfc0 $4, SP_DMA_BUSY */
    .word 0x1480FFFE /* bnez $4, -2 */
    .word 0x00000000 /* nop */
    .word 0x0D00040F /* jal 0x0400103C */
    .word 0x00000000 /* nop */
    .word 0x00E00008 /* jr $7 */
    .word 0x40803800 /* mtc0 $zero, SP_SEMAPHORE */
    .word 0x40082000 /* mfc0 $8, SP_STATUS */
    .word 0x31080080 /* andi $8, $8, 0x80 */
    .word 0x15000002 /* bnez $8, 2 */
    .word 0x00000000 /* nop */
    .word 0x03E00008 /* jr $ra */
    .word 0x40803800 /* mtc0 $zero, SP_SEMAPHORE */
    .word 0x34085200 /* ori $8, $zero, 0x5200 */
    .word 0x40882000 /* mtc0 $8, SP_STATUS */
    .word 0x0000000D /* break */
    .word 0x00000000 /* nop */
    .word 0x8C220004 /* lw $2, 4($1) */
    .word 0x30420002 /* andi $2, $2, 2 */
    .word 0x10400007 /* beqz $2, 7 */
    .word 0x00000000 /* nop */
    .word 0x0D00040F /* jal 0x0400103C */
    .word 0x00000000 /* nop */
    .word 0x40025800 /* mfc0 $2, DPC_STATUS */
    .word 0x30420100 /* andi $2, $2, 0x100 */
    .word 0x1C40FFED /* bgtz $2, -19 */
    .word 0x00000000 /* nop */
    .word 0x8C220018 /* lw $2, 0x18($1) */
    .word 0x8C23001C /* lw $3, 0x1C($1) */
    .word 0x2063FFFF /* addi $3, $3, -1 */
    .word 0x401E2800 /* mfc0 $30, SP_DMA_FULL */
    .word 0x17C0FFFE /* bnez $30, -2 */
    .word 0x00000000 /* nop */
    .word 0x40800000 /* mtc0 $zero, SP_MEM_ADDR */
    .word 0x40820800 /* mtc0 $2, SP_DRAM_ADDR */
    .word 0x40831000 /* mtc0 $3, SP_RD_LEN */
    .word 0x40043000 /* mfc0 $4, SP_DMA_BUSY */
    .word 0x1480FFFE /* bnez $4, -2 */
    .word 0x00000000 /* nop */
    .word 0x0D00040F /* jal 0x0400103C */
    .word 0x00000000 /* nop */
    .word 0x09000402 /* j 0x04001008 */
    .word 0x00000000 /* nop */
rspbootTextEnd:
