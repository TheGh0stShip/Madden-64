.text
.align 2
.set noreorder
.globl func_800C1F78
.ent func_800C1F78
func_800C1F78:
    lui         $a3, 0x8009
    lw          $a3, -0x5FA8($a3)
    addiu       $sp, $sp, -0x30
    addu        $t8, $a0, $zero
    bnez        $a3, . + 4 + (0x43 << 2)
    sw          $ra, 0x28($sp)
    lui         $a0, 0x8008
    lw          $a0, 0x7A70($a0)
    lui         $v0, 0x7FFF
    ori         $v0, $v0, 0xFFFF
    beq         $a0, $v0, . + 4 + (0x32 << 2)
    addiu       $v0, $zero, 0x3
.end func_800C1F78
