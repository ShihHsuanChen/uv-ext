#!/usr/bin/bash
UVDIR=$HOME/.uv-ext
SCRIPT_PATH=$UVDIR/uv-ext.sh
BASHRC=$HOME/.bashrc
ORIG_SCRIPT_PATH=$(echo $0 | sed -e 's/install.sh/uv-ext.sh/')

echo "Install uv-ext ..."

mkdir -p $UVDIR
# copy command file
if [ -f $SCRIPT_PATH ]; then
    echo $SCRIPT_PATH already exists, overwrite.
fi
cp $ORIG_SCRIPT_PATH $SCRIPT_PATH

# write to .bashrc
if [ ! -f $BASHRC ]; then
    echo "$BASHRC not exists, create file"
    touch $BASHRC
fi

EXISTS=$(grep '>>> uv-ext initialize' $BASHRC)

if [[ -z $EXISTS ]]; then
    echo "Write initialization to $BASHRC"
    echo "
# >>> uv-ext initialize >>>
source $SCRIPT_PATH
# <<< uv-ext initialize >>>
" >> $BASHRC
    source $SCRIPT_PATH
fi

echo "Success!"
