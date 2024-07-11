#!/bin/bash
clear
# Nombre proyecto
read -p "Ingrese el nombre del proyecto: " project_name
project_name=${project_name:-mi-proyectito}

project_name=$(echo $project_name | tr ' ' '-')

echo "Creando proyecto: " $project_name

mkdir -p $project_name
cd $project_name

style_file_name="style.css"

mkdir assets assets/css assets/js assets/img

# utilizar sass?
read -p "¿Desea utilizar sass con patrón 7-1? (s/n): " use_sass

if [ "$use_sass" == "s" ]; then
    style_file_name="main.css"

    mkdir assets/sass
    cd assets/sass
    mkdir abstracts base components layout shame themes vendors pages
    touch abstracts/_abstracts.scss base/_base.scss components/_components.scss layout/_layout.scss shame/_shame.scss themes/_themes.scss vendors/_vendors.scss pages/_pages.scss
    cd ../..

    cat <<EOL >"assets/sass/main.scss"
@charset 'UTF-8';

// Abstracts
@import "abstracts/abstracts";

// Vendors
@import "vendors/vendors";

// base
@import "base/base";

// layout
@import "layout/layout";

// components
@import "components/components";

// pages
@import "pages/pages";

// themes
@import "themes/themes";

// shame
@import "shame/shame";
EOL

else
    touch assets/css/style.css
    touch assets/sass/style.scss
fi

# Crear un archivo HTML con el contenido solicitado
touch index.html
cat <<EOL >"index.html"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$project_name</title>
    <link rel="stylesheet" href="assets/css/$style_file_name">
</head>
<body>
  
</body>
</html>
EOL

# Notificar al usuario
echo "Archivo HTML creado"

# Inicializar git
read -p "¿Desea inicializar git? (s/n): " git_init

if [ "$git_init" == "s" ]; then
    echo "Inicializando git..."
    git init
else
    echo "Ok, sin git"
fi

# Inicializar git
read -p "¿Desea abrir el proyecto en Visual Studio Code (s/n)" open_vscode

if [ "$open_vscode" == "s" ]; then
    code .
else
    cd ..
fi

echo "No olvides activar el watcher de Sass"
