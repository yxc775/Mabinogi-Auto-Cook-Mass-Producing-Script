#Requires AutoHotkey v2.0

ToolTipCounter(input) {
    global countdown := input
    global startTime := A_TickCount 
    
    SetTimer UpdateToolTip, 100
    
    UpdateToolTip()

    Sleep input * 1000
    
    SetTimer UpdateToolTip, 0
    ToolTip
    
    return
}

UpdateToolTip() {
    global countdown, startTime
    
    elapsed := A_TickCount - startTime
    remaining := Max(0, countdown - (elapsed / 1000))
    
    ToolTip Round(remaining, 1) CounterContent
    
    if (remaining <= 0) {
        SetTimer UpdateToolTip, 0
        ToolTip
    }
}