# Domoticz Development Container

Running Domoticz in a container is great.
It allows fast deployment and experimenting with different versions of the software.
However, when developing a plugin, I prefer to use a [Development Container](https://containers.dev/).

When developing a plugin, there's a constant updating of the code which requires frequent restarts of Domoticz.
Next to that, having the ability to view or update records in the Domoticz database is saving a lot of time.

## My personal setup

This is my personal setup - it may not work "out of the box" for everyone - use this for inspiration not a working solution!

[My Domoticz development container](https://github.com/addiejanssen/domoticz-development-container) has been setup with my personal preferences and in my "IT infrastructure":

- I run Windows 11 as the based operating system on my laptop.
  - I have installed [Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/)
    - I use [openSUSE Tumbleweed](https://en.opensuse.org/openSUSE:WSL) as operating system for my WSL development environment.
  - I use [Visual Studio Code (vscode)](https://code.visualstudio.com/) as my editor.
    - I use several extensions with vscode:
      - [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) - Id: ms-vscode-remote.remote-containers
      - [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) - Id: ms-vscode-remote.remote-ssh
      - [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) - Id: ms-vscode-remote.vscode-remote-extensionpack
      - [Remote Explorer](https://marketplace.visualstudio.com/items?itemName=ms-vscode.remote-explorer) - Id: ms-vscode.remote-explorer
      - [WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) - Id: ms-vscode-remote.remote-wsl
- I run [openSUSE MicroOS](https://get.opensuse.org/microos/?type=server#download) as operating system on my primary application host and on the host where I do software development.
- I use [Podman](https://podman.io) to build and run containers on my Linux systems (both in WSL and on my application and software development host).

Here are the 2 minute "getting up and running" steps that I use:

- I download the contents of [this repository](https://github.com/addiejanssen/domoticz-development-container) to a folder on WSL and my development host (I use both of them for development - switching between them based on my mood/needs).
- Then I open the folder in a new workspace in vscode; vscode should now offer me the option to re-open the folder in a dev container.
  - This will trigger a few installs and updates:
    - It will remove the `.gitignore` file and the `.git` folder and all its contents. I use this dev container folder as a template and I do not want to keep track of all the changes I make while using the dev container.
    - It will install OS dependencies required by Domoticz.
    - It will update (Python) `pip`.
- Once the setup of the dev container completes (this may take a few minutes), I install Domoticz and my plugin:
  - The `install-domoticz.sh` script downloads and extracts Domoticz in a `domoticz` folder.
  - The `setup-plugin.sh` script clones the plugin repository in the Domoticz `plugins` folder and then installs the required Python libraries.

The container installs a few more vscode extensions specific for this dev container.
One of them I want to specifically mention here:
[SQLite IntelliView](https://marketplace.visualstudio.com/items?itemName=Bowlerr.sqlite-intelliview-vscode).
While developing the plugin, I frequently want to peek into the Domoticz database to see how data is stored.
This plugin allows me to do so and also enables me to update data in the database without having to write SQL statements.
It's just a quick way of dealing with the database.

## My development process

I can now run Domoticz within the dev container using the `run-domo.sh` script. The script runs Domoticz without `mDNS`, `MCP` and update checks. Domoticz runs on port `8080` and this port is forwarded by vscode and the extensions to `localhost:8080` no matter if I use WSL or develop on my remote development host.

Output of Domoticz is shown in the terminal window in vscode, so no need to go to the `Log` page in Domoticz itself.

I may switch back and forth between multiple branches while developing the plugin. On switching, I stop Domoticz and start it again using the `run-domo.sh` script.

The different versions may use different settings in the database and this is where the `SQLite IntelliView` extension come into the picture. It allows me to peek in the Domoticz database and make changes where needed.

Once I have a version that seems to work, I bring it to my main application host and run it there for a few days. This allows me to find any issues that may occur over time.
And when I am happy with the results, I push an update out to GitHub.
