My dotfiles
===========

Just my dotfiles and semi-automated steps for getting some basic core
software installed. Many of the config files started off when I was
using Debian GNU/Linux as my main OS. It now supports macOS, Ubuntu
Linux and Ubuntu under WSL.

Stow
----

[GNU Stow](https://www.gnu.org/software/stow/) is used as per [Using GNU Stow to manage your dotfiles](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) by Brandon Invergo.

Convention: directories beginning with '_' are to be excluded from being stowed; this is achieved by a `.stow-local-ignore` file within those directories.
