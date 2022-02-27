# Simple way to build a Debian package for Kitty
[The amazing Kitty terminal](https://github.com/kovidgoyal/kitty/releases) doesn't provide
Debian packages - this is a way to create it.

# Prerequisites
* Navigate to the [Kitty GitHub Releases](https://github.com/kovidgoyal/kitty/releases) and find the version you want.
* Update the [create_pkg.sh](./create_pkg.sh) `VERSION` variable

# Run
```shell
./create_pkg.sh
```

# Install the package
```
sudo dpkg -i kitty*.deb
sudo apt install -f  # in case some dependency packages were not installed
```
