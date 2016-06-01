# Features {#features}

* Modular. Individual panels may be turned on and off, be repositioned on screen.
* Wallpaper-agnostic. May be placed on any wallpaper and still be readable.
* Customizeable. Main colors can be changed for all panels at the same time.


# Requirements {#requirements}

## Fonts {#required-fonts}

### Droid Sans {#droid-font}

The Droid font is used for textual information: <https://www.google.com/fonts/specimen/Droid+Sans>


### Font Awesome {#font-awesome}

The FontAwesome font is used to draw the icons. Get it via apt: `sudo apt install fonts-font-awesome`


## hddtemp <a name='hddtemp'>

`hddtemp` is needed for hard disk temperature monitoring, if you use the HDD panel.


### Installation {#hddtemp-installation}

In Ubuntu you can install the `hddtemp` tool via apt: `sudo apt install hddtemp`


### Configuration {#hddtemp-installation}

If needed, reconfigure `hddtemp` to allow usage as a non-root user: `sudo dpkg-reconfigure hddtemp`

**Warning**. The temperature data is sensitive and it may not be safe to share it with non-root users if the PC is used as a public server, for example.


## Conky Manager {#conky-manager}

It is recommended to use the [Conky Manager]() app to turn on and off individual panels and to auto-start them on session start.


### Installation {#conky-manager-installation}

The package can be found in this PPA: <https://launchpad.net/~teejee2008/+archive/ubuntu/ppa>

1. Add the PPA to your system: `sudo apt-add-repository ppa:teejee2008/ppa && sudo apt-get update`
2. Install the app: `sudo apt-get install conky-manager`


# Installation {#installation}

Copy the `ru.turbanov.conky` folder to your home directory at `~/.conky`. Launch the Conky Manager app and refresh the list. Activate the needed panels.


# Configuration {#configuration}

Feel hacky about configuring the panel conky files. The main common configuration is in the `common.lua` file. You can set the main colors there.
Configure the screen positions of individual panels by changing their corresponging `-panel.lua` files. Set the `gap_x` and `gap_y` and `alignment` variables accordingly.


## HDD {#hdd-configuration}

Open the `hdd-panel.lua` file to edit the configuration of the HDD panel.


### Filesystems {#hdd-filesystems-configuration}

Go to the `-- Filesystems --` paragraph. Edit the list of mount points and add/remove the filesystem items according to your system.


### Usage {#hdd-usage-configuration}

Go the `-- Disk Usage --` paragraph. Edit the list of disks to be monitored and add/remove the items accordingly.

