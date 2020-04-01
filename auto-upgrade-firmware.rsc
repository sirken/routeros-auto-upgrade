# Script to check for and upgrade firmware
# Must be run a few minutes after RouterOS upgrade script, 5m is probably sufficient

:local emailAddress "user@domain.com"

:local currver [/system routerboard get current-firmware]
:local newver [/system package get system version]

:if ($newver != $currver) do={
  :log info ("[UPGRADE] New RouterOS firmware ".$newver." is available. Sending email...")
  /tool e-mail send to="$emailAddress" subject=("[".[/system identity get name]."] Firmware Upgrade, reboot 2 of 2") body=("FW: ".$currver." --> ".$newver)
  /system routerboard upgrade;
  /system reboot;
}
