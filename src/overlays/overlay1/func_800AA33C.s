.text
.align 2
.set noreorder
.globl func_800AA33C
.ent func_800AA33C
func_800AA33C:
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    subu        $v1, $v1, $v0
    sw          $v1, 0x20($s1)
    lw          $v0, 0x20($s1)
    lw          $v1, 0xBC($s1)
    slt         $v0, $v1, $v0
    bnel        $v0, $zero, .L800AA36C
    sw          $v1, 0x20($s1)
.L800AA36C:
    lw          $v0, 0x20($s1)
.end func_800AA33C
