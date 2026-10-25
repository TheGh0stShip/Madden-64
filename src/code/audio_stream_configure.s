.text
.align 2
.set noreorder
.globl audio_stream_configure
.ent audio_stream_configure
audio_stream_configure:
    lui         $v1, 0x8007
    lbu         $v1, 0x4808($v1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L8003C148
    sll         $v0, $a3, 16
    andi        $v0, $a1, 0xFFFF
    lbu         $v1, 0x1E($a0)
    sll         $a0, $v0, 1
    addu        $a0, $a0, $v0
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $a0, $a0, $v0
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lbu         $a0, 0x1602($at)
    andi        $v0, $a2, 0xFFFF
    addiu       $v1, $v0, -0x2
    sltiu       $v0, $v1, 0xF
    beqz        $v0, .L8003C10C
    addiu       $v0, $zero, 0x64
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x2C40($at)
    jr          $v0
    nop
    srl         $v0, $a0, 31
    addu        $v0, $a0, $v0
    sra         $v0, $v0, 1
    addiu       $v1, $zero, 0x64
    subu        $a0, $v1, $v0
    sll         $v1, $a3, 16
    sra         $v1, $v1, 16
    .word       0x00640018  # mult        $v1, $a0
    .word       0x00001812  # mflo        $v1
    lui         $v0, 0x51EB
    ori         $v0, $v0, 0x851F
    .word       0x00620018  # mult        $v1, $v0
    sra         $v1, $v1, 31
    .word       0x00004010  # mfhi        $t0
    sra         $v0, $t0, 5
    subu        $v0, $v0, $v1
    j .L8003C148
    sll         $v0, $v0, 16
    slti        $v0, $a0, 0x33
    bnel        $v0, $zero, .L8003C148
    sll         $v0, $a3, 16
    sll         $v1, $a3, 16
    sra         $v0, $v1, 16
    srl         $v1, $v1, 31
    addu        $v0, $v0, $v1
    j .L8003C14C
    sra         $v0, $v0, 1
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    srl         $v1, $v0, 31
    addu        $v0, $v0, $v1
    sra         $v0, $v0, 1
    addiu       $v1, $zero, 0x64
    subu        $a0, $v1, $v0
    nor         $v0, $zero, $a0
    sra         $v0, $v0, 31
    and         $a0, $a0, $v0
    sll         $v1, $a3, 16
    sra         $v1, $v1, 16
    .word       0x00640018  # mult        $v1, $a0
    .word       0x00001812  # mflo        $v1
    lui         $v0, 0x51EB
    ori         $v0, $v0, 0x851F
    .word       0x00620018  # mult        $v1, $v0
    sra         $v1, $v1, 31
    .word       0x00004010  # mfhi        $t0
    sra         $v0, $t0, 5
    subu        $v0, $v0, $v1
    j .L8003C148
    sll         $v0, $v0, 16
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    srl         $v1, $v0, 31
    addu        $v0, $v0, $v1
    sra         $v0, $v0, 1
    subu        $v0, $a3, $v0
    j .L8003C148
    sll         $v0, $v0, 16
    addiu       $v0, $zero, 0x64
.L8003C10C:
    subu        $a0, $v0, $a0
    sll         $v1, $a3, 16
    sra         $v1, $v1, 16
    .word       0x00640018  # mult        $v1, $a0
    .word       0x00001812  # mflo        $v1
    lui         $v0, 0x51EB
    ori         $v0, $v0, 0x851F
    .word       0x00620018  # mult        $v1, $v0
    sra         $v1, $v1, 31
    .word       0x00004010  # mfhi        $t0
    sra         $v0, $t0, 5
    subu        $v0, $v0, $v1
    j .L8003C148
    sll         $v0, $v0, 16
    sll         $v0, $a3, 16
.L8003C148:
    sra         $v0, $v0, 16
.L8003C14C:
    jr          $ra
    nop
.end audio_stream_configure
