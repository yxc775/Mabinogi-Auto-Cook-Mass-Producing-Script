#Requires AutoHotkey v2.0
#SingleInstance Force
#UseHook 
#Include ..\Utility\Loader.ahk
#Include ..\Utility\DisplayUtil.ahk
#Include ..\Utility\Validator.ahk
CoordMode "Mouse", "Screen"  

IngredientFillerCalibrating() {
    ShowPercentageSlotInputDialog()
}

ShowPercentageSlotInputDialog() {
    global Ig1StopPointX, Ig1StopPointY, Ig2StopPointX, Ig2StopPointY
    
    MyGui := Gui()
    MyGui.Title := PercentageSlotTitle
    MyGui.SetFont("s12", "Microsoft YaHei")
    
    inputWidth := 150
    labelWidth := 100
    topSpacing := 30
    rowSpacing := 30
    
    MyGui.Add("Text", "x20 y20 w600 Center", ExplainingPercentageInputText `n ExampleExp1 `n ExampleExp2 `n WarningCoordinate)

    
    MyGui.Add("Text", "x20 y+" topSpacing " w" labelWidth, BorderBetweenM1M2)
    Input1 := MyGui.Add("Edit", "x+5 yp w" inputWidth)
    
    MyGui.Add("Text", "x+20 yp w" labelWidth, BorderBetweenM2M3)
    Input2 := MyGui.Add("Edit", "x+5 yp w" inputWidth)
    
    MyGui.Add("Button", "w80 x100 y+" rowSpacing " Default", "确认").OnEvent("Click", Confirm)
    MyGui.Add("Button", "w80 x+10 yp", CancelStr).OnEvent("Click", Cancel)
    
    MyGui.Show("Center")
    
    Confirm(*) {
        param1 := Input1.Value
        param2 := Input2.Value
        
        ValidateCoordinates(param1, &Ig1StopPointX, &Ig1StopPointY)
        ValidateCoordinates(param2, &Ig2StopPointX, &Ig2StopPointY)
        MsgBox(PercentageComplete, Notice, "Iconi OK T5")
        MyGui.Destroy()

        receipeName := InputBox(TaskName, Save, "w300 h150").Value
        CreateSelectConfigName(receipeName)
    }
    
    Cancel(*) {
        MsgBox(PercentageFail, Notice, "Iconi OK T5")
        MyGui.Destroy()
    }
}


TypeSelectionCalibrating() {
    StartTypeInputProcess()
    RewindType()
    StartTypeSlidingExperiment()
    StartTypeInputProcessForCalibrated()
}

StartTypeSlidingExperiment() {
    global dropDownX, dropDownY
    global typeEndX, typeEndY
    global startTypeScrollerX, startTypeScrollerY
    MsgBox(CookingTypeWarn, Notice, "Iconi OK T5")
    Sleep 300

    MouseMove A_ScreenWidth//2, A_ScreenHeight//2, 50
    Sleep 200

    MouseMove(dropDownX, dropDownY, 50)
    Sleep 300

    Click
    Sleep 500 

    MouseMove(startTypeScrollerX, startTypeScrollerY, 50)
    Sleep 300
    Click("Down")
    MouseMove(typeEndX, typeEndY, 50)   
    Click("Up")
    Sleep 300
}

StartTypeInputProcessForCalibrated() {
    global typeX, typeY
    MsgBox(PleaseMoveToOptionType, Notice, "Iconi OK T15")

    typePos := InputBox(PleaseInputOptionType, Notice, "w300 h150").Value
    ValidateCoordinates(typePos, &typeX, &typeY)
    
    Tooltip(ToolTipContent `n`n ToolTipContent2 typeX "," typeY, A_ScreenWidth//2, 50)
    SetTimer(() => Tooltip(), -2000) 
}

RewindType() {
    dlg := Gui("+AlwaysOnTop +ToolWindow", ConfirmStr)
    dlg.BackColor := "FFFFFF"
    dlg.SetFont("s12", FontStr)
    
    dlg.Add("Text", "w300 h120 Center", RewindTypeStr `n RewindTypeStr2)
    
    btnOK := dlg.Add("Button", "w80 Default", ConfirmStr)
    btnOK.OnEvent("Click", ConfirmHandler)
    
    dlg.Show("AutoSize Center")
    WinWaitClose(dlg)
    
    ConfirmHandler(*) {
        dlg.Destroy() 
    }
}

