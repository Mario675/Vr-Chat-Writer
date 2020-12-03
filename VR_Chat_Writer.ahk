#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;---------------------------------------------
;# state your functions

Create_Files_For_New_Users()
{
    {
        ;This should be looped to create multiple different settings. 
        if !FileExist("Settings.ini")
        {
            iniWrite, 0, Settings.ini, Settings, Input_Mode
            TrayTip, Created Settings.ini, VR_Chat_Writer, 3
        }
       
    }

    {
        ;Be sure to check if the file is there just in case. Don't want to delete the character's line by accident. 
        ;Creates Text file for Input_Mode
        if !FileExist("Plaintext.txt")
        {
            LoopNumber := 1
            loop 9
            {
                IniWrite,"", Plaintext.txt, Your_text, Line_%LoopNumber% ;Lines could be detected automatically, but this creates a user friendly shortcut for macro like writing.
                LoopNumber+= 1
            } 
            TrayTip, Created Plaintext.txt, VR_Chat_Writer, 3
        }
        
        /*

        */
        
        ;Debug ;msgbox %Line_1%`, THIS SHOULD BE THE PLAIn EXTFILE
        
    }


    return
}

Input_Mode := null
Modesettings()
{
    ;Mode settings should be used to update the modes in the entire program.
    global Input_Mode ;This makes sure the variable goes outside of this function unto other settings.
    IniRead, Input_Mode, Settings.ini, Settings, Input_Mode

    if Input_Mode = 0
    {
        ;MsgBox, User should be prompted to write in the given Write ini file.
    }

    return
}

What_Line := null
Write(What_Line)
{
    ;msgbox HI FROM WRITELINE


    IniRead, Line_read, Plaintext.txt, Your_text, Line_%What_Line%
    msgbox %Line_read%

    



    return
}

{ ;Live Auto code intructions
    Create_Files_For_New_Users()
    Modesettings()
    ;#IfWinActive, ahk_exe VRChat.exe ;can be disabled for debug purposes.
}


;-----------------------------------------------
;# Shortcuts

!1::
{
    ;msgbox HI FROM HOTKEY
    Write(1)
    return
}






