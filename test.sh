#!/bin/bash

# Load color utilities
source "$(dirname "$0")/utils/colors.sh"


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

# CutieGit Menu Implementation

# Function to display the main menu
show_menu() {
    echo -e "${SKY_BLUE}║                           CUTIE GIT MENU                                       ║${RESET}"
    echo "║                                                                                         ║"
    echo -e "${PASTEL_YELLOW}║  1. Clone entire repository                                                      ║${RESET}"
    echo -e "${BABY_BLUE}║  2. Clone specific folder(s) from repository                                     ║${RESET}"
    echo -e "${SOFT_PURPLE}║  3. Clone specific file(s) from repository                                       ║${RESET}"
    echo -e "${PEACH}║  4. Rename repository after cloning                                             ║${RESET}"
    echo -e "${PINK}║  5. Cleanup options (delete/keep rest of repo)                                  ║${RESET}"
    echo -e "${PASTEL_TURQUOISE}║  6. Help & Documentation                                                         ║${RESET}"
    echo -e "${LAVENDER}║  0. Exit CutieGit                                                               ║${RESET}"
    echo "║                                                                                         ║"
    echo "╠═════════════════════════════════════════════════════════════════════════════════════════╣"
}

# Function to get user input
get_user_choice() {
    echo -e "${BABY_PINK}║ Please select an option (0-6): ${RESET}"
    echo -n "║ > "
    read choice
    echo "║                                                                                         ║"
}

# Function to clone entire repository
clone_entire_repo() {
    echo -e "${PASTEL_YELLOW}║ CLONE ENTIRE REPOSITORY                                                         ║${RESET}"
    echo "║                                                                                         ║"
    echo -n "║ Enter repository URL: "
    read repo_url
    echo -n "║ Enter destination folder name (or press Enter for default): "
    read dest_folder
    
    if [ -z "$dest_folder" ]; then
        echo -e "${BABY_BLUE}║ Cloning repository...${RESET}"
        git clone "$repo_url"
    else
        echo -e "${BABY_BLUE}║ Cloning repository to '$dest_folder'...${RESET}"
        git clone "$repo_url" "$dest_folder"
    fi
    
    if [ $? -eq 0 ]; then
        echo -e "${PEACH}║ SUCCESS: Repository cloned successfully! ║${RESET}"
    else
        echo -e "${PINK}║ ERROR: Failed to clone repository! ║${RESET}"
    fi
    echo "║                                                                                         ║"
}

# Function to clone specific folders
clone_specific_folders() {
    echo -e "${BABY_BLUE}║ CLONE SPECIFIC FOLDER(S)                                                        ║${RESET}"
    echo "║                                                                                         ║"
    echo -n "║ Enter repository URL: "
    read repo_url
    echo -n "║ Enter destination folder name: "
    read dest_folder
    echo -n "║ Enter folder path(s) to clone (space-separated): "
    read folder_paths
    
    echo -e "${SKY_BLUE}║ Setting up sparse checkout...${RESET}"
    git clone --filter=blob:none --sparse "$repo_url" "$dest_folder"
    cd "$dest_folder"
    
    for folder in $folder_paths; do
        git sparse-checkout add "$folder"
        echo -e "${PASTEL_TURQUOISE}║ Added folder: $folder ║${RESET}"
    done
    
    cd ..
    echo -e "${PEACH}║ SUCCESS: Specific folders cloned successfully! ║${RESET}"
    echo "║                                                                                         ║"
}

# Function to clone specific files
clone_specific_files() {
    echo -e "${SOFT_PURPLE}║ CLONE SPECIFIC FILE(S)                                                          ║${RESET}"
    echo "║                                                                                         ║"
    echo -n "║ Enter repository URL: "
    read repo_url
    echo -n "║ Enter destination folder name: "
    read dest_folder
    echo -n "║ Enter file path(s) to clone (space-separated): "
    read file_paths
    
    echo -e "${SKY_BLUE}║ Setting up sparse checkout for files...${RESET}"
    git clone --filter=blob:none --sparse "$repo_url" "$dest_folder"
    cd "$dest_folder"
    
    for file in $file_paths; do
        git sparse-checkout add "$file"
        echo -e "${PASTEL_TURQUOISE}║ Added file: $file ║${RESET}"
    done
    
    cd ..
    echo -e "${PEACH}║ SUCCESS: Specific files cloned successfully! ║${RESET}"
    echo "║                                                                                         ║"
}

