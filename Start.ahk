#Requires AutoHotkey v2.0
#SingleInstance Force
#UseHook 
#Include Utility\Loader.ahk
#Include Utility\ToolTip.ahk
#Include Utility\DisplayUtil.ahk
#Include Utility\Validator.ahk
#Include Core\AddNewCookingAuto.ahk
#Include Core\GeneralCalibrating.ahk
CoordMode "Mouse", "Screen"  
global buttonConfig

if !A_IsAdmin {
    try {
        Run "*RunAs " (A_IsCompiled ? A_ScriptFullPath : A_AhkPath " " A_ScriptFullPath)
    }
    ExitApp
}

Persistent()
LoadSetting()
InitCoordinateWindow()
CreateAnnouncementWindow()
MsgBox(AddNewCookingLaunchString, Notice, "Iconi OK T15")

$^F3::
{
    selection := InputBox(SelectFile `n`n SelectFileL2, Notice, "w300 h150").Value
    quantity := InputBox(InputCookTimes, Notice, "w300 h150").Value

    LoadItemConfigFile(selection)
    LoadButtonConfig()
        ToolTipCounter(5)

        global isFirstTime := 0

        Loop quantity {
            MouseMove A_ScreenWidth//2, A_ScreenHeight//2, 50
            Sleep 200
            Cook(selection)
        }

        MsgBox(CookComplete, Notice, "Iconi OK T5")
}

$^F2::{
    LoadButtonConfig()
    CheckNeedTwoSlide(CheckIsMix)
    if(noExtraRoll != 1) {
        TypeSelectionCalibrating()
        MsgBox(TypeCoordinateGet, Notice, "Iconi OK T5")
    }

    FoodSelectionCalibrating() 
    IngredientFillerCalibrating()
}

$^F1::{
    MsgBox(PreInfoButtonConfig, Notice, "Iconi OK T15")
    SetButtonPos()
}

Cook(selection) {
    Prepare()
    CookSelect()
    Sleep 200
    IngredientPut()
    StartCooking()
}

Prepare() {
    global startScrollerX, startScrollerY, endX, endY, receipeX, receipeY
    global startTypeScrollerX, startTypeScrollerY, typeEndX, typeEndY, typeX, typeY
    global dropDownX, dropDownY
    global isFirstTime
    SendEvent "{=}"
    Sleep 300

    if(typeEndX != 0 && isFirstTime == 0) {    
        MouseMove(dropDownX, dropDownY)
        Sleep 300
        Click
        Sleep 300

        MouseMove(startTypeScrollerX, startTypeScrollerY, 50)
        Sleep 300
        Click("Down")
        MouseMove(typeEndX, typeEndY, 50)   
        Click("Up")
        Sleep 300

        MouseMove(typeX, typeY, 50)
        Sleep 300
        Click
        Sleep 300

        isFirstTime := isFirstTime + 1
    } 

    if(endX != 0 && isFirstTime == 0) {
        MouseMove(startScrollerX, startScrollerY, 50)
        Sleep 300
        Click("Down")
        MouseMove(endX, endY, 50)   
        Click("Up")
        Sleep 300
    }
}

StartCooking() {
    global startCookingX, startCookingY
    MouseMove(startCookingX, startCookingY, 50)
    Sleep 200
    Click
    Sleep 6000
}


CookSelect() {
    global receipeX, receipeY, matPutX, matPutY
    MouseMove(receipeX, receipeY, 50)
    Sleep 200
    Click
    MouseMove(matPutX, matPutY, 50)
    Sleep 200
    Click
}

IngredientPut() {
    global fill1X, fill1Y, fill2X, fill2Y, fill3X, fill3Y
    global Ig1StopPointX, Ig1StopPointY, Ig2StopPointX, Ig2StopPointY

    if(Ig1StopPointX != 0) {
        IngredientFilling(fill1X, fill1Y, Ig1StopPointX, Ig1StopPointY)
        if(Ig2StopPointX != 0) {
            IngredientFilling(fill2X, fill2Y, Ig2StopPointX, Ig2StopPointY)
            IngredientFilling(fill3X, fill3Y)
            return
        } else {
            IngredientFilling(fill2X, fill2Y)
            return
        }
    } else {
        IngredientFilling(fill1X, fill1Y)
        return
    }
}

checkInterval := 50    
IngredientFilling(x, y, stopx := unset, stopy := unset) {
    global FinishedColor
    global colorCheckPointX, colorCheckPointY
    detectionX := IsSet(stopx) ? stopx : colorCheckPointX
    detectionY := IsSet(stopy) ? stopy : colorCheckPointY
    
    initialColor := PixelGetColor(detectionX, detectionY, "RGB")
    MouseMove(x, y, 50)
    Sleep 200
    Send("{LButton Down}")

    Loop {
        currentColor := PixelGetColor(detectionX, detectionY, "RGB")
        
        if (IsSet(stopx) && IsSet(stopy)) {
            trigger := (currentColor != initialColor)
        } else {
            trigger := (currentColor == FinishedColor)
        }

        if (trigger || !GetKeyState("LButton", "P")) {
            Send("{LButton Up}")
            break
        }
        Sleep checkInterval
    }
}

CheckColor(x, y, expectedColor) {
    capturedColor := PixelGetColor(x, y, "RGB")
    return (capturedColor == expectedColor)
}


Esc::Reload