$:.unshift File.join( File.dirname(__FILE__), "..", "lib")

require 'csvlint/cli'

if ARGV == ["help"]
  Csvlint::Cli.start(["help"])
else
  Csvlint::Cli.start(ARGV.unshift("validate"))
end
