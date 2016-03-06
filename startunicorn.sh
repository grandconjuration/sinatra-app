#!/bin/sh
export PATH=/usr/local/bin:$PATH
cd /var/www/jekyll/YellowHumanSoftwareDocs && unicorn -c unicorn.rb -D
