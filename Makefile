M := .cache/makes
$(shell [ -d $M ] || git clone -q https://github.com/makeplus/makes $M)

GLOAT-GLOJURE-VERSION = v0.6.4.2

include $M/init.mk
include $M/gloat.mk
include $M/go.mk
include $M/clean.mk
include $M/shell.mk

MAKES-CLEAN := \
  dist \
  go/dragon-curve \


dist: gloat-github-release-dist

release: gloat-github-release
