.text
.align 2
.set noreorder
.globl render_pipeline_finalize
.ent render_pipeline_finalize
render_pipeline_finalize:
    addiu       $sp, $sp, -0x30
    sw          $s1, 0x14($sp)
    addu        $s1, $zero, $zero
    sw          $s2, 0x18($sp)
    lui         $s2, 0x8009
    addiu       $s2, $s2, -0x4DE8
    sw          $s5, 0x24($sp)
    addiu       $s5, $s2, 0x20
    sw          $s4, 0x20($sp)
    lui         $s4, 0x8009
    addiu       $s4, $s4, -0x63E0
    sw          $s3, 0x1C($sp)
    lui         $s3, 0x8009
    addiu       $s3, $s3, -0x6A98
    sw          $ra, 0x28($sp)
    sw          $s0, 0x10($sp)
    sll         $s0, $s1, 24
.L80013A2C:
    sra         $s0, $s0, 22
    addu        $v0, $s0, $s2
    lw          $a1, 0x0($v0)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    addu        $v0, $s0, $s5
    lw          $a1, 0x0($v0)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    addu        $v0, $s0, $s4
    lw          $a1, 0x0($v0)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    addu        $s0, $s0, $s3
    lw          $a1, 0x0($s0)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    addiu       $v0, $s1, 0x1
    addu        $s1, $v0, $zero
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    slti        $v0, $v0, 0x8
    bnel        $v0, $zero, .L80013A2C
    sll         $s0, $s1, 24
    lui         $a1, 0x8008
    lw          $a1, 0x4FC0($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $a1, 0x8006
    lw          $a1, 0x5568($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $a1, 0x8006
    lw          $a1, 0x5564($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $a1, 0x8008
    lw          $a1, 0x7918($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $a1, 0x8006
    lw          $a1, 0x5540($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $a1, 0x8006
    lw          $a1, 0x553C($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $a1, 0x8006
    lw          $a1, 0x5548($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $a1, 0x8006
    lw          $a1, 0x5544($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $a1, 0x8006
    lw          $a1, 0x5550($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $a1, 0x8006
    lw          $a1, 0x554C($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lw          $ra, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end render_pipeline_finalize
