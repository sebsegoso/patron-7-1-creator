#!/bin/bash

# Limpiar consola
clear

# Función para verificar si un programa está instalado
function check_command {
    if ! command -v $1 &> /dev/null; then
        echo "Error: $1 no está instalado. Por favor instálalo y vuelve a ejecutar el script."
        exit 1
    fi
}

# Verificar si Git está instalado
check_command git

# Verificar si Visual Studio Code está instalado
check_command code

# Función para crear archivos Sass
function create_sass_structure {
    mkdir -p assets/sass/{abstracts,base,components,layout,shame,themes,vendors,pages}
    touch assets/sass/abstracts/_abstracts.scss
    touch assets/sass/base/_base.scss
    touch assets/sass/components/_components.scss
    touch assets/sass/layout/_layout.scss
    touch assets/sass/shame/_shame.scss
    touch assets/sass/themes/_themes.scss
    touch assets/sass/vendors/_vendors.scss
    touch assets/sass/pages/_pages.scss

    cat <<EOL > assets/sass/main.scss
@charset 'UTF-8';

// Abstracts
@import "abstracts/abstracts";

// Vendors
@import "vendors/vendors";

// Base
@import "base/base";

// Layout
@import "layout/layout";

// Components
@import "components/components";

// Pages
@import "pages/pages";

// Themes
@import "themes/themes";

// Shame
@import "shame/shame";
EOL
    echo "Estructura de Sass creada. No olvides activar el watcher de Sass."
}

# Nombre del proyecto
read -p "Ingrese el nombre del proyecto: " project_name
project_name=${project_name:-my-project}

# Reemplazar espacios por guiones
project_name=$(echo $project_name | tr ' ' '-')

echo "Creando proyecto: $project_name"

# Crear directorio y navegar a él
mkdir -p "$project_name"
cd "$project_name"

# Inicializar estructura de carpetas
style_file_name="style.css"
mkdir -p assets/{css,js,img}

# Utilizar Sass
read -p "¿Desea utilizar Sass con patrón 7-1? (s/n): " use_sass
if [ "$use_sass" == "s" ]; then
    style_file_name="main.css"
    create_sass_structure
else
    touch assets/css/style.css
fi

# Crear archivo HTML
cat <<EOL > index.html
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

echo "Archivo HTML creado"

# Inicializar Git
read -p "¿Desea inicializar Git? (s/n): " git_init
if [ "$git_init" == "s" ]; then
    git init
    touch .gitignore
    echo "Git inicializado y archivo .gitignore creado."
else
    echo "Ok, sin Git."
fi

# Abrir proyecto en Visual Studio Code
read -p "¿Desea abrir el proyecto en Visual Studio Code? (s/n): " open_vscode
if [ "$open_vscode" == "s" ]; then
    code .
else
    cd ..
fi
