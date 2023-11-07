#!/bin/bash

echo "name the file id_github"

read -p "enter email: " email_address

ssh-keygen -t ed25519 -C "$email_address"

if [ ! -d ~/.ssh/id_github ]; then
  echo "the id name is not id_github"
  exit 1
fi

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_github

if [ ! -f ~/.ssh/config ]; then
  touch ~/.ssh/config
fi

echo "Host gitlab.com" >> ~/.ssh/config
echo "  IdentityFile ~/.ssh/id_github"

echo "done setting up ssh key for github"
echo "NOTE: now you need to add the pub key to github"

cp ../configs/.gitconfig ~/.config/.gitconfig

echo "done setting up .gitconfig"
