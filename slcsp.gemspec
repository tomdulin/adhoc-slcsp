lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "lib/slcsp/version"

Gem::Specification.new do |spec|
  spec.name        = "adhoc-slcsp"
  spec.version     = Slcsp::VERSION
  spec.authors     = ["tomdulin"]
  spec.email       = ["tomldulin@gmail.com"]

  spec.summary       = %q{playlist managment tool}
  spec.description   = %q{You've been given a CSV file, `slcsp.csv`, which contains the ZIP codes in the first column. Fill in the second column with the rate (see below) of the corresponding SLCSP and emit the answer on `stdout` using the same CSV format as the input. Write your code in your best programming language.}
  spec.homepage      = "https://github.com/tomdulin/adhoc-slcsp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ['slcsp']
  spec.require_paths = ["lib"]

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.7", ">= 6.1.7.6"
  spec.add_development_dependency "pry"
end
