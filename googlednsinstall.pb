DeleteFile("/etc/resolv.conf")
OpenFile(0,"/etc/resolv.conf")
WriteString(0,"nameserver 8.8.8.8"+Chr(13)+Chr(10))
WriteString(0,"nameserver 8.8.4.4"+Chr(13)+Chr(10))
CloseFile(0)
; IDE Options = PureBasic 5.62 (Linux - x64)
; CursorPosition = 3
; EnableXP
; Executable = ../../googlednsinstall