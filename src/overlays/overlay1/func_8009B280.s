.text
.align 2
.set noreorder
.globl func_8009B280
.ent func_8009B280
func_8009B280:
    addiu       $s0, $s0, -0x1
    srl         $v0, $s1, 28
    sll         $a1, $v0, 4
    bnez        $s0, .L8009B2A0
    sll         $s1, $s1, 4
    lw          $s1, 0x0($s3)
    addiu       $s3, $s3, 0x4
    addiu       $s0, $zero, 0x8
.L8009B2A0:
    addiu       $s0, $s0, -0x1
    srl         $v0, $s1, 28
    or          $a1, $a1, $v0
    bnez        $s0, .L8009B2C0
    sll         $s1, $s1, 4
    lw          $s1, 0x0($s3)
    addiu       $s3, $s3, 0x4
    addiu       $s0, $zero, 0x8
.L8009B2C0:
    andi        $v0, $a1, 0x80
.end func_8009B280
