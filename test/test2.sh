#!/bin/bash

# Ask user for info
read -p "Enter the GitHub repo link: " repo_url
read -p "Folder to clone into (leave empty for default): " folder_name
read -p "File to keep (e.g., README.md or folder/file): " target_file

# Clone the repo
folder_name=${folder_name:-cutiegit}
git clone "$repo_url" "$folder_name" || { echo "Cloning error."; exit 1; }

cd "$folder_name"

# Check if file exists
if [ -f "$target_file" ] || [ -d "$target_file" ]; then
  echo "File found: $target_file"
  mkdir ../temp_cutie
  cp -r "$target_file" ../temp_cutie/
  cd ..
  rm -rf "$folder_name"
  mv temp_cutie "$folder_name"
  echo -e "\033[1;32mFile successfully extracted to $folder_name!\033[0m"
else
  echo -e "\033[1;31mThe file '$target_file' does not exist in the repo.\033[0m"
  rm -rf "$folder_name"
fi
