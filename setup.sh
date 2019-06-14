#!/bin/bash
source ~/.profile
env > ~/.testenv
R_LIBS_USER=~/.local/lib/R R -e "install.packages('IRkernel')"