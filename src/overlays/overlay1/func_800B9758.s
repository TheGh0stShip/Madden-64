.text
.align 2
.set noreorder
.globl func_800B9758
.ent func_800B9758
func_800B9758:
    lui         $a0, 0x1
    ori         $a0, $a0, 0xA2D0
    andi        $v1, $s1, 0xFFFF
    lui         $a1, 0x8007
    lw          $a1, 0x18E8($a1)
    sll         $v0, $v1, 4
    addu        $v1, $v1, $a0
    lui         $a0, 0x8009
    lh          $a0, -0x5080($a0)
    addiu       $v0, $v0, 0x40
    sw          $ra, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s0, 0x10($sp)
    addu        $s0, $a1, $v0
    addiu       $v0, $zero, 0x2
.end func_800B9758
