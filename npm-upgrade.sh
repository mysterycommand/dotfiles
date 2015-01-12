#!/bin/sh

# `npm -g up` is actually not what is sounds like as of 12/23/14
#
# @see: https://github.com/npm/npm/issues/6979
# @see: https://gist.github.com/othiym23/4ac31155da23962afd0e

set -e
set -x

for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f2)
do
	npm -g i "$package"
done