#Requires AutoHotkey v2.0
#SingleInstance Force
#UseHook 
#Include ..\Utility\DisplayUtil.ahk
#Include ..\Utility\Loader.ahk
CoordMode "Mouse", "Screen"  

SetColorCheckPoint() {
    global colorCheckPointX, colorCheckPointY
    MsgBox(CookFillerQ1, Notice, "Iconi OK T15")

    colorPos := InputBox(CookColorPointQ1 `n`n CookColorPointQ2, Notice, "w300 h150").Value
    ValidateCoordinates(colorPos, &colorCheckPointX, &colorCheckPointY)
    
    Tooltip(ToolTipContent `n ToolTipContent2 colorCheckPointX "," colorCheckPointY, A_ScreenWidth//2, 50)
    SetTimer(() => Tooltip(), -2000)  
}

SetScrollerPos() {
    global startScrollerX, startScrollerY, startTypeScrollerX, startTypeScrollerY
    MyGui := Gui()
    MyGui.Title := ButtonPoint
    MyGui.SetFont("s12", "Microsoft YaHei")

    inputWidth := 150  
    labelWidth := 200    
    topSpacing := 256   
    rowSpacing := 30    
    
    MyGui.Add("Text", "x20 y20 w" labelWidth, CookTypeSlidePoint)
    Input1 := MyGui.Add("Edit", "x+5 yp w" inputWidth)
    
    MyGui.Add("Text", "x+" topSpacing " yp w" labelWidth, CookOptionSlidePoint)
    Input2 := MyGui.Add("Edit", "x+5 yp w" inputWidth)

    MyGui.Add("Text", "x20 y+" rowSpacing " w300 Center", FillInCoordQ)

    MyGui.Add("Button", "w80 x100 y+20 Default", ConfirmStr).OnEvent("Click", Confirm)
    MyGui.Add("Button", "w80 x+10 yp", CancelStr).OnEvent("Click", Cancel)

    MyGui.Show("Center")
    
    Confirm(*) {
        param1 := Input1.Value
        param2 := Input2.Value

        ValidateCoordinates(param1, &startTypeScrollerX, &startTypeScrollerY)
        ValidateCoordinates(param2, &startScrollerX, &startScrollerY)

        SetColorCheckPoint()

        CreateButtonConfigName()
        MyGui.Destroy()
    }

    Cancel(*) {
        MyGui.Destroy()
    }
}

SetButtonPos() {
    global dropDownX, dropDownY, matPutX, matPutY, fill1X, fill1Y, fill2X, fill2Y, fill3X, fill3Y, startCookingX, startCookingY
    MyGui := Gui()
    MyGui.Title :=  ButtonPoint
    MyGui.SetFont("s12", "Microsoft YaHei")

    inputWidth := 150  
    labelWidth := 200    
    topSpacing := 256   
    rowSpacing := 30    
    
    MyGui.Add("Text", "x20 y20 w" labelWidth, AskCookPointerSlide)
    Input1 := MyGui.Add("Edit", "x+5 yp w" inputWidth)
    
    MyGui.Add("Text", "x+" topSpacing " yp w" labelWidth, AutoToolIngredSelect)
    Input2 := MyGui.Add("Edit", "x+5 yp w" inputWidth)

    MyGui.Add("Text", "x20 y+" rowSpacing " w" labelWidth, Fill1)
    Input3 := MyGui.Add("Edit", "x+5 yp w" inputWidth)
    
    MyGui.Add("Text", "x+20 yp w" labelWidth, Fill2)
    Input4 := MyGui.Add("Edit", "x+5 yp w" inputWidth)
    
    MyGui.Add("Text", "x+20 yp w" labelWidth, Fill3)
    Input5 := MyGui.Add("Edit", "x+5 yp w" inputWidth)

    MyGui.Add("Text", "x20 y+" rowSpacing " w" labelWidth, StartCookButton)
    Input6 := MyGui.Add("Edit", "x+5 yp w" inputWidth)

    MyGui.Add("Text", "x20 y+" rowSpacing " w300 Center", FillInCoordQ)

    MyGui.Add("Button", "w80 x100 y+20 Default", ConfirmStr).OnEvent("Click", Confirm)
    MyGui.Add("Button", "w80 x+10 yp", CancelStr).OnEvent("Click", Cancel)

    MyGui.Show("Center")
    
    Confirm(*) {
        param1 := Input1.Value
        param2 := Input2.Value
        param3 := Input3.Value
        param4 := Input4.Value
        param5 := Input5.Value
        param6 := Input6.Value

        ValidateCoordinates(param1, &dropDownX, &dropDownY)
        ValidateCoordinates(param2, &matPutX, &matPutY)
        ValidateCoordinates(param3, &fill1X, &fill1Y)
        ValidateCoordinates(param4, &fill2X, &fill2Y)
        ValidateCoordinates(param5, &fill3X, &fill3Y)
        ValidateCoordinates(param6, &startCookingX, &startCookingY)
        MyGui.Destroy()

        MsgBox(NextStepQ1, Notice, "Iconi OK T15")
        SetScrollerPos()
    }

    Cancel(*) {
        MyGui.Destroy()
    }
}