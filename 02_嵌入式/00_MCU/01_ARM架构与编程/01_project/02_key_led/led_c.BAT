SET PATH=D:\SoftWare\Keil\MDK\ARM\ARMCC\Bin;D:\SoftWare\VMware15\bin\;C:\Program Files (x86)\Python38-32\Scripts\;C:\Program Files (x86)\Python38-32\;c:\program files (x86)\common files\oracle\java\javapath;c:\windows\system32;c:\windows;c:\windows\system32\wbem;c:\windows\system32\windowspowershell\v1.0\;c:\windows\system32\openssh\;d:\software\openocd\bin;d:\software\git\git\cmd;d:\software\mingw\bin;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;D:\SoftWare\xampp\php;D:\SoftWare\Git\Git\cmd;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files\dotnet\;C:\Users\HXIN\AppData\Local\Programs\Python\Python37-32\Scripts\;C:\Users\HXIN\AppData\Local\Programs\Python\Python37-32\;C:\Users\HXIN\AppData\Local\Microsoft\WindowsApps;D:\SoftWare\BandZip\;D:\SoftWare\OpenOCD\bin;D:\SoftWare\VSCODE\Microsoft VS Code\bin;C:\Users\HXIN\AppData\Local\GitHubDesktop\bin;D:\SoftWare\CLion\CLion 2024.1.1\bin;
SET ARMCC5_ASMOPT=--diag_suppress=9931
SET ARMCC5_CCOPT=--diag_suppress=9931
SET ARMCC5_LINKOPT=--diag_suppress=9931
SET CPU_TYPE=STM32F103ZE
SET CPU_VENDOR=STMicroelectronics
SET UV2_TARGET=led_c
SET CPU_CLOCK=0x00B71B00
"D:\SoftWare\Keil\MDK\ARM\ARMCC\Bin\ArmCC" --Via ".\objects\main.__i"
"D:\SoftWare\Keil\MDK\ARM\ARMCC\Bin\ArmAsm" --Via ".\objects\start._ia"
"D:\SoftWare\Keil\MDK\ARM\ARMCC\Bin\ArmLink" --Via ".\Objects\led_c.lnp"
fromelf  --bin  --output=led.bin  Objects\led_c.axf
fromelf  --text  -a -c  --output=led.dis  Objects\led_c.axf
