.text
.align 2
.set noreorder
.globl func_800AF07C
.ent func_800AF07C
func_800AF07C:
    lui         $a0, 0x8008
    lh          $a0, 0x7758($a0)
    sll         $v0, $s1, 16
    sra         $a2, $v0, 16
    sll         $v0, $a2, 2
    addu        $a1, $v0, $s2
    lw          $v0, 0x0($a1)
    beq         $a0, $v0, . + 4 + (0xA1 << 2)
    addiu       $v0, $s1, 0x1
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L800AF0D0
    addiu       $v0, $zero, 0x3E8
    sw          $a0, 0x0($a1)
    sll         $a1, $a2, 3
    addu        $a1, $a1, $a2
    jal         func_800AAEF0
    addu        $a1, $a1, $s3
    j           func_800AABF0
    addiu       $a0, $zero, 0xD
.L800AF0D0:
    sw          $v0, 0x0($a1)
    sll         $v0, $a2, 3
    addu        $v0, $v0, $a2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $s4, 0x5818($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $zero, 0x5819($at)
    j           func_800AABF0
    addiu       $a0, $zero, 0xD
.end func_800AF07C
