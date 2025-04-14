#Requires AutoHotkey v2.0
#Include DisplayUtil.ahk
#Include Validator.ahk

global buttonConfig := "buttonConfig.ini"

LoadSetting() {
    global MenuPath 
    global ButtonPath
    global LanguagePath
    global FinishedColor
    configFile := A_ScriptDir "\Setting.ini"
    
    MenuPath := IniRead("Setting.ini", "Paths", "FoodConfigs", "ERROR")
    ButtonPath := IniRead("Setting.ini", "Paths", "ButtonConfig", "ERROR")
    LanguagePath := IniRead("Setting.ini", "Paths", "LanguagesConfig", "ERROR")

    FinishedColor := IniRead("Setting.ini", "Colors", "FinishedColor", "ERROR")
    Language := IniRead("Setting.ini", "Languages", "Language", "ERROR")
    ValidateLanguages(Language)
    LoadLanguages(Language)

    if(MenuPath = "ERROR") {
        MsgBox FailLoadFoodMenu configFile
    }

    if(ButtonPath = "ERROR") {
        MsgBox FailLoadButton configFile
    }

    if(FinishedColor = "ERROR") {
        MsgBox FailLoadColor configFile
    }

    if(LanguagePath = "ERROR") {
        MsgBox FailLoadLanguageFile configFile
    }

    if (!DirExist(MenuPath)) {
        DirCreate(MenuPath)
    } 

    if (!DirExist(ButtonPath)) {
        DirCreate(ButtonPath)
    }

    if (!DirExist(LanguagePath)) {
        DirCreate(LanguagePath)
    } 
}

LoadLanguages(Language) {
    if(Language = "CN") {
        LoadLanguageFile("CN.ini")
    } else if(Language = "EN") {
        LoadLanguageFile("EN.ini")
    }
}

