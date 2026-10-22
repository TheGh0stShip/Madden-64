.set noreorder
.set noat
.text

.globl boot_entry
.ent boot_entry
boot_entry:
    lui     $sp, 0x803F
    ori     $sp, $sp, 0xFFF0
    jal     boot_load_program
     nop
.end boot_entry
