#!/usr/bin/env bash

apt-get update -qq && apt-get install -y --no-install-recommends --no-upgrade rsync git ssh wget
dpkg -l hugo || (wget -q https://github.com/gohugoio/hugo/releases/download/v0.57.2/hugo_0.57.2_Linux-64bit.deb && dpkg -i hugo_0.57.2_Linux-64bit.deb)
installGithub.r --update FALSE noamross/noamtools
if [ -f DESCRIPTION ]; then
  Rscript --vanilla -e "devtools::install_dev_deps(dependencies = NA, upgrade = 'never')"
fi