StartTypeInputProcess() {
    global typeEndX, typeEndY
    MsgBox(SlideTypeslider, Notice, "Iconi OK T15")

    endPos := InputBox(PleaseWriteDes, Notice, "w300 h150").Value
    ValidateCoordinates(endPos, &typeEndX, &typeEndY)
    
    Tooltip(ToolTipContent `n`n ToolTipContent2 typeEndX "," typeEndY, A_ScreenWidth//2, 50)
    SetTimer(() => Tooltip(), -2000) 
}


FoodSelectionCalibrating() {
     StartFoodInputProcess()
     Rewind()
     StartFoodSlidingExperiment()
     StartFoodInputProcessForCalibrated()
}

CheckNeedTwoSlide(question) {
    global noExtraRoll
    dlg := Gui("+AlwaysOnTop", ConfrimPlz)
    dlg.SetFont("s12", FontStr)
    
    dlg.Add("Text", "w300 Center", question)
    
    btnYes := dlg.Add("Button", "w80 Default", YesStr)
    btnNo  := dlg.Add("Button", "w80 x+10", NoStr)
    
    btnYes.OnEvent("Click", (*) => (noExtraRoll := 1, dlg.Destroy()))
    btnNo.OnEvent("Click",  (*) => (noExtraRoll := 0, dlg.Destroy()))
    
    dlg.Show("Center")
    WinWaitClose(dlg)
}

Rewind() {
    dlg := Gui("+AlwaysOnTop +ToolWindow", ConfirmStr)
    dlg.BackColor := "FFFFFF"
    dlg.SetFont("s12", FontStr)
    
    dlg.Add("Text", "w300 h100 Center", RewindStr `n RewindStr2)
    
    btnOK := dlg.Add("Button", "w80 Default", ConfirmStr)
    btnOK.OnEvent("Click", ConfirmHandler)
    
    dlg.Show("AutoSize Center")
    WinWaitClose(dlg)
    
    ConfirmHandler(*) {
        dlg.Destroy() 
    }
}

StartFoodInputProcessForCalibrated() {
    global receipeX, receipeY
    MsgBox(PleaseMovetoOption, Notice, "Iconi OK T15")

    receipPos := InputBox(PleaseInputOption, Notice, "w300 h150").Value
    ValidateCoordinates(receipPos, &receipeX, &receipeY)
    
    Tooltip(ToolTipContent `n`n ToolTipContent2 receipeX "," receipeY, A_ScreenWidth//2, 50)
    SetTimer(() => Tooltip(), -2000) 
}

StartFoodSlidingExperiment() {
    global endX, endY
    global startScrollerX, startScrollerY
    MsgBox(CookingWarn, Notice, "Iconi OK T5")
    Sleep 300

    MouseMove A_ScreenWidth//2, A_ScreenHeight//2, 50
    Sleep 200

    MouseMove(startScrollerX, startScrollerY, 50)
    Sleep 300
    Click("Down")
    MouseMove(endX, endY, 50)   
    Click("Up")
    Sleep 300
}

StartFoodInputProcess() {
    global endX, endY
    MsgBox(PleaseMovetoOptionSelect, Notice, "Iconi OK T15")

    endPos := InputBox(PleaseInputOptionSelect, "w300 h150").Value
    ValidateCoordinates(endPos, &endX, &endY)
    
    Tooltip("坐标已保存！`n坐标：" endX "," endY, A_ScreenWidth//2, 50)
    SetTimer(() => Tooltip(), -2000) 
}