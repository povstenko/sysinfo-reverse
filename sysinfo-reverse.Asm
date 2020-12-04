.386
.model flat,STDCALL
option casemap :none  ;case sensitive

include sysinfo-reverse.inc

.code
Begin:
	call main
	
invoke ExitProcess,NULL


main proc
	
	invoke GetComputerName, addr comp_name, addr comp_name_len
	invoke GetCurrentDirectory, 255, addr cur_dir
	invoke GetSystemDirectory, addr sys_dir, 255

	invoke wsprintf, addr text, addr frmt, addr comp_name, addr cur_dir, addr sys_dir

	invoke MessageBox,NULL, addr text, addr mb_title, MB_ICONQUESTION + MB_OKCANCEL
	cmp eax, IDOK
  	jne exit

  	invoke lstrlen, offset text
  	mov text_len, eax

	shr eax, 1
	mov iters, eax
reverse:
  	mov ecx, iters ; set iterations
  	lea esi, text ; begin pointer
  
  	mov edx, text_len
  	lea edi, text [edx-1] ; end pointer
  
loop1:
  	mov AH, [esi]
  	mov AL, [edi]
  	mov [edi], AH
  	mov [esi], AL
  	inc esi
  	dec edi
  	loop loop1
  
  	invoke MessageBox,NULL, addr text, addr mb_title, MB_ICONQUESTION + MB_OKCANCEL
  	cmp eax, IDOK
  	je reverse

exit:
  	ret

main endp

end Begin