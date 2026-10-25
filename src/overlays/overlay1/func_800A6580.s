.text
.align 2
.set noreorder
.globl func_800A6580
.ent func_800A6580
func_800A6580:
    lw          $v0, 0x14($s1)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($s1)
    addiu       $v0, $zero, 0x2
.end func_800A6580
