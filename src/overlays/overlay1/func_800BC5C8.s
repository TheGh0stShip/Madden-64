.text
.align 2
.set noreorder
.globl func_800BC5C8
.ent func_800BC5C8
func_800BC5C8:
    and         $v0, $v1, $v0
    beqz        $v0, .L800BC6A0
    addiu       $v0, $zero, 0x4
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    bne         $v1, $v0, . + 4 + (0x33F << 2)
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x7AAC($v0)
    slti        $v0, $v0, 0x78
    beqz        $v0, . + 4 + (0x33A << 2)
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x4F34($v0)
    bgez        $v0, . + 4 + (0x336 << 2)
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lhu         $v1, 0x2D94($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $a0, 0x2D94($at)
    sltu        $v0, $v1, $a0
    beqz        $v0, . + 4 + (0x317 << 2)
    addiu       $v0, $v1, 0x7
    slt         $v0, $v0, $a0
    bnez        $v0, . + 4 + (0x314 << 2)
    addiu       $a0, $zero, 0x13
    jal         func_80041BDC
    addiu       $a1, $zero, 0x1E
    j           func_800B8BB8
    nop
.L800BC6A0:
    bnez        $s0, .L800BC6D0
    addiu       $v0, $zero, 0x8C
    lui         $at, 0x8008
    sw          $v0, -0x5BDC($at)
    jal         func_80031A1C
    addiu       $a0, $zero, 0x64
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x2D
    beqz        $v0, .L800BC7A4
    addiu       $v0, $zero, 0x8F
    j           func_800B8078
    nop
.L800BC6D0:
    bnez        $v1, .L800BC7A4
    addiu       $v0, $zero, 0x89
    j           func_800B8078
    nop
    addiu       $v0, $zero, -0x1
    bne         $s0, $v0, .L800BC6F4
    sltiu       $v1, $s0, 0xB
    j           func_800B8078
    addiu       $v0, $zero, 0x87
.L800BC6F4:
    sltu        $v0, $zero, $s0
    and         $v0, $v1, $v0
    bnez        $v0, . + 4 + (0x2F7 << 2)
    nop
    bnez        $s0, .L800BC734
    addiu       $v0, $zero, 0x8D
    lui         $at, 0x8008
    sw          $v0, -0x5BDC($at)
    jal         func_80031A1C
    addiu       $a0, $zero, 0x64
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x2D
    beqz        $v0, .L800BC7A4
    addiu       $v0, $zero, 0x90
    j           func_800B8078
    nop
.L800BC734:
    bnez        $v1, .L800BC7A4
    addiu       $v0, $zero, 0x8A
    j           func_800B8078
    nop
    bne         $s0, $v0, .L800BC754
    sltiu       $v1, $s0, 0xB
    j           func_800B8078
    addiu       $v0, $zero, 0x88
.L800BC754:
    sltu        $v0, $zero, $s0
    and         $v0, $v1, $v0
    bnez        $v0, . + 4 + (0x2DF << 2)
    nop
    bnez        $s0, .L800BC794
    addiu       $v0, $zero, 0x8E
    lui         $at, 0x8008
    sw          $v0, -0x5BDC($at)
    jal         func_80031A1C
    addiu       $a0, $zero, 0x64
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x2D
    beqz        $v0, .L800BC7A4
    addiu       $v0, $zero, 0x91
    j           func_800B8078
    nop
.L800BC794:
    bnez        $v1, .L800BC7A4
    addiu       $v0, $zero, 0x8B
    lui         $at, 0x8008
    sw          $v0, -0x5BDC($at)
.L800BC7A4:
    lui         $v0, 0x8009
    lw          $v0, -0x4878($v0)
    lui         $a0, 0x8009
    lw          $a0, -0x79E0($a0)
    lui         $a1, 0x8008
    addiu       $a1, $a1, -0x5BD8
    addiu       $v1, $zero, -0x1
    addiu       $v0, $v0, 0x960
    sltu        $a0, $a0, $v0
    beqz        $a0, .L800BC7E8
    sw          $v1, 0x0($a1)
    lui         $v1, 0x8008
    lw          $v1, -0x5BDC($v1)
    lui         $v0, 0x8008
    lw          $v0, 0xC0C($v0)
    beq         $v1, $v0, . + 4 + (0x2BE << 2)
    nop
.L800BC7E8:
    jal         func_800B7BC0
    addiu       $a0, $a1, -0x8
    lui         $v0, 0x8009
    lw          $v0, -0x79E0($v0)
    lui         $v1, 0x8008
    lw          $v1, -0x5BDC($v1)
    lui         $at, 0x8009
    sw          $v0, -0x4878($at)
    lui         $at, 0x8008
    sw          $v1, 0xC0C($at)
    j           func_800B8BB8
    nop
.end func_800BC5C8
