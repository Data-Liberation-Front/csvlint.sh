#!/usr/bin/env bash

# Based on the Traveling Bosh installation script at https://github.com/cloudfoundry-community/traveling-bosh

# $ man uname
# -a      Behave as though all of the options -mnrsv were specified.
# -m      print the machine hardware name.
# -s      print the operating system name.

#         $os_name $os_hardware
# OS X -  Darwin   x86_64
# Linux - Linux    x86_64
os_name=$(uname -s)
os_hardware=$(uname -m)

current_path=$(pwd)

bin_dir=$1
if [ "$bin_dir" == "" ]; then
  if [[ $EUID -ne 0 ]]; then
    bin_dir="$HOME/bin"
    source_line="export PATH=\$PATH:\$HOME/bin/csvlint"
  else
    bin_dir="/usr/bin"
    source_line="export PATH=\$PATH:${bin_dir}/csvlint"
  fi
fi

display_error() {
  tput sgr0
  tput setaf 1
  echo "ERROR: $1"
  tput sgr0
  exit 1
}

update_profile() {
  [ -f $1 ] || return 1

  cat $1 | grep "$source_line" > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    echo "$source_line" >> $1
  fi
  export source_file=$1
}

[ "$bin_dir" == "" ] && display_error "No destination specified!"
[ -d $bin_dir ] || mkdir -p $bin_dir > /dev/null 2>&1 || display_error "Failed to create $bin_dir"
[ -z `which curl` ] && display_error "Could not find curl
  linux: apt-get install curl
  mac:   brew install curl
"

if [ "$os_name" == "Linux" ]; then
  update_profile $HOME/.zshrc || update_profile $HOME/.bashrc || update_profile $HOME/.bash_profile
  if [[ $os_hardware != "x86_64" ]]; then
    download_platform="linux-x86"
  else
    download_platform="linux-x86_64"
  fi
elif [ "$os_name" == "Darwin" ]; then
  update_profile $HOME/.zshrc || update_profile $HOME/.profile || update_profile $HOME/.bash_profile
  download_platform="osx"
fi
if [[ $EUID -eq 0 ]]; then
  update_profile "/etc/bash.bashrc"
fi

cli_version=0.3.1
tar_filename="csvlint-${cli_version}-${download_platform}"
asset_filename="csvlint.tgz"

if [ "$?" != "0" ]; then
  echo 'Unable to locate profile settings file'
  echo
  echo " You will have to manually add the following line:"
  echo
  echo "  $source_line"
  echo
fi

current_dir=$(pwd)

tmp_unarchive_dir=${TMPDIR:-/tmp}
download_dir="$tmp_unarchive_dir/csvlint-installer"
rm -rf ${download_dir}
mkdir -p ${download_dir}
download_file=${download_dir}/${asset_filename}

download_url="https://github.com/theodi/csvlint.sh/releases/download/v${cli_version}/${tar_filename}.tar.gz"

echo "Downloading v${cli_version}..."
curl -k -L -H "Accept: application/octet-stream" $download_url -o ${download_file}

cd $bin_dir
if [[ ! -f ${download_file} ]]; then
    echo "Failed to download file"
    exit 1
fi

rm -rf $tar_filename
tar xf ${download_file}
rm -f $bin_dir/csvlint
ln -s $bin_dir/$tar_filename csvlint

cd $current_path

echo "Installed: csvlint v${cli_version}"
echo
echo "Please restart your terminal session or to get started right away run:"
echo " source ${source_file}"
echo
echo "Run 'csvlint help' to see help"
echo
