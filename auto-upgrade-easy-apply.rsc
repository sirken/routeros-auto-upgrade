# Easy apply
# Copy/paste via console to add to the router
# Scripts are run every 7 days @ 3:00am and 3:05am

/system scheduler
add interval=1w name="RouterOS Upgrade" on-event=":local emailAddress \"user@\
    domain.com\"\
    \n\
    \n/system package update\
    \ncheck-for-updates once\
    \n:delay 5s;\
    \n\
    \n:local currver [get installed-version]\
    \n:local newver [get latest-version]\
    \n\
    \n:if (\$newver > \$currver) do={\
    \n  :log info (\"[UPGRADE] New RouterOS \".\$newver.\" is available. Sendi\
    ng email...\")\
    \n  /tool e-mail send to=\"\$emailAddress\" subject=(\"[\".[/system identi\
    ty get name].\"] RouterOS Upgrade, reboot 1 of 2\") body=(\"OS: \".\$currv\
    er.\" --> \".\$newver)\
    \n  /system package update install\
    \n}" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/1970 start-time=03:00:00
add interval=1w name="Firmware Upgrade" on-event=":local emailAddress \"user@\
    domain.com\"\
    \n \
    \n:local currver [/system routerboard get current-firmware]\
    \n:local newver [/system package get system version]\
    \n\
    \n:if (\$newver != \$currver) do={\
    \n  :log info (\"[UPGRADE] New RouterOS firmware \".\$newver.\" is availab\
    le. Sending email...\")\
    \n  /tool e-mail send to=\"\$emailAddress\" subject=(\"[\".[/system identi\
    ty get name].\"] Firmware Upgrade, reboot 2 of 2\") body=(\"FW: \".\$currv\
    er.\" --> \".\$newver)\
    \n  /system routerboard upgrade;\
    \n  /system reboot;\
    \n}" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=jan/01/1970 start-time=03:05:00
