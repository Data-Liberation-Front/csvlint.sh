require 'csvlint'
require 'csvlint/cli'

if ARGV == ["help"]
  Csvlint::Cli.start(["help"])
else
  Csvlint::Cli.start(ARGV.unshift("validate"))
end
