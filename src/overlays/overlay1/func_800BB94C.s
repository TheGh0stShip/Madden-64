.text
.align 2
.set noreorder
.globl func_800BB94C
.ent func_800BB94C
func_800BB94C:
    addu        $s3, $a2, $zero
    lhu         $v0, 0x18($s2)
    sh          $v0, 0x10($sp)
    lhu         $v0, 0x1A($s2)
    sh          $v0, 0x12($sp)
    lhu         $v0, 0x1C($s2)
    sh          $v0, 0x14($sp)
    lw          $v0, 0x8($s2)
    sw          $v0, 0x18($sp)
    lw          $v0, 0xC($s2)
    sw          $v0, 0x1C($sp)
    lw          $v0, 0x10($s2)
    j           func_800B735C
    sw          $v0, 0x20($sp)
.end func_800BB94C
