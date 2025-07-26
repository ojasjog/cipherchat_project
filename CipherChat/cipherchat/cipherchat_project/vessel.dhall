let package-set = ./package-set.dhall

in {
  dependencies = [ "base", "matchers" ],
  packages = package-set
}
