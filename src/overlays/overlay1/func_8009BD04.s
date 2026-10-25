.text
.align 2
.set noreorder
.globl func_8009BD04
.ent func_8009BD04
func_8009BD04:
    addiu       $v0, $t0, 0x9C
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x139
    sll         $v1, $a3, 16
    sra         $a0, $v1, 16
    slti        $v1, $a0, 0x75
    and         $v0, $v0, $v1
    beqz        $v0, .L8009BD30
    slti        $v0, $a0, -0x74
    beqz        $v0, . + 4 + (0x9C << 2)
    addiu       $v0, $zero, 0x8
.L8009BD30:
    sll         $v0, $t1, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, 0x2
    bne         $v0, $v1, .L8009BD4C
    nop
    negu        $t0, $t0
    negu        $a3, $a3
.L8009BD4C:
    lui         $a0, 0x8008
    lh          $a0, -0x7B80($a0)
    sll         $v0, $t0, 16
    sra         $v1, $v0, 16
    negu        $a2, $a0
.end func_8009BD04