# Function to rename repository
rename_repository() {
    echo -e "${PEACH}║ RENAME REPOSITORY                                                               ║${RESET}"
    echo "║                                                                                         ║"
    echo -n "║ Enter current repository folder name: "
    read current_name
    echo -n "║ Enter new name for the repository: "
    read new_name
    
    if [ -d "$current_name" ]; then
        mv "$current_name" "$new_name"
        echo -e "${PEACH}║ SUCCESS: Repository renamed from '$current_name' to '$new_name'! ║${RESET}"
    else
        echo -e "${PINK}║ ERROR: Repository folder '$current_name' not found! ║${RESET}"
    fi
    echo "║                                                                                         ║"
}

# Function for cleanup options
cleanup_options() {
    echo -e "${PINK}║ CLEANUP OPTIONS                                                                 ║${RESET}"
    echo "║                                                                                         ║"
    echo -n "║ Enter repository folder name: "
    read repo_folder
    
    if [ ! -d "$repo_folder" ]; then
        echo -e "${PINK}║ ERROR: Repository folder not found! ║${RESET}"
        return
    fi
    
    echo -e "${PASTEL_TURQUOISE}║ Cleanup options: ║${RESET}"
    echo "║   1. Keep only selected files/folders (delete rest)"
    echo "║   2. Remove .git directory (keep files only)"
    echo "║   3. Cancel cleanup"
    echo -n "║ > Choose option (1-3): "
    read cleanup_choice
    
    case $cleanup_choice in
        1)
            echo -e "${PASTEL_YELLOW}║ WARNING: This will delete everything except your selected items... ║${RESET}"
            echo -n "║ Are you sure? (y/N): "
            read confirm
            if [[ $confirm =~ ^[Yy]$ ]]; then
                echo -e "${PASTEL_YELLOW}║ WARNING: Cleanup functionality coming soon! ║${RESET}"
            fi
            ;;
        2)
            echo -n "║ Remove .git directory? This will disconnect from remote (y/N): "
            read confirm
            if [[ $confirm =~ ^[Yy]$ ]]; then
                rm -rf "$repo_folder/.git"
                echo -e "${PEACH}║ SUCCESS: .git directory removed! ║${RESET}"
            fi
            ;;
        3)
            echo -e "${PASTEL_TURQUOISE}║ Cleanup cancelled. ║${RESET}"
            ;;
    esac
    echo "║                                                                                         ║"
}

# Function to show help
show_help() {
    echo -e "${PASTEL_TURQUOISE}║ CUTIE GIT HELP & DOCUMENTATION                                                  ║${RESET}"
    echo "║                                                                                         ║"
    echo -e "${BABY_PINK}║ Welcome to CutieGit! Here's what each option does: ║${RESET}"
    echo "║                                                                                         ║"
    echo -e "${PASTEL_TURQUOISE}║ Option 1: Clone entire repository ║${RESET}"
    echo "║    - Downloads the complete repository with all files and history                      ║"
    echo "║                                                                                         ║"
    echo -e "${PASTEL_TURQUOISE}║ Option 2: Clone specific folder(s) ║${RESET}"
    echo "║    - Uses sparse-checkout to download only specified folders                           ║"
    echo "║                                                                                         ║"
    echo -e "${PASTEL_TURQUOISE}║ Option 3: Clone specific file(s) ║${RESET}"
    echo "║    - Downloads only the files you specify                                              ║"
    echo "║                                                                                         ║"
    echo -e "${PASTEL_TURQUOISE}║ Option 4: Rename repository ║${RESET}"
    echo "║    - Renames a cloned repository folder                                                 ║"
    echo "║                                                                                         ║"
    echo -e "${PASTEL_TURQUOISE}║ Option 5: Cleanup options ║${RESET}"
    echo "║    - Manage what to keep or delete after cloning                                       ║"
    echo "║                                                                                         ║"
    echo -e "${PINK}║ Made with love by lolorine16 ║${RESET}"
    echo "║                                                                                         ║"
}

# Main menu loop
while true; do
    show_menu
    get_user_choice
    
    case $choice in
        1)
            clone_entire_repo
            ;;
        2)
            clone_specific_folders
            ;;
        3)
            clone_specific_files
            ;;
        4)
            rename_repository
            ;;
        5)
            cleanup_options
            ;;
        6)
            show_help
            ;;
        0)
            echo -e "${PINK}║ Thank you for using CutieGit! Goodbye! ║${RESET}"
            echo "║                                                                                         ║"
            break
            ;;
        *)
            echo -e "${PINK}║ ERROR: Invalid option! Please select 0-6. ║${RESET}"
            echo "║                                                                                         ║"
            ;;
    esac
    
    if [ "$choice" != "0" ]; then
        echo -n "║ Press Enter to continue..."
        read
    fi
done


# bottom flower
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


