.text
.align 2
.set noreorder
.globl func_80099D50
.ent func_80099D50
func_80099D50:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    lw          $a1, 0x8($a0)
    lw          $v0, 0x18($a0)
    lw          $v1, 0x1C($a1)
    sll         $v0, $v0, 4
    addu        $v0, $v0, $v1
    lhu         $v0, 0x0($v0)
    jal         func_800954E0
    sh          $v0, 0x60($a1)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80099D50
