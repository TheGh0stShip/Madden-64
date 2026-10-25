.text
.align 2
.set noreorder
.globl audio_voice_process
.ent audio_voice_process
audio_voice_process:
    andi        $a0, $a0, 0xFFFF
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v1, 0x2DBC($at)
    lbu         $v0, 0x0($v1)
    andi        $v0, $v0, 0x80
    beqz        $v0, .L80038874
    addiu       $a3, $v1, 0x6
    andi        $a1, $a1, 0xFFFF
    beqz        $a1, .L80038808
    addu        $t1, $zero, $zero
    addu        $t2, $zero, $zero
    sb          $zero, 0x0($a2)
.L80038780:
    lbu         $t0, 0x0($a3)
    andi        $v0, $t0, 0x7F
    sb          $v0, 0x0($a2)
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lb          $v0, 0x2C1C($at)
    addiu       $a3, $a3, 0x1
    slt         $v0, $t2, $v0
    beqz        $v0, .L800387E8
    addu        $a0, $zero, $zero
.L800387A8:
    lbu         $v1, 0x0($a3)
    sll         $v0, $a0, 24
    sra         $v0, $v0, 24
    addu        $v0, $a2, $v0
    sb          $v1, 0x1($v0)
    lbu         $v1, 0x0($a2)
    addiu       $v0, $a0, 0x1
    addu        $a0, $v0, $zero
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lb          $v1, 0x2C1C($at)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    slt         $v0, $v0, $v1
    bnez        $v0, .L800387A8
    addiu       $a3, $a3, 0x1
.L800387E8:
    andi        $v0, $t0, 0x80
    beqz        $v0, .L80038780
    sb          $t0, 0x0($a2)
    addiu       $t1, $t1, 0x1
    andi        $v0, $t1, 0xFFFF
    sltu        $v0, $v0, $a1
    bnel        $v0, $zero, .L80038780
    sb          $zero, 0x0($a2)
.L80038808:
    lbu         $t0, 0x0($a3)
    andi        $v0, $t0, 0x7F
    sb          $v0, 0x0($a2)
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lb          $v0, 0x2C1C($at)
    addiu       $a3, $a3, 0x1
    blez        $v0, .L80038904
    addu        $a0, $zero, $zero
.L8003882C:
    lbu         $v1, 0x0($a3)
    sll         $v0, $a0, 24
    sra         $v0, $v0, 24
    addu        $v0, $a2, $v0
    sb          $v1, 0x1($v0)
    lbu         $v1, 0x0($a2)
    addiu       $v0, $a0, 0x1
    addu        $a0, $v0, $zero
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lb          $v1, 0x2C1C($at)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    slt         $v0, $v0, $v1
    bnez        $v0, .L8003882C
    addiu       $a3, $a3, 0x1
    j .L80038904
    nop
.L80038874:
    addiu       $v1, $v1, 0x6
    andi        $a1, $a1, 0xFFFF
    sltu        $v0, $v0, $a1
    beqz        $v0, .L800388E0
    addu        $t1, $zero, $zero
    sb          $zero, 0x0($a2)
.L8003888C:
    addiu       $a0, $v1, 0x3
.L80038890:
    lbu         $v0, 0x0($v1)
    andi        $v0, $v0, 0x7F
    sb          $v0, 0x0($a2)
    lbu         $v0, -0x2($a0)
    sb          $v0, 0x1($a2)
    lbu         $v0, -0x1($a0)
    sb          $v0, 0x2($a2)
    lbu         $v0, 0x0($a0)
    sb          $v0, 0x3($a2)
    lbu         $v0, 0x0($v1)
    addiu       $a0, $a0, 0x4
    sb          $v0, 0x0($a2)
    andi        $v0, $v0, 0x80
    beqz        $v0, .L80038890
    addiu       $v1, $v1, 0x4
    addiu       $t1, $t1, 0x1
    andi        $v0, $t1, 0xFFFF
    sltu        $v0, $v0, $a1
    bnel        $v0, $zero, .L8003888C
    sb          $zero, 0x0($a2)
.L800388E0:
    lbu         $v0, 0x0($v1)
    andi        $v0, $v0, 0x7F
    sb          $v0, 0x0($a2)
    lbu         $v0, 0x1($v1)
    sb          $v0, 0x1($a2)
    lbu         $v0, 0x2($v1)
    sb          $v0, 0x2($a2)
    lbu         $v0, 0x3($v1)
    sb          $v0, 0x3($a2)
.L80038904:
    jr          $ra
    nop
.end audio_voice_process
