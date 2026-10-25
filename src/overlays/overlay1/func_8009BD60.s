.text
.align 2
.set noreorder
.globl func_8009BD60
.ent func_8009BD60
func_8009BD60:
    slt         $v0, $v1, $a2
    beqz        $v0, .L8009BE40
    addu        $a1, $a0, $zero
    negu        $a1, $a1
    lui         $at, 0x8008
    sh          $a1, -0x7B78($at)
    subu        $v1, $a2, $v1
    sra         $v1, $v1, 3
    slti        $v0, $v1, 0x11
    beqz        $v0, .L8009BD90
    addiu       $a0, $zero, 0x10
    addu        $a0, $v1, $zero
.L8009BD90:
    addu        $v0, $a1, $a0
    lui         $a0, 0x8008
    lh          $a0, -0x7B7C($a0)
    lui         $at, 0x8008
    sh          $v0, -0x7B78($at)
    sll         $v0, $a3, 16
    sra         $v1, $v0, 16
    negu        $a2, $a0
    slt         $v0, $v1, $a2
    beqz        $v0, .L8009BDF4
    addu        $a1, $a0, $zero
    negu        $a1, $a1
    lui         $at, 0x8008
    sh          $a1, -0x7B74($at)
    subu        $v1, $a2, $v1
    sra         $v1, $v1, 4
    slti        $v0, $v1, 0x11
    beqz        $v0, .L8009BDE0
    addiu       $a0, $zero, 0x10
    addu        $a0, $v1, $zero
.L8009BDE0:
    addu        $v0, $a1, $a0
    lui         $at, 0x8008
    sh          $v0, -0x7B74($at)
    j           func_80097878
    addiu       $v0, $zero, 0x7
.L8009BDF4:
    slt         $v0, $a0, $v1
    beqz        $v0, .L8009BE30
    subu        $v1, $v1, $a0
    lui         $at, 0x8008
    sh          $a1, -0x7B74($at)
    sra         $v1, $v1, 4
    slti        $v0, $v1, 0x11
    beqz        $v0, .L8009BE1C
    addiu       $a0, $zero, 0x10
    addu        $a0, $v1, $zero
.L8009BE1C:
    subu        $v0, $a1, $a0
    lui         $at, 0x8008
    sh          $v0, -0x7B74($at)
    j           func_80097878
    addiu       $v0, $zero, 0x5
.L8009BE30:
    lui         $at, 0x8008
    sh          $a3, -0x7B74($at)
    j           func_80097878
    addiu       $v0, $zero, 0x6
.L8009BE40:
    slt         $v0, $a0, $v1
    beqz        $v0, .L8009BEFC
    subu        $v1, $v1, $a0
    lui         $at, 0x8008
    sh          $a1, -0x7B78($at)
    sra         $v1, $v1, 3
    slti        $v0, $v1, 0x11
    beqz        $v0, .L8009BE68
    addiu       $a0, $zero, 0x10
    addu        $a0, $v1, $zero
.L8009BE68:
    subu        $v0, $a1, $a0
    lui         $a1, 0x8008
    lh          $a1, -0x7B7C($a1)
    lui         $at, 0x8008
    sh          $v0, -0x7B78($at)
    sll         $v0, $a3, 16
    sra         $v1, $v0, 16
    negu        $a0, $a1
    slt         $v0, $v1, $a0
    beqz        $v0, .L8009BEB0
    addu        $a2, $a1, $zero
    subu        $v1, $a0, $v1
    sra         $v1, $v1, 4
    subu        $v0, $v1, $a2
    lui         $at, 0x8008
    sh          $v0, -0x7B74($at)
    j           func_80097878
    addiu       $v0, $zero, 0x1
.L8009BEB0:
    slt         $v0, $a1, $v1
    beqz        $v0, .L8009BEEC
    subu        $v1, $v1, $a1
    lui         $at, 0x8008
    sh          $a2, -0x7B74($at)
    sra         $v1, $v1, 4
    slti        $v0, $v1, 0x11
    beqz        $v0, .L8009BED8
    addiu       $a0, $zero, 0x10
    addu        $a0, $v1, $zero
.L8009BED8:
    subu        $v0, $a2, $a0
    lui         $at, 0x8008
    sh          $v0, -0x7B74($at)
    j           func_80097878
    addiu       $v0, $zero, 0x3
.L8009BEEC:
    lui         $at, 0x8008
    sh          $a3, -0x7B74($at)
    j           func_80097878
    addiu       $v0, $zero, 0x2
.L8009BEFC:
    lui         $a0, 0x8008
    lh          $a0, -0x7B7C($a0)
    sll         $v0, $a3, 16
    sra         $v1, $v0, 16
    lui         $at, 0x8008
    sh          $t0, -0x7B78($at)
    negu        $a2, $a0
    slt         $v0, $v1, $a2
    beqz        $v0, .L8009BF5C
    addu        $a1, $a0, $zero
    negu        $a1, $a1
    lui         $at, 0x8008
    sh          $a1, -0x7B74($at)
    subu        $v1, $a2, $v1
    sra         $v1, $v1, 2
    slti        $v0, $v1, 0x11
    beqz        $v0, .L8009BF48
    addiu       $a0, $zero, 0x10
    addu        $a0, $v1, $zero
.L8009BF48:
    addu        $v0, $a1, $a0
    lui         $at, 0x8008
    sh          $v0, -0x7B74($at)
    j           func_80097878
    addu        $v0, $zero, $zero
.L8009BF5C:
    slt         $v0, $a0, $v1
    beqz        $v0, .L8009BF98
    subu        $v1, $v1, $a0
    lui         $at, 0x8008
    sh          $a1, -0x7B74($at)
    sra         $v1, $v1, 4
    slti        $v0, $v1, 0x11
    beqz        $v0, .L8009BF84
    addiu       $a0, $zero, 0x10
    addu        $a0, $v1, $zero
.L8009BF84:
    subu        $v0, $a1, $a0
    lui         $at, 0x8008
    sh          $v0, -0x7B74($at)
    j           func_80097878
    addiu       $v0, $zero, 0x4
.L8009BF98:
    addiu       $v0, $zero, 0x8
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
    nop
.end func_8009BD60
