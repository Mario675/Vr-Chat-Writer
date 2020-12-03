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
    ;This should be used to prompt user of what option on startup. 
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
    global Input_Mode
    ;msgbox HI FROM WRITELINE
    

    switch Input_Mode
    {
        case 0:
        {
            
            ;Step 1, read the characters separately.
            IniRead, Line_read, Plaintext.txt, Your_text, Line_%What_Line%

            Length_of_line := StrLen(Line_read)
            msgbox %Length_of_line% = This is the Length_of_line

            ;Step 2, translate letters in a text file, over to movements in a mouse.
            Line_Count = 1
            Loop, %Length_of_line%
            {
                ;MsgBox, % SubStr(Line_read, Line_Count, 1) ;Debug 

                

                Line_Count += 1

            }
            


            

            return
        }

        case 1:
        {
            Msgbox mode 1 is not implemented yet. 
            ExitApp
        }
        

        case 2:
        {
            Msgbox mode 2 is not implemented yet. 
            exitapp
        }

        Msgbox Input_Mode Over 2
        exitapp
    }







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