LoadLanguageFile(filename) {
    global LanguagePath
    global AddNewCookingLaunchString, CheckIsMix, TypeCoordinateGet, Notice, PercentageSlotTitle, ExplainingPercentageInputText
    global ExampleExp1, ExampleExp2, WarningCoordinate, ErrorCoordinateWarn
    global BorderBetweenM1M2, BorderBetweenM2M3, CancelStr, PercentageComplete, PercentageFail, TaskName
    global Save, CookingTypeWarn, CookingWarn, PleaseMoveToOptionType, PleaseInputOptionType, PleaseMovetoOption
    global PleaseMovetoOptionSelect, PleaseInputOption, PleaseInputOptionSelect, ToolTipContent, ToolTipContent2, ToolTipComplete, ToolTipItemComplete
    global ConfirmStr, ConfrimPlz, FontStr, RewindTypeStr, RewindTypeStr2, RewindStr, RewindStr2, SlideTypeslider
    global PleaseWriteDes, YesStr, NoStr, CalibratingDone, ErrorStr, CalibratingFail
    global FailLoadFoodMenu, FailLoadButton, FailLoadColor, FailLoadLanguageFile
    global MouseCoordinateTracker, CoordinateDisplay, CounterContent
    global StatementL1, StatementL2, StatementL3, ManualCF1Str, ManualCF2Str, ManualCF3Str
    global CounterContent, ErrorCoordinateWarn, CookFillerQ1, CookColorPointQ1
    global CookColorPointQ2, ButtonPoint, CookTypeSlidePoint, CookOptionSlidePoint
    global FillInCoordQ, AskCookPointerSlide, AutoToolIngredSelect, Fill1
    global Fill2, Fill3, StartCookButton, NextStepQ1, SelectFile
    global SelectFileL2, InputCookTimes, CookComplete, PreInfoButtonConfig
   
    configLanguageFile := LanguagePath "\" filename

    try{
        AddNewCookingLaunchString := IniRead(configLanguageFile, "Text", "AddNewCookingLaunchString")
        CheckIsMix := IniRead(configLanguageFile, "Text", "CheckIsMix")
        TypeCoordinateGet := IniRead(configLanguageFile, "Text", "TypeCoordinateGet")
        Notice := IniRead(configLanguageFile, "Text", "Notice")
        PercentageSlotTitle := IniRead(configLanguageFile, "Text", "PercentageSlotTitle")

        ExplainingPercentageInputText := IniRead(configLanguageFile, "Text", "ExplainingPercentageInputText")
        ExampleExp1 := IniRead(configLanguageFile, "Text", "ExampleExp1")
        ExampleExp2 := IniRead(configLanguageFile, "Text", "ExampleExp2")
        WarningCoordinate := IniRead(configLanguageFile, "Text", "WarningCoordinate")
        ErrorCoordinateWarn := IniRead(configLanguageFile, "Text", "ErrorCoordinateWarn")

        BorderBetweenM1M2 := IniRead(configLanguageFile, "Text", "BorderBetweenM1M2")
        BorderBetweenM2M3 := IniRead(configLanguageFile, "Text", "BorderBetweenM2M3")
        CancelStr := IniRead(configLanguageFile, "Text", "CancelStr")
        PercentageComplete := IniRead(configLanguageFile, "Text", "PercentageComplete")
        PercentageFail := IniRead(configLanguageFile, "Text", "PercentageFail")
        TaskName := IniRead(configLanguageFile, "Text", "TaskName")

        Save := IniRead(configLanguageFile, "Text", "Save")
        CookingTypeWarn := IniRead(configLanguageFile, "Text", "CookingTypeWarn")
        CookingWarn := IniRead(configLanguageFile, "Text", "CookingWarn")
        PleaseMoveToOptionType := IniRead(configLanguageFile, "Text", "PleaseMoveToOptionType")
        PleaseInputOptionType := IniRead(configLanguageFile, "Text", "PleaseInputOptionType")
        PleaseMovetoOption := IniRead(configLanguageFile, "Text", "PleaseMovetoOption")

        PleaseMovetoOptionSelect := IniRead(configLanguageFile, "Text", "PleaseMovetoOptionSelect")
        PleaseInputOption := IniRead(configLanguageFile, "Text", "PleaseInputOption")
        PleaseInputOptionSelect := IniRead(configLanguageFile, "Text", "PleaseInputOptionSelect")
        ToolTipContent := IniRead(configLanguageFile, "Text", "ToolTipContent")
        ToolTipContent2 := IniRead(configLanguageFile, "Text", "ToolTipContent2")
        ToolTipComplete := IniRead(configLanguageFile, "Text", "ToolTipComplete")
        ToolTipItemComplete := IniRead(configLanguageFile, "Text", "ToolTipItemComplete")

        ConfirmStr := IniRead(configLanguageFile, "Text", "ConfirmStr")
        ConfrimPlz := IniRead(configLanguageFile, "Text", "ConfrimPlz")
        FontStr := IniRead(configLanguageFile, "Text", "FontStr")
        RewindTypeStr := IniRead(configLanguageFile, "Text", "RewindTypeStr")
        RewindTypeStr2 := IniRead(configLanguageFile, "Text", "RewindTypeStr2")
        RewindStr := IniRead(configLanguageFile, "Text", "RewindStr")
        RewindStr2 := IniRead(configLanguageFile, "Text", "RewindStr2")
        SlideTypeslider := IniRead(configLanguageFile, "Text", "SlideTypeslider")

        PleaseWriteDes := IniRead(configLanguageFile, "Text", "PleaseWriteDes")
        YesStr := IniRead(configLanguageFile, "Text", "YesStr")
        NoStr := IniRead(configLanguageFile, "Text", "NoStr")
        CalibratingDone := IniRead(configLanguageFile, "Text", "CalibratingDone")
        ErrorStr := IniRead(configLanguageFile, "Text", "ErrorStr")
        CalibratingFail := IniRead(configLanguageFile, "Text", "CalibratingFail")

        FailLoadFoodMenu := IniRead(configLanguageFile, "Text", "FailLoadFoodMenu")
        FailLoadButton := IniRead(configLanguageFile, "Text", "FailLoadButton")
        FailLoadColor := IniRead(configLanguageFile, "Text", "FailLoadColor")
        FailLoadLanguageFile := IniRead(configLanguageFile, "Text", "FailLoadLanguageFile")
        MouseCoordinateTracker := IniRead(configLanguageFile, "Text", "MouseCoordinateTracker")
        CoordinateDisplay := IniRead(configLanguageFile, "Text", "CoordinateDisplay")

        StatementL1 := IniRead(configLanguageFile, "Text", "StatementL1")
        StatementL2 := IniRead(configLanguageFile, "Text", "StatementL2")
        StatementL3 := IniRead(configLanguageFile, "Text", "StatementL3")
        ManualCF1Str := IniRead(configLanguageFile, "Text", "ManualCF1Str")
        ManualCF2Str := IniRead(configLanguageFile, "Text", "ManualCF2Str")
        ManualCF3Str := IniRead(configLanguageFile, "Text", "ManualCF3Str")

        CounterContent := IniRead(configLanguageFile, "Text", "CounterContent")
        ErrorCoordinateWarn := IniRead(configLanguageFile, "Text", "ErrorCoordinateWarn")
        CookFillerQ1 := IniRead(configLanguageFile, "Text", "CookFillerQ1")
        CookColorPointQ1 := IniRead(configLanguageFile, "Text", "CookColorPointQ1")
        CookColorPointQ2 := IniRead(configLanguageFile, "Text", "CookColorPointQ2")
        ButtonPoint := IniRead(configLanguageFile, "Text", "ButtonPoint")
        CookTypeSlidePoint := IniRead(configLanguageFile, "Text", "CookTypeSlidePoint")
        CookOptionSlidePoint := IniRead(configLanguageFile, "Text", "CookOptionSlidePoint")
        FillInCoordQ := IniRead(configLanguageFile, "Text", "FillInCoordQ")
        AskCookPointerSlide := IniRead(configLanguageFile, "Text", "AskCookPointerSlide")
        AutoToolIngredSelect := IniRead(configLanguageFile, "Text", "AutoToolIngredSelect")
        Fill1 := IniRead(configLanguageFile, "Text", "Fill1")
        Fill2 := IniRead(configLanguageFile, "Text", "Fill2")
        Fill3 := IniRead(configLanguageFile, "Text", "Fill3")
        StartCookButton := IniRead(configLanguageFile, "Text", "StartCookButton")
        NextStepQ1 := IniRead(configLanguageFile, "Text", "NextStepQ1")
        SelectFile := IniRead(configLanguageFile, "Text", "SelectFile")
        SelectFileL2 := IniRead(configLanguageFile, "Text", "SelectFileL2")
        InputCookTimes := IniRead(configLanguageFile, "Text", "InputCookTimes")
        CookComplete := IniRead(configLanguageFile, "Text", "CookComplete")
        PreInfoButtonConfig := IniRead(configLanguageFile, "Text", "PreInfoButtonConfig")
        
        Tooltip(ToolTipComplete)
        SetTimer(() => Tooltip(), -1500)
        return true
     } catch as err {
        MsgBox "(Error Type: " err.What "Code: " err.Extra "Detail: " err.Message " LineNum: " err.Line " )"
        ExitApp
    }
    return false
}

