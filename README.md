# RouterOS Auto Upgrade Scripts

MikroTik RouterOS scripts to automatically upgrade router software and firmware.

## Features

* Check for RouterOS updates on a schedule
* Upgrade software and firmware automatically
* Send email notifications at each step

## Prerequisites

* Email settings must be enabled and configured on the router.

## Quick Installation

1. Easily apply these scripts by pasting the contents of the `auto-upgrade-easy-apply.rsc` script into a router's console. Two schedules are created that run every 7 days at 3:00am and 3:05am.

2. Edit the email address, date, and time for each schedule either before pasting the script, or afterwards in the router settings.
    ```routeros
    :local emailAddress "user@domain.com"
    start-date=jan/01/1970
    start-time=03:00:00
    interval=1w
    ```

## Manual Installation

1. Edit the scripts and change the email address to where you want to send the notifications.
    ```routeros
    :local emailAddress "user@domain.com"
    ```

2. Add both scripts to the router. I prefer adding them directly to the Scheduler instead of adding separate Scripts in addition to the schedules, but you can do it either way.

3. The `auto-upgrade-ROS.rsc` script must run first.

4. The `auto-upgrade-firmware.rsc` script must run second and allow enough time delay for the first script to finish an upgrade. A 5 minute delay should be enough.
