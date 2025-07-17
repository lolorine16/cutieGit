#!/bin/bash


echo "╔═════════════════════════════════════════════════════════════════════════════════════════╗"

# logo
echo -e "\e[95m║    _______     ___    _ ,---------. .-./\`)     .-''-.    .-_'''-.  .-./\`) ,---------.   ║"
echo -e "\e[35m║   /   __  \  .'   |  | |\          \\ .-.')  .'_ _   \  '_( )_   \ \ .-.')\          \   ║"
echo -e "\e[94m║  | ,_/  \__) |   .'  | | \`--.  ,---'/ \`-' \ / ( \` )   '|(_ o _)|  '/ \`-' \ \`--.  ,---'  ║"
echo -e "\e[96m║,-./  )       .'  '_  | |    |   \    \`-'\`\"\`. (_ o _)  |. (_,_)/___| \`-'\`\"\`    |   \     ║"
echo -e "\e[92m║\  '_ '\`)     '   ( \.-.|    :_ _:    .---. |  (_,_)___||  |  .-----..---.     :_ _:     ║"
echo -e "\e[93m║ > (_)  )  __ ' (\`. _\` /|    (_I_)    |   | '  \   .---.'  \  '-   .'|   |     (_I_)     ║"
echo -e "\e[91m║(  .  .-'_/  )| (_ (_) _)   (_(=)_)   |   |  \  \`-'    / \  \`-'\`   | |   |    (_(=)_)    ║"
echo -e "\e[33m║ \`-'\`-'     /  \ /  . \ /    (_I_)    |   |   \       /   \        / |   |     (_I_)     ║"
echo -e "\e[90m║   \`._____.'    \`\`-'\`-''     '---'    '---'    \`'-..-'     \`'-...-'  '---'     '---'     ║"
echo -e "\e[0m║                                                                                         ║"  

echo "║--------------------------------------(lolorine16)---------------------------------------║"
echo "║                                                                                         ║"
#code here

# Ask user for info
read -p "║Enter the GitHub repo link: " repo_url
read -p "║Folder to clone into (leave empty for default): " folder_name
read -p "║File to keep (e.g., README.md or folder/file): " target_file

# Clone the repo
folder_name=${folder_name:-cutiegit}
git clone "$repo_url" "$folder_name" || { echo "Cloning error."; exit 1; }

cd "$folder_name"

# Check if file exists
if [ -f "$target_file" ] || [ -d "$target_file" ]; then
  echo "║File found: $target_file"
  mkdir ../temp_cutie
  cp -r "$target_file" ../temp_cutie/
  cd ..
  rm -rf "$folder_name"
  mv temp_cutie "$folder_name"
  echo -e "\033[1;32m║File successfully extracted to $folder_name!\033[0m"
else
  echo -e "\033[1;31m║The file '$target_file' does not exist in the repo.\033[0m"
  rm -rf "$folder_name"
fi


#end of code


# footer
echo -e "\e[95m║                     _                                                                   ║"
echo -e "\e[35m║                   _(_)_                          wWWWw   _                 wWWWw   _    ║"
echo -e "\e[94m║       @@@@       (_)@(_)   vVVVv     _     @@@@  (___) _(_)__     @@@@    (___) _(_)__  ║"
echo -e "\e[96m║      @@()@@ wWWWw  (_)\    (___)   _(_)_  @@()@@   Y  (_)@(_)     @@()@@   Y  (_)@(_)   ║"
echo -e "\e[92m║       @@@@  (___)     \`|/    Y    (_)@(_)  @@@@   \|/   (_)\       @@@@   \|/   (_)\    ║"
echo -e "\e[93m║        /      Y       \|    \|/    /(_)    \|      |/      |        /      |/      |    ║"
echo -e "\e[91m║     \ |     \ |/       | / \ | /  \|/       |/    \|      \|/     \ |     \|      \|/   ║"
echo -e "\e[33m║     \\\\|//   \\\\|///  \\\\\\|//\\\\\\|/// \|///  \\\\\\|//  \\\\|//  \\\\\\|//  \\\\|//  \\\\\\|//  \\\\|//  \\\\\\|//       ║"
echo -e "\e[90m║^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^║"
echo -e "\e[0m║                                                                                         ║"
echo "╚═════════════════════════════════════════════════════════════════════════════════════════╝"


