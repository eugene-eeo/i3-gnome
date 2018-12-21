# hwm-gnome

Allows you to use herbstluftwm with GNOME 3 Session infrastructure.

## Requirements

 * herbstluftwm
 * GNOME (3.30.x)
 * GDM (optional, but useful)
 * [GNOME Flashback](https://github.com/jcstr/i3-gnome/wiki/Tips-&-Tricks#gnome-flashback)

## Installation

Using `make`:

 * download the repo.
 * on the terminal go to the repo directory.
 * `sudo make install`

Add these to your `autostart`:

```sh
# just make sure that this runs exactly once when the autostart
# script is first being executed
if hc silent new_attr bool hwm_gnome_autostart ; then
    if [ "$XDG_SESSION_DESKTOP" != 'herbstluftwm' ]; then
        nohup gnome-flashback >/dev/null 2>/dev/null &
        # or if you have pdetach:
        # pdetach gnome-flashback
    fi
    gnome-keyring-daemon -rd
fi
```

On my machine at least, `gdm` spawns a bunch of gsd-daemons that are running
in another XWayland instance, and also a few other useless processes in the
context of herbstluftwm. If you want to close them then during startup you
can execute this script:

```sh
pid=$(ps -ef | grep '^root' | grep 'gdm-session-worker \[pam/gdm-launch-environment\]' | tr -s ' ' | cut -f2 -d ' ')
if [ "$pid" ]; then
    echo 'Killing gdm-session-worker [pam/gdm-launch-environment] (Requires password)'
    sudo kill "$pid"
fi
killall nautilus-desktop
killall update-notifier
killall indicator-application-service
```

## How can i help?

 * Open issues on things that are broken.
 * Fix open issues by sending PRs.
 * Add documentation.

---
MIT - © 2014 [Lorenzo Villani](https://github.com/lvillani). (Original i3-gnome project)

