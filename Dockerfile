# استخدام صورة Windows Server Core
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# تثبيت Remote Desktop
RUN powershell -Command \
    Install-WindowsFeature -Name Remote-Desktop-Services && \
    Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0 && \
    Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# تعيين كلمة مرور للمستخدم Administrator
RUN powershell -Command \
    net user Administrator "P@ssw0rd!" /add && \
    net user Administrator /active:yes

# فتح منفذ RDP
EXPOSE 3389

# تشغيل الخدمة
CMD ["cmd.exe"]