LoadButtonConfig() {
    global dropDownX, dropDownY, matPutX, matPutY, fill1X, fill1Y, fill2X, fill2Y, fill3X, fill3Y, startCookingX, startCookingY
    global startScrollerX, startScrollerY, startTypeScrollerX, startTypeScrollerY
    global colorCheckPointX, colorCheckPointY
    configButtonFile := ButtonPath "\" buttonConfig

    try {
        dropDownX := IniRead(configButtonFile, "Coordinates", "dropDownX")
        dropDownY := IniRead(configButtonFile, "Coordinates", "dropDownY")
        matPutX := IniRead(configButtonFile, "Coordinates", "matPutX")
        matPutY := IniRead(configButtonFile, "Coordinates", "matPutY")
        fill1X := IniRead(configButtonFile, "Coordinates", "fill1X")
        fill1Y := IniRead(configButtonFile, "Coordinates", "fill1Y")
        fill2X := IniRead(configButtonFile, "Coordinates", "fill2X")
        fill2Y := IniRead(configButtonFile, "Coordinates", "fill2Y")
        fill3X := IniRead(configButtonFile, "Coordinates", "fill3X")
        fill3Y := IniRead(configButtonFile, "Coordinates", "fill3Y")
        startCookingX := IniRead(configButtonFile, "Coordinates", "startCookingX")
        startCookingY := IniRead(configButtonFile, "Coordinates", "startCookingY")
        startScrollerX := IniRead(configButtonFile, "Coordinates", "startScrollerX ")
        startScrollerY := IniRead(configButtonFile, "Coordinates", "startScrollerY")
        startTypeScrollerX := IniRead(configButtonFile, "Coordinates", "startTypeScrollerX")
        startTypeScrollerY := IniRead(configButtonFile, "Coordinates", "startTypeScrollerY")
        colorCheckPointX := IniRead(configButtonFile, "Coordinates", "colorCheckPointX")
        colorCheckPointY := IniRead(configButtonFile, "Coordinates", "colorCheckPointY")

        if !ValidateCoordinates(dropDownX "," dropDownY, &vx, &vy)
            return false
        if !ValidateCoordinates(matPutX "," matPutY, &vx, &vy)
            return false
        if !ValidateCoordinates(fill1X "," fill1Y, &vx, &vy)
            return false
        if !ValidateCoordinates(fill2X "," fill2Y, &vx, &vy)
            return false
        if !ValidateCoordinates(fill3X "," fill3Y, &vx, &vy)
            return false
        if !ValidateCoordinates(startCookingX "," startCookingY, &vx, &vy)
            return false
        if !ValidateCoordinates(startScrollerX "," startScrollerY, &vx, &vy)
            return false
        if !ValidateCoordinates(startTypeScrollerX "," startTypeScrollerY, &vx, &vy)
            return false
        if !ValidateCoordinates(colorCheckPointX "," colorCheckPointY, &vx, &vy)
            return false

        Tooltip(ToolTipComplete)
        SetTimer(() => Tooltip(), -1500)
        return true
     } catch as err {
        MsgBox "(Error Type: " err.What "Code: " err.Extra "Detail: " err.Message " LineNum: " err.Line " )"
        ExitApp
    }
    return false
}

