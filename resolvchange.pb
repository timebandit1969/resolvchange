Procedure dabit(backup.s)
  DeleteFile("/etc/convresolv.conf")
  ReadFile(0,"/etc/resolv.conf")
  CreateFile(1,"/etc/convresolv.conf")
  Repeat
    a$=ReadString(0)
    clifford=0
    If FindString(LCase(a$),"search") Or FindString(a$," 127.")
      ; do nothing
      clifford=1
    EndIf
    
    If clifford=0  
      WriteString(1,a$+Chr(13)+Chr(10))
    EndIf
    
    Until Eof(0)
    CloseFile(1)
    CloseFile(0)
    CopyFile("/etc/convresolv.conf","/etc/resolv.conf")
    
  ReadFile(0,backup.s)
  OpenFile(1,"/etc/resolv.conf",#PB_File_Append)
  ;FileSeek(1,Lof(1))
 ; WriteString(1,Chr(13))
  
  Repeat
    a$=ReadString(0)
    If FindString(a$,"nameserver")<>0 And FindString(a$,"127.")=0 
      WriteString(1,a$+Chr(13)+Chr(10))
    EndIf
    
  Until Eof(0)
  ;WriteString(1,"#*+*"+Chr(13))
  
  CloseFile(1)
  CloseFile(0)
EndProcedure


EnableGraphicalConsole(1)
OpenConsole("Corey's PotSmoke Results of fixing computer problems")
Print("Coreys Smokin Up systemd/dnsmasq/network-manager"+Chr(13)+Chr(10)+"fake DNS problem in linux work around V 2.0 for OpenVPN/IPSEC"+Chr(13)+Chr(10))
Print("Current DNS backed up.....STart this program with proper DNS"+Chr(13)+Chr(10))
Print("Current DNS setup is as follows:"+Chr(13)+Chr(10))

ReadFile(3,"/etc/resolv.conf")
Repeat
  Print(ReadString(3)+Chr(13)+Chr(10))
Until Eof(3)
CloseFile(3)

;Print("Press Ctrl-C to close console program here."+Chr(13)+Chr(10))
Global a.s
Global result.q
Global tmes.l
result.q=Date()+10
RandomSeed(Date())
CopyFile("/etc/resolv.conf","/etc/resolv.conf.cbak2")

Repeat
  If Date()>result.q
    result.q=Date()+7;'Random(49,33)
  ;   DeleteFile("/etc/resolv.conf.cbak")
 ; CopyFile("/etc/resolv.conf","/etc/resolv.conf.cbak")
 ;  CopyFile("/etc/resolv.conf","/etc/resolv.conf.cbak2")
  ReadFile(0,"/etc/resolv.conf")
  If changed<>3
    changed=0
  EndIf
  
  ;changed2=0
  Repeat
    a.s=ReadString(0)
    If FindString(a.s," 127.")<>0 Or FindString(LCase(a.s),"search")<>0;And FindString(UCase(a.s),"NAMESERVER")<>0
  ;    DeleteFile("/etc/resolv.conf")
      changed=1
    EndIf
   ; If FindString(a.s,"#*+*")<>0 
   ;   changed2=1
   ; EndIf
    
  Until Eof(0)
  CloseFile(0)
  ;If changed2=1
  ;  changed=0
  ;EndIf
 ; If changed=3
  If changed=1
    tmes.l+1
  Print("We just Caught Linux Changing DNS which is now being restored."+Chr(13)+Chr(10))  
  changed=3
 ; DeleteFile("/etc/resolv.conf")
  cnt2+1
 ; If cnt2>1
  ;    Print("Now this is fscreweed, trying other backup of DNS...."+Chr(13)+Chr(10))  
         ; CopyFile("/etc/resolv.conf.cbak2","/etc/resolv.conf")
      dabit("/etc/resolv.conf.cbak2")
      
      ;RunProgram("bash","cat /etc/resolv.conf.cbak2 >> /etc/resolv.conf","",#PB_Program_Wait)
  ;;    cnt2=0
   ; Else
      ;      RunProgram("bash","cat /etc/resolv.conf.cbak >> /etc/resolv.conf","",#PB_Program_Wait)
    ;  dabit("/etc/resolv.conf.cbak")
      
      ;    CopyFile("/etc/resolv.conf.cbak","/etc/resolv.conf")
       ; EndIf
      Else
        If changed=3
          changed=0
          Print("DNS seemingly back to normal...."+Chr(13)+Chr(10))
          Print("Current DNS setup is as follows:"+Chr(13)+Chr(10))

ReadFile(3,"/etc/resolv.conf")
Repeat
  Print(ReadString(3)+Chr(13)+Chr(10))
Until Eof(3)
CloseFile(3)
        EndIf
        
      cnt2=0
       ; CopyFile("/etc/resolv.conf","/etc/resolv.conf.cbak")
       ; Print("Backing up current DNS ....."+Chr(13)+Chr(10)+"This is done each time Linux didn't bugger with DNS,"+Chr(13)+Chr(10)+"so normal DNS change can be made (OpenVPN/Ipsec off-ISP DNS, on-Resolvconf DNS)"+Chr(13)+Chr(10))        
        Print("Press Ctrl-C to close console program here."+Chr(13)+Chr(10))
                Print("We caught Linux screwing up DNS and fixed it "+Str(tmes.l)+" times..."+Chr(13)+Chr(10))
      EndIf
      cnt+1
      Print(Str(cnt)+Chr(13)+Chr(10))
      If cnt>9999
        cnt=0
      EndIf
EndIf
ForEver
; IDE Options = PureBasic 5.62 (Linux - x64)
; ExecutableFormat = Console
; CursorPosition = 111
; FirstLine = 89
; Folding = -
; EnableXP
; Executable = ../resolvchange