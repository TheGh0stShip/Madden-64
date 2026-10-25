.text
.align 2
.set noreorder
.globl func_800B8C90
.ent func_800B8C90
func_800B8C90:
    lw          $s1, 0x0($v0)
    lw          $v0, 0x24($s1)
    lui         $v1, 0x8008
    lw          $v1, 0x7128($v1)
    addiu       $s0, $s0, 0xB
    lw          $v0, 0x1C($v0)
    sll         $s0, $s0, 5
    addu        $v1, $v1, $s0
    sw          $v0, 0x0($v1)
    lw          $v0, 0x24($s1)
    lw          $v0, 0x20($v0)
    sw          $v0, 0x4($v1)
    lw          $v0, 0x24($s1)
    lw          $v0, 0x24($v0)
    addu        $a0, $s1, $zero
    jal         func_800C157C
    sw          $v0, 0x8($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x7128($v1)
    addu        $v1, $v1, $s0
    sh          $v0, 0x10($v1)
.end func_800B8C90
