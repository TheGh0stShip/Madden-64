.text
.align 2
.set noreorder
.globl func_800BB990
.ent func_800BB990
func_800BB990:
    lhu         $v0, 0x18($s3)
    sh          $v0, 0x10($sp)
    lhu         $v0, 0x1A($s3)
    sh          $v0, 0x12($sp)
    lhu         $v0, 0x1C($s3)
    sh          $v0, 0x14($sp)
    lw          $v0, 0x8($s3)
    sw          $v0, 0x18($sp)
    lw          $v0, 0xC($s3)
    sw          $v0, 0x1C($sp)
    lw          $v0, 0x10($s3)
    j           func_800B735C
    sw          $v0, 0x20($sp)
.end func_800BB990
