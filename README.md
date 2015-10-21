# CSVlint.sh

This uses the power of [Traveling Ruby](https://github.com/phusion/traveling-ruby) to allow you to run [csvlint.rb](github.com/theodi/csvlint.rb) without replying on having a local Ruby installation.

# Support

Currently, we support all Linux platforms (32bit and 64bit) and OSX. Windows support may be forthcoming in the future.

## Clone the repo

`git clone https://github.com/theodi/csvlint.sh.git && cd csvlint.sh`

## Installation

Eventually, we'd like to offer installation via a bash script or (better still) `apt-get install csvlint` / `brew install csvlint`, but for now, you'll need to follow these instructions.

Download the relevant file, based on your platform:

* [Linux 32 bit](https://github.com/theodi/csvlint.sh/releases/download/v1.0.0/csvlint-1.0.0-linux-x86.tar.gz)
* [Linux 64 bit](https://github.com/theodi/csvlint.sh/releases/download/v1.0.0/csvlint-1.0.0-linux-x86_64.tar.gz)
* [OSX](https://github.com/theodi/csvlint.sh/releases/download/v1.0.0/csvlint-1.0.0-osx.tar.gz)

You can then untar the file like so:

```
tar xzf csvlint-1.0.0-osx.tar.gz # Example for OSX - YMMV
```

Then copy the resulting folder to a sensible place. Make sure to add the location of the `csvlint` binary to your `PATH`.

## Generate application files yourself

If you're interested in how this thing works, you can generate the application files yourself. Choose below, depending on your platform:

```
rake package:linux:x86    # For Linux 32 bit systems
rake package:linux:x86_64 # For Linux 64 bit systems
rake package:linux:x86    # For OSX
```

If you're hacking around and want to have a look what all packages look like, you can run the following to package all versions

```
rake package
```

This generates a `tar.gz` file, which you can then use as per the installation instructions.