LoadItemConfigFile(input) {
    global typeEndX, typeEndY, endX, endY, receipeX, receipeY, typeX, typeY, Ig1StopPointX, Ig1StopPointY, Ig2StopPointX, Ig2StopPointY

    configSelectFile := MenuPath "\" input ".ini"

    try {
        endX := IniRead(configSelectFile, "Coordinates", "endX")
        endY := IniRead(configSelectFile, "Coordinates", "endY")
        receipeX := IniRead(configSelectFile, "Coordinates", "receipeX")
        receipeY := IniRead(configSelectFile, "Coordinates", "receipeY")
        typeEndX := IniRead(configSelectFile, "Coordinates", "typeEndX")
        typeEndY := IniRead(configSelectFile, "Coordinates", "typeEndY")
        typeX := IniRead(configSelectFile, "Coordinates", "typeX")
        typeY := IniRead(configSelectFile, "Coordinates", "typeY")
        Ig1StopPointX := IniRead(configSelectFile, "Coordinates", "Ig1StopPointX")
        Ig1StopPointY := IniRead(configSelectFile, "Coordinates", "Ig1StopPointY")
        Ig2StopPointX := IniRead(configSelectFile, "Coordinates", "Ig2StopPointX")
        Ig2StopPointY := IniRead(configSelectFile, "Coordinates", "Ig2StopPointY")

        if !ValidateCoordinates(endX "," endY, &vx, &vy)
            return false
        if !ValidateCoordinates(receipeX "," receipeY, &vx, &vy)
            return false
        if !ValidateCoordinates(typeEndX "," typeEndY, &vx, &vy)
            return false
        if !ValidateCoordinates(typeX "," typeY, &vx, &vy)
            return false
        if !ValidateCoordinates(Ig1StopPointX "," Ig1StopPointY, &vx, &vy)
            return false
        if !ValidateCoordinates(Ig2StopPointX "," Ig2StopPointY, &vx, &vy)
            return false

        Tooltip(ToolTipItemComplete)
        SetTimer(() => Tooltip(), -1500)
        return true
    } catch as err{
        MsgBox "(Error Type: " err.What "Code: " err.Extra "Detail: " err.Message " LineNum: " err.Line " )"
        ExitApp
    }
    return false
}

CreateSelectConfigName(receipeName) {
    configFile := MenuPath "\" receipeName ".ini"
    SaveSelectionConfig(configFile)
}

CreateButtonConfigName() {
    configFile := ButtonPath "\" buttonConfig
    SaveButtonConfig(configFile)
}

