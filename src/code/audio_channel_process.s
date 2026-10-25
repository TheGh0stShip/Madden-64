.text
.align 2
.set noreorder
.globl audio_channel_process
.ent audio_channel_process
audio_channel_process:
    lui         $v0, 0x8007
    lw          $v0, 0x3508($v0)
    beqz        $v0, .L8003DB20
    nop
    lui         $a3, 0x8006
    lw          $a3, 0x4A00($a3)
    beqz        $a3, .L8003DB20
    sll         $v0, $a0, 4
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x7B70($at)
    beqz        $v0, .L8003DB20
    nop
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lb          $v0, 0x7B10($at)
    bgez        $v0, .L8003DB20
    slti        $v0, $a1, 0x80
    beqz        $v0, .L8003D948
    addiu       $v1, $zero, 0x7F
    addu        $v1, $a1, $zero
.L8003D948:
    addu        $a1, $v1, $zero
    slti        $v0, $a2, 0x80
    beqz        $v0, .L8003D95C
    addiu       $v1, $zero, 0x7F
    addu        $v1, $a2, $zero
.L8003D95C:
    addu        $a2, $v1, $zero
    addiu       $v0, $zero, 0x14
    bne         $a0, $v0, .L8003D970
    addiu       $t0, $zero, 0x5
    addiu       $t0, $zero, 0x6
.L8003D970:
    addiu       $v0, $zero, 0x15
    beql        $a0, $v0, .L8003D97C
    addiu       $t0, $zero, 0x6
.L8003D97C:
    addiu       $v0, $zero, 0x17
    beql        $a0, $v0, .L8003D988
    addiu       $t0, $zero, 0x7
.L8003D988:
    addiu       $v0, $zero, 0x18
    beql        $a0, $v0, .L8003D994
    addiu       $t0, $zero, 0x7
.L8003D994:
    addu        $v0, $t0, $zero
    beqz        $v0, .L8003D9C8
    addiu       $t0, $t0, -0x1
    lw          $v1, 0x14($a3)
    sll         $v0, $t0, 5
    addu        $v1, $v0, $v1
.L8003D9AC:
    lw          $v0, 0x18($v1)
    andi        $v0, $v0, 0x5
    beqz        $v0, .L8003D9C8
    addu        $a3, $t0, $zero
    addiu       $v1, $v1, -0x20
    bnez        $a3, .L8003D9AC
    addiu       $t0, $t0, -0x1
.L8003D9C8:
    bltz        $t0, .L8003DB20
    nop
    lui         $at, 0x8008
    addu        $at, $at, $t0
    lb          $v1, 0x7B08($at)
    bltz        $v1, .L8003DA08
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $v0, 0x7B10($at)
    lui         $at, 0x8008
    addu        $at, $at, $t0
    sb          $v0, 0x7B08($at)
    lui         $at, 0x8009
    addu        $at, $at, $t0
    sb          $zero, -0x4870($at)
.L8003DA08:
    sll         $a3, $a0, 4
    lui         $at, 0x8008
    addu        $at, $at, $a3
    lw          $v0, 0x7B70($at)
    beqz        $v0, .L8003DB20
    addiu       $a1, $a1, 0x1
    lui         $v0, 0x8007
    lw          $v0, 0x3508($v0)
    addiu       $v0, $v0, 0x1
    .word       0x00A20018  # mult        $a1, $v0
    .word       0x00002812  # mflo        $a1
    addiu       $a2, $a2, 0x1
    nop
    .word       0x00C20018  # mult        $a2, $v0
    .word       0x00003012  # mflo        $a2
    lui         $at, 0x8008
    addu        $at, $at, $a3
    lw          $v0, 0x7B78($at)
    .word       0x00A20018  # mult        $a1, $v0
    .word       0x00002812  # mflo        $a1
    lui         $at, 0x8008
    addu        $at, $at, $a3
    lw          $v0, 0x7B7C($at)
    .word       0x00C20018  # mult        $a2, $v0
    .word       0x00003012  # mflo        $a2
    lui         $v0, 0x8006
    lw          $v0, 0x4A00($v0)
    lw          $v1, 0x14($v0)
    sll         $v0, $t0, 5
    addu        $v1, $v1, $v0
    sra         $a1, $a1, 14
    slti        $v0, $a1, 0x10
    bnez        $v0, .L8003DA94
    sra         $a2, $a2, 14
    addiu       $a1, $zero, 0xF
.L8003DA94:
    slti        $v0, $a2, 0x10
    beql        $v0, $zero, .L8003DAA0
    addiu       $a2, $zero, 0xF
.L8003DAA0:
    nor         $v0, $zero, $a1
    sra         $v0, $v0, 31
    and         $a1, $a1, $v0
    nor         $v0, $zero, $a2
    sra         $v0, $v0, 31
    and         $a2, $a2, $v0
    sw          $a1, 0x0($v1)
    sw          $a2, 0x4($v1)
    lui         $at, 0x8008
    addu        $at, $at, $a3
    lw          $v0, 0x7B70($at)
    sw          $v0, 0x10($v1)
    lui         $at, 0x8008
    addu        $at, $at, $a3
    lw          $v0, 0x7B74($at)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x14($v1)
    sw          $zero, 0xC($v1)
    beqz        $v0, .L8003DAFC
    sw          $zero, 0x8($v1)
    lw          $v0, 0x18($v1)
    j .L8003DB04
    ori         $v0, $v0, 0x6
.L8003DAFC:
    lw          $v0, 0x18($v1)
    ori         $v0, $v0, 0x4
.L8003DB04:
    sw          $v0, 0x18($v1)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $t0, 0x7B10($at)
    lui         $at, 0x8008
    addu        $at, $at, $t0
    sb          $a0, 0x7B08($at)
.L8003DB20:
    jr          $ra
    nop
.end audio_channel_process
