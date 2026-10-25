.text
.align 2
.set noreorder
.globl func_800A73F4
.ent func_800A73F4
func_800A73F4:
    addu        $a1, $zero, $zero
    lui         $a2, 0x8009
    addiu       $a2, $a2, -0x58DC
    sll         $v0, $a1, 16
.L800A7404:
    sra         $v0, $v0, 14
    addu        $v1, $v0, $a2
    lw          $v0, 0x0($v1)
    bnez        $v0, .L800A7420
    addiu       $v0, $a1, 0x1
    j           func_800A2D0C
    sw          $a0, 0x0($v1)
.L800A7420:
    addu        $a1, $v0, $zero
    sll         $v0, $v0, 16
    blez        $v0, .L800A7404
    sll         $v0, $a1, 16
    lui         $v0, 0xFDF0
    sw          $v0, 0xB0($a0)
    lui         $v0, 0x210
    sw          $v0, 0xB4($a0)
    lui         $v0, 0xFC00
    sw          $v0, 0xB8($a0)
    lui         $v0, 0x400
    sh          $zero, 0x84($a0)
    sh          $zero, 0xA($a0)
    sw          $zero, 0x3C($a0)
    sw          $zero, 0x40($a0)
    sw          $zero, 0x44($a0)
    jr          $ra
    sw          $v0, 0xBC($a0)
.end func_800A73F4
