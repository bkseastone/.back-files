#!/bin/bash

project_path=$(cd `dirname $0`; pwd)"/tags"
find  . -name \*.py -print | xargs python ptags.py
echo "set tags+="$project_path >> ~/.vimrc
