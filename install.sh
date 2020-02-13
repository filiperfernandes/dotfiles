#!/bin/bash
echo "Do you wish to update your dotfiles?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) exit;;
    esac
done
#Get current path
path=$(pwd)

#Backup existing files
echo "Backing up old dotfiles"
for backup in dotfiles/.[^.]* ; do 
    filename="$(basename "$backup")"
    filepath=~/$filename
    if [[ -e $filepath ]]; then
        echo "$filename exist"
        mv -i "$filepath" "$filepath.old"
    fi
done

#Create symlinks
for file in dotfiles/.[^.]* ; do 
    echo "Creating symlink for:"
    echo "$(basename "$file")"
    ln -s "$path/$file" test/
done

echo "DONE"

