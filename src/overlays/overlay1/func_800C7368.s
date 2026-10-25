.text
.align 2
.set noreorder
.globl func_800C7368
.ent func_800C7368
func_800C7368:
    jal         func_800B7DD8
    addu        $a3, $zero, $zero
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    lw          $v0, 0x2C($v1)
    lw          $a0, 0x30($v1)
    lw          $a2, 0x20($v1)
    sll         $v0, $v0, 1
    sw          $v0, 0x2C($v1)
    lw          $v0, 0x2C($v1)
    sll         $a0, $a0, 1
    sw          $a0, 0x30($v1)
    lw          $a0, 0x1C($v1)
    lw          $a1, 0x30($v1)
    sll         $v0, $v0, 3
    addu        $a0, $a0, $v0
    sll         $a1, $a1, 3
    addu        $a2, $a2, $a1
    sw          $a0, 0x1C($v1)
    sw          $a2, 0x20($v1)
    lbu         $v1, 0x64($s3)
    addiu       $v0, $zero, 0x1F
    bne         $v1, $v0, .L800C73F0
    addu        $a0, $s1, $zero
    jal         func_80031A1C
    addiu       $a0, $zero, 0x64
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x32
    beql        $v0, $zero, .L800C73F0
    addu        $a0, $s1, $zero
    jal         func_800C2290
    addu        $a0, $s1, $zero
    j           func_800C2CD8
    addu        $a0, $s1, $zero
.L800C73F0:
    jal         func_800C12B4
    addu        $a1, $s3, $zero
    addu        $a0, $s1, $zero
    jal         func_80021078
    addu        $a1, $s3, $zero
    jal         func_8009CFAC
    addu        $a0, $s3, $zero
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bnez        $v0, .L800C7440
    nop
    lw          $v0, 0x24($s1)
    lui         $v1, 0x8008
    lw          $v1, 0x4F34($v1)
    lw          $v0, 0x20($v0)
    subu        $v0, $v0, $v1
    bgez        $v0, .L800C7440
    nop
    jal         func_80041E54
    addiu       $a0, $zero, 0xC
.L800C7440:
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4E($v0)
    bnez        $v0, . + 4 + (0x15 << 2)
    nop
    lui         $a1, 0x8009
    lw          $a1, -0x5FA8($a1)
    beqz        $a1, . + 4 + (0xC << 2)
    addiu       $v1, $zero, -0x201
    lw          $a0, 0x24($a1)
    lw          $v0, 0x14($a0)
    and         $v0, $v0, $v1
    sw          $v0, 0x14($a0)
    lh          $v0, 0x30($a1)
    slti        $v0, $v0, 0x3D
    bnez        $v0, . + 4 + (0x5 << 2)
.end func_800C7368
