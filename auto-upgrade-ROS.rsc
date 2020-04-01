# Script to check for and upgrade RouterOS software
# Must be run a few minutes before Firmware script, 5m is probably sufficient

:local emailAddress "user@domain.com"

/system package update
check-for-updates once
:delay 5s;

:local currver [get installed-version]
:local newver [get latest-version]

:if ($newver > $currver) do={
  :log info ("[UPGRADE] New RouterOS ".$newver." is available. Sending email...")
  /tool e-mail send to="$emailAddress" subject=("[".[/system identity get name]."] RouterOS Upgrade, reboot 1 of 2") body=("OS: ".$currver." --> ".$newver)
  /system package update install
}
