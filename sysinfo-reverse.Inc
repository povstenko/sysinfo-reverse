include WINDOWS.inc

include user32.inc
include kernel32.inc

includelib user32.lib
includelib kernel32.lib

.data
	mb_title db 'ASM Lab1 "Press OK to reverse message text"',0
	text db 1000 dup(0)
	
	comp_name db 100 dup(0)
	comp_name_len dd 100
	cur_dir db 255 dup(0)
	sys_dir db 255 dup(0)
	
	frmt db 'Computer Name: %s',13,10, 'Current Directory: %s',13,10,'System Directory: %s',0
	
	text_len dd ?
  	iters dd ?