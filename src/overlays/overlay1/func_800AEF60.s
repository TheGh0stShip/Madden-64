.text
.align 2
.set noreorder
.globl func_800AEF60
.ent func_800AEF60
func_800AEF60:
    lui         $a0, 0x8008
    lh          $a0, 0x76DC($a0)
    sll         $v0, $s1, 16
    sra         $a2, $v0, 16
    sll         $v0, $a2, 2
    addu        $v1, $v0, $s2
    lw          $v0, 0x0($v1)
    beq         $a0, $v0, . + 4 + (0xE8 << 2)
    addiu       $v0, $s1, 0x1
    slti        $v0, $a0, 0x5
    beqz        $v0, .L800AEFA8
    sw          $a0, 0x0($v1)
    sll         $a1, $a2, 3
    addu        $a1, $a1, $a2
    jal         func_800167FC
    addu        $a1, $a1, $s3
    j           func_800AABF0
    addiu       $a0, $zero, 0xB
.L800AEFA8:
    addiu       $v0, $zero, 0x5
    bne         $a0, $v0, . + 4 + (0xD9 << 2)
    addiu       $a0, $zero, 0xB
    sll         $v0, $a2, 3
    addu        $v0, $v0, $a2
    addiu       $v1, $zero, 0x4F
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $v1, 0x5818($at)
    addiu       $v1, $zero, 0x54
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $v1, 0x5819($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $zero, 0x581A($at)
    j           func_800AABF0
    nop
.end func_800AEF60
