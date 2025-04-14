#Requires AutoHotkey v2.0

InitCoordinateWindow() {
    global MyGui, CoordText
    global MouseCoordinateTracker, FontStr

    MyGui := Gui("+AlwaysOnTop -Caption", MouseCoordinateTracker)
    MyGui.BackColor := "EEEEEE"
    MyGui.SetFont("s12", FontStr)
    CoordText := MyGui.Add("Text", "w200 h80 Center", "X: 0`nY: 0`n颜色: #000000")
    MyGui.Show("x0 y0 AutoSize")
    SetTimer(UpdateCoordinates, 50)
    
    UpdateCoordinates() {
        global MyGui, CoordText
        MouseGetPos(&x, &y)
        try {
            color := PixelGetColor(x, y)
            colorCode := SubStr(color, 3) 
        } catch {
            colorCode := "N/A"
        }
        CoordText.Value := "X: " x " Y: " y " `n" CoordinateDisplay " " colorCode
    }
}

CreateAnnouncementWindow() {
    global AnnounceGui, AnnounceText
    global FontStr
    
    fullText := StatementL1 "`n" StatementL2 "`n" StatementL3 "`n" 
              . ManualCF1Str "`n" ManualCF2Str "`n" ManualCF3Str
    
    AnnounceGui := Gui("+AlwaysOnTop -Caption +ToolWindow")
    AnnounceGui.BackColor := "EEEEEE"
    AnnounceGui.SetFont("s12", FontStr)
    
    textWidth := GetTextWidth(fullText, FontStr)
    maxWidth := textWidth + 25

    AnnounceText := AnnounceGui.Add("Text", "w" maxWidth " Left +Wrap", fullText)
    
    lineCount := StrSplit(fullText, "`n").Length
    winHeight := lineCount * 28 + 25
    
    AnnounceGui.Show("x" (A_ScreenWidth - maxWidth) " y0 w" maxWidth " h" winHeight)
    
    GetTextWidth(text, font) {
        tempGui := Gui()
        tempGui.SetFont("s12", font)
        ctl := tempGui.Add("Text",, text)
        tempGui.Show("Hide")
        ctl.GetPos(,, &width)
        tempGui.Destroy()
        return width
    }
}