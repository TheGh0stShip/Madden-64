.text
.align 2
.set noreorder
.globl func_800A4368
.ent func_800A4368
func_800A4368:
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    addiu       $sp, $sp, -0x68
    sw          $s2, 0x50($sp)
    addu        $s2, $a0, $zero
    sw          $ra, 0x64($sp)
    sw          $s6, 0x60($sp)
    sw          $s5, 0x5C($sp)
    sw          $s4, 0x58($sp)
    sw          $s3, 0x54($sp)
    sw          $s1, 0x4C($sp)
    bnez        $v0, . + 4 + (0x1D0 << 2)
    sw          $s0, 0x48($sp)
    jal         func_800E0E24
    nop
    andi        $v0, $v0, 0xFFFF
    bnez        $v0, . + 4 + (0x1CC << 2)
    addiu       $v0, $zero, 0x1
    lw          $v1, 0x8C($s2)
    sltiu       $v0, $v1, 0x5
    beqz        $v0, . + 4 + (0x1C7 << 2)
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0xCA0($at)
    jr          $v0
    nop
.end func_800A4368
