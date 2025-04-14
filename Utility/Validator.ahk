#Requires AutoHotkey v2.0

ValidateCoordinates(input, &xVar, &yVar) {
    if !RegExMatch(input, "^\s*(-?\d+)\s*[，,\s]\s*(-?\d+)\s*$", &m) {
        MsgBox(ErrorCoordinateWarn, ErrorStr, "OK IconX")
        Reload
    }

    xVar := m[1], yVar := m[2]
}


ValidateLanguages(input) {
    if input != "CN" and  input != "EN" {
        MsgBox("无效语言, Invalid Langugage", "错误 Error", "OK IconX")
        Reload
    }
}