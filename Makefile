M := .cache/makes
$(shell [ -d $M ] || git clone -q https://github.com/makeplus/makes $M)

include $M/init.mk
include $M/gloat.mk
include $M/clean.mk

MAKES-CLEAN := dist


dist: gloat-github-release-dist

release: gloat-github-release