SaveSelectionConfig(targetConfig) {
    global endX    := endX    ?? 0
    global endY    := endY    ?? 0
    global receipeX := receipeX ?? 0
    global receipeY := receipeY ?? 0
    global typeEndX := typeEndX ?? 0
    global typeEndY := typeEndY ?? 0
    global typeX := typeX ?? 0
    global typeY := typeY ?? 0
    global Ig1StopPointX := Ig1StopPointX ?? 0
    global Ig1StopPointY := Ig1StopPointY ?? 0
    global Ig2StopPointX := Ig2StopPointX ?? 0
    global Ig2StopPointY := Ig2stopPointY ?? 0

    try {
        IniWrite(endX, targetConfig, "Coordinates", "endX")
        IniWrite(endY, targetConfig, "Coordinates", "endY")
        IniWrite(receipeX, targetConfig, "Coordinates", "receipeX")
        IniWrite(receipeY, targetConfig, "Coordinates", "receipeY")
        IniWrite(typeEndX, targetConfig, "Coordinates", "typeEndX")
        IniWrite(typeEndY, targetConfig, "Coordinates", "typeEndY")
        IniWrite(typeX, targetConfig, "Coordinates", "typeX")
        IniWrite(typeY, targetConfig, "Coordinates", "typeY")
        IniWrite(Ig1StopPointX, targetConfig, "Coordinates", "Ig1StopPointX")
        IniWrite(Ig1StopPointY, targetConfig, "Coordinates", "Ig1StopPointY")
        IniWrite(Ig2StopPointX, targetConfig, "Coordinates", "Ig2StopPointX")
        IniWrite(Ig2StopPointY, targetConfig, "Coordinates", "Ig2StopPointY")

        MsgBox(CalibratingDone, Notice, "Iconi OK T15")
    } catch {
        MsgBox(CalibratingFail, ErrorStr, "OK Icon!")
    }
}

SaveButtonConfig(targetConfig) {
    global dropDownX := dropDownX ?? 0
    global dropDownY := dropDownY ?? 0
    global matPutX := matPutX ?? 0
    global matPutY := matPutY ?? 0
    global fill1X := fill1X ?? 0
    global fill1Y := fill1Y ?? 0
    global fill2X := fill2X ?? 0
    global fill2Y := fill2Y ?? 0
    global fill3X := fill3X ?? 0
    global fill3Y := fill3Y ?? 0
    global startCookingX := startCookingX ?? 0
    global startCookingY := startCookingY ?? 0
    global startTypeScrollerX := startTypeScrollerX ?? 0
    global startTypeScrollerY := startTypeScrollerY ?? 0
    global startScrollerX := startScrollerX ?? 0
    global startScrollerY := startScrollerY ?? 0
    global colorCheckPointX := colorCheckPointX ?? 0
    global colorCheckPointY := colorCheckPointY ?? 0

    try {
        IniWrite(dropDownX, targetConfig, "Coordinates", "dropDownX")
        IniWrite(dropDownY, targetConfig, "Coordinates", "dropDownY")
        IniWrite(matPutX, targetConfig, "Coordinates", "matPutX")
        IniWrite(matPutY, targetConfig, "Coordinates", "matPutY")
        IniWrite(fill1X, targetConfig, "Coordinates", "fill1X")
        IniWrite(fill1Y, targetConfig, "Coordinates", "fill1Y")
        IniWrite(fill2X, targetConfig, "Coordinates", "fill2X")
        IniWrite(fill2Y, targetConfig, "Coordinates", "fill2Y")
        IniWrite(fill3X, targetConfig, "Coordinates", "fill3X")
        IniWrite(fill3Y, targetConfig, "Coordinates", "fill3Y")
        IniWrite(startCookingX, targetConfig, "Coordinates", "startCookingX")
        IniWrite(startCookingY, targetConfig, "Coordinates", "startCookingY")
        IniWrite(startTypeScrollerX, targetConfig, "Coordinates", "startTypeScrollerX")
        IniWrite(startTypeScrollerY, targetConfig, "Coordinates", "startTypeScrollerY")
        IniWrite(startScrollerX, targetConfig, "Coordinates", "startScrollerX")
        IniWrite(startScrollerY, targetConfig, "Coordinates", "startScrollerY")
        IniWrite(colorCheckPointX, targetConfig, "Coordinates", "colorCheckPointX")
        IniWrite(colorCheckPointY, targetConfig, "Coordinates", "colorCheckPointY")

        MsgBox(CalibratingDone, Notice, "Iconi OK T15")
    } catch {
        MsgBox(CalibratingFail, ErrorStr, "OK Icon!")
    }
}
