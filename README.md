# CSVlint.sh

This uses the power of [Traveling Ruby](https://github.com/phusion/traveling-ruby) to allow you to run [csvlint.rb](github.com/theodi/csvlint.rb) without replying on having a local Ruby installation.

# Support

We support all Linux platforms (32bit and 64bit), OSX and Windows

# Installation

## Linux and OSX

To install CSVlint, you'll need `curl` installed on your system.

For Linux:

```
sudo apt-get update
sudo apt-get install curl -y
```

For OS X:

```
brew install curl
```

### Simple installation

From a Linux or OSX terminal, you can then run the following command to download and unpack CSVlint and set up your `$PATH`:

```
curl -s https://raw.githubusercontent.com/theodi/csvlint.sh/master/scripts/install.sh | bash
```

### Step by step install

Download the relevant file, based on your platform:

* [Linux 32 bit](https://github.com/theodi/csvlint.sh/releases/download/v0.3.1/csvlint-0.3.1-linux-x86.tar.gz)
* [Linux 64 bit](https://github.com/theodi/csvlint.sh/releases/download/v0.3.1/csvlint-0.3.1-linux-x86_64.tar.gz)
* [OSX](https://github.com/theodi/csvlint.sh/releases/download/v0.3.1/csvlint-0.3.1-osx.tar.gz)

You can then untar the file like so:

```
tar xzf csvlint*.tar.gz
```

Then copy the resulting folder to a sensible place. Make sure to add the location of the `csvlint` binary to your `$PATH`.

## Windows

There is currently no automatic way to install csvlint on Windows, but you can simply [download the zip](https://github.com/theodi/csvlint.sh/releases/download/v0.3.1/csvlint-0.3.1-win32.zip), extract to a folder, then add to your PATH like so:

```
set PATH=%PATH%;C:\{folder you extracted csvlint to}
```

# Generate application files yourself

If you're interested in how this thing works, you can generate the application files yourself.

## Clone the repo

`git clone https://github.com/theodi/csvlint.sh.git && cd csvlint.sh`

## Run the packaging script

Choose below, depending on your platform:

```
rake package:linux:x86    # For Linux 32 bit systems
rake package:linux:x86_64 # For Linux 64 bit systems
rake package:osx          # For OSX
rake package:win32        # For OSX
```

This generates a `tar.gz` file (`zip` for Windows), which you can then use as per the installation instructions.

If you're hacking around and want to have a look what all packages look like, you can run the following to package all versions

```
rake package
```
