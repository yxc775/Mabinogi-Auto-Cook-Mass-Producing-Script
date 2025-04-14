# 洛奇MMO自动量化烹饪系统
这是我心血来潮写的自动化烹饪脚本，在声明作者的情况下，欢迎随意使用和转发。
养精灵法师号做苹果酒做的断手了，实在受不了拉就搓了个这个。
此脚本不需要任何特殊执行文件或者CV取色器等框架，是纯靠坐标系记忆自动执行的脚本。
非常轻便方便！

# 使用说明
## 第一步
前往 https://www.autohotkey.com/ 下载AHK v2。
## 第二步
打开游戏后，运行Start.ahk。 批准管理员可用。
## 第三步
进入游戏后按下Ctrl + F1, 启动按钮坐标校正脚本。 依照提示完成取点
## 第四步
按下Ctrl + F2，根据你想烹饪的料理，依照提示生成你的一个 {你选择料理}.ini 的参数文件。
## 第五步
按下Ctrl + F3, 在游戏中烹饪窗口关闭的情况下，输入{生成的脚本文件名}，以及数量。 大功告成！
## 其他
### 之后如果需要再启用自动化，仅需要Ctrl + F3 就可以了。当然如果想添加新的料理的话还是要Ctrl + F2创建新的脚本。
### 将 Setting.ini中的Language=CN 改为 Language=EN 便可使用英文版


# 已知问题
每次启动F3烹饪脚本前需要切线，或退到人物选择单一次，自动化复原键位还是挺麻烦的，所以干脆手动切线得了，之后找机会再解决吧。

# Mabinogi MMO Automatic Cooking System - Now You Can Cook in Bulk! W

This is an automation cooking script I wrote on a whim. You are free to use and share it, provided you credit the author.
This all starts with a story that my hand feel hurting after I manually cook a bunch of apple cidar for my elf mage... so here it go!
This script does not rely on any special exe or pixel scan (like OpenCV, ImageSearch, etc) mechanic. Thus it is very lightweight and convenient to use once you get a hold of it.

# Usage Instructions
## Step 1
Go to https://www.autohotkey.com/ and download AHK v2.
## Step 2
After launching the game, run Start.ahk. Approve administrative privileges.
## Step 3
In-game, press Ctrl + F1 to start the coordinate calibration script. Follow the prompts to complete calibration.
## Step 4
Press Ctrl + F2 and follow the prompts to generate a parameter file named {Dish_Name}.ini based on the dish you want to cook.
## Step 5
Press Ctrl + F3, ensuring the in-game cooking window is closed, enter the generated script file name and the desired quantity. All set!

## Additional Notes
### To reuse the automation later, simply press Ctrl + F3. If you'd like to automate cooking a new dish, create a new script by pressing Ctrl + F2.
### Go into Setting.ini, and replace 'Language=CN' to 'Language=EN' to use English version

# Known Issues
Before starting the cooking automation with F3, you need to switch channels or go back to character selection once. The automation reset of keys is cumbersome, so switching manually for now is simpler. I'll address this issue when possible.

