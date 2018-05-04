#!/usr/bin/env bash

REPOS=ardeidae/vimrc
INSTALL_DIR=${HOME}/.vim
VIMRC=${HOME}/.vimrc

echo "Hi!"
echo "This will install ${REPOS}!"

if [ -e "${INSTALL_DIR}" ]; then
	echo "${INSTALL_DIR} already exists. You need to delete it and restart install!"
	echo ">    rm -rfv ${INSTALL_DIR}"
	exit
fi
if [ -e "${VIMRC}" ]; then
	echo "${VIMRC} already exists. You need to delete it and restart install!"
	echo ">    rm -rfv ${VIMRC}"
	exit
fi

command -v git > /dev/null 2>&1 || { echo "git is required but is not installed. Aborting." >&2; exit; }
command -v vim > /dev/null 2>&1 || { echo "vim is required but is not installed. Aborting." >&2; exit; }

echo "Now, we will install ${REPOS}!"
git clone https://github.com/${REPOS}.git ${INSTALL_DIR}
echo "Now, we will install gmarik/vundle!"
git clone https://github.com/gmarik/vundle.git ${INSTALL_DIR}/bundle/vundle
echo "Now, we will create temporary directories!"
mkdir -p -m 0700 ${INSTALL_DIR}/tmp/{backup,swap,undo}
echo "Now, we will create symlink ${VIMRC} to ${INSTALL_DIR}/vimrc!"
ln -fs ${INSTALL_DIR}/vimrc ${VIMRC}

echo "And finally, we will install plugins!"
vim +BundleInstall +qall

