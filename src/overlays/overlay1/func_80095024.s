.text
.align 2
.set noreorder
.globl func_80095024
.ent func_80095024
func_80095024:
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $a0, 0x2DB8($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $a1, 0x2DB4($at)
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    addiu       $v1, $zero, 0x2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $v1, 0x6DDC($at)
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    lui         $at, 0x8008
.end func_80095024
