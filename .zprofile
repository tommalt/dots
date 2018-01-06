# *** PATH must be here, not .zshenv because .zshenv is sourced
#  BEFORE /etc/profile, and PATH will be overwritten
export PATH="$PATH:/home/tom/.local/bin"
export PATH="$PATH:/home/tom/go/bin"

# linking C/C++
export LD_LIBRARY_PATH="/usr/local/lib"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

