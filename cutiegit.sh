#!/bin/bash

# 🎨 ASCII + couleurs
echo -e "\033[1;36m"
figlet "EAZY GIT"
echo -e "\033[0m"

# 🧠 Demande le lien Git
read -p "🔗 Donne le lien du repo GitHub : " repo_url
read -p "📂 Dossier où tu veux le cloner (vide pour défaut) : " folder_name
read -p "📄 Fichier à garder (ex: README.md ou dossier/fichier) : " target_file

# 📦 Clonage
folder_name=${folder_name:-eazy_clone}
git clone "$repo_url" "$folder_name" || { echo "❌ Erreur de clonage"; exit 1; }

cd "$folder_name"

# 🔍 Vérifie si le fichier existe
if [ -f "$target_file" ] || [ -d "$target_file" ]; then
  echo "✅ Fichier trouvé : $target_file"
  mkdir ../temp_eazy
  cp -r "$target_file" ../temp_eazy/
  cd ..
  rm -rf "$folder_name"
  mv temp_eazy "$folder_name"
  echo -e "\033[1;32m🎉 Fichier extrait avec succès dans $folder_name !\033[0m"
else
  echo -e "\033[1;31m❌ Le fichier '$target_file' n'existe pas dans le repo.\033[0m"
  rm -rf "$folder_name"
fi
