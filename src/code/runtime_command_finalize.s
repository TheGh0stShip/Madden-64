.text
.align 2
.set noreorder
.globl runtime_command_finalize
.ent runtime_command_finalize
runtime_command_finalize:
    addu        $v1, $zero, $zero
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x79C8
.L8002FC74:
    sw          $zero, 0x0($a0)
    addiu       $v1, $v1, 0x1
    sltiu       $v0, $v1, 0x28
    bnez        $v0, .L8002FC74
    addiu       $a0, $a0, 0x4
    addu        $v1, $zero, $zero
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x7AF8
.L8002FC94:
    sw          $zero, 0x0($a0)
    addiu       $v1, $v1, 0x1
    sltiu       $v0, $v1, 0x28
    bnez        $v0, .L8002FC94
    addiu       $a0, $a0, 0x4
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1C64
    lui         $at, 0x8009
    sw          $v0, -0x7938($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1C94
    lui         $at, 0x8009
    sw          $v0, -0x793C($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1CC4
    lui         $at, 0x8009
    sw          $v0, -0x7940($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1CF4
    lui         $at, 0x8009
    sw          $v0, -0x7944($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1D24
    lui         $at, 0x8009
    sw          $v0, -0x7960($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1D54
    lui         $at, 0x8009
    sw          $v0, -0x7964($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1D84
    lui         $at, 0x8009
    sw          $v0, -0x7968($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1DB4
    lui         $a2, 0x8007
    addiu       $a2, $a2, 0x1DE4
    lui         $a1, 0x8007
    addiu       $a1, $a1, 0x1E14
    lui         $a0, 0x8007
    addiu       $a0, $a0, 0x1E44
    lui         $v1, 0x8007
    addiu       $v1, $v1, 0x1E74
    lui         $at, 0x8009
    sw          $v0, -0x796C($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1EA4
    lui         $at, 0x8009
    sw          $v0, -0x7A68($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1ED4
    lui         $at, 0x8009
    sw          $v0, -0x7A6C($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1F04
    lui         $at, 0x8009
    sw          $v0, -0x7A70($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1F34
    lui         $at, 0x8009
    sw          $v0, -0x7A74($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1F64
    lui         $at, 0x8009
    sw          $v0, -0x7A90($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1F94
    lui         $at, 0x8009
    sw          $v0, -0x7A94($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1FC4
    lui         $at, 0x8009
    sw          $v0, -0x7A98($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x1FF4
    lui         $at, 0x8009
    sw          $a2, -0x7988($at)
    lui         $at, 0x8009
    sw          $a1, -0x798C($at)
    lui         $at, 0x8009
    sw          $a0, -0x7990($at)
    lui         $at, 0x8009
    sw          $v1, -0x7994($at)
    lui         $at, 0x8009
    sw          $v0, -0x7A9C($at)
    lui         $at, 0x8009
    sw          $a2, -0x7AB8($at)
    lui         $at, 0x8009
    sw          $a1, -0x7ABC($at)
    lui         $at, 0x8009
    sw          $a0, -0x7AC0($at)
    lui         $at, 0x8009
    sw          $v1, -0x7AC4($at)
    jr          $ra
    nop
.end runtime_command_finalize
