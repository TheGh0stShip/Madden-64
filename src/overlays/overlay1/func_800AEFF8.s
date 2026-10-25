.text
.align 2
.set noreorder
.globl func_800AEFF8
.ent func_800AEFF8
func_800AEFF8:
    sll         $v0, $s1, 16
    sra         $a0, $v0, 16
    sll         $v0, $a0, 2
    addu        $v1, $v0, $s2
    lw          $v0, 0x0($v1)
    beq         $a1, $v0, . + 4 + (0xC4 << 2)
    addiu       $v0, $s1, 0x1
    sll         $v0, $a0, 3
    addu        $s0, $v0, $a0
    sw          $a1, 0x0($v1)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sb          $zero, 0x5818($at)
    lui         $v0, 0x8008
    lh          $v0, 0x7AAC($v0)
    slti        $v0, $v0, 0x3C
    beqz        $v0, .L800AF058
    addiu       $v0, $zero, 0x30
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sb          $v0, 0x5818($at)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sb          $zero, 0x5819($at)
.L800AF058:
    lui         $a0, 0x8008
    lh          $a0, 0x7AAC($a0)
    jal         func_800AAEF0
    addiu       $a1, $sp, 0x10
    addu        $a0, $s0, $s3
    jal         func_8002E688
    addiu       $a1, $sp, 0x10
    j           func_800AABF0
    addiu       $a0, $zero, 0xC
.end func_800AEFF8
