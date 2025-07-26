let upstream = https://github.com/dfinity/vessel-package-set/releases/download/mo-0.14.14-20250701/package-set.dhall sha256:7c056ddd3ee425ba36b683fec8287c210d70d483f8ceba5cc89fd4f0646b3c69
let Package =
    { name : Text, version : Text, repo : Text, dependencies : List Text }

let additions = [] : List Package

let overrides = [] : List Package

in (upstream : List Package) ++ additions ++ overrides
