#!/usr/bin/env bash
set -e

# Figure out where this script is located.
SELFDIR="`dirname \"$0\"`"
SELFDIR="`cd \"$SELFDIR\" && pwd`"

RUBY_VERSION="2.1.0"
CSVLINT_VERSION="0.3.1"

# Tell Bundler where the Gemfile and gems are.
export BUNDLE_GEMFILE="$SELFDIR/lib/vendor/Gemfile"
unset BUNDLE_IGNORE_CONFIG

# Run the actual app using the bundled Ruby interpreter, with Bundler activated.
exec "$SELFDIR/lib/ruby/bin/ruby" -rbundler/setup "$SELFDIR/lib/vendor/ruby/$RUBY_VERSION/gems/csvlint-$CSVLINT_VERSION/bin/csvlint" $*
