# Script de Configuración de Proyecto usando el patrón 7-1

Este script ayuda a automatizar la creación de un proyecto con una estructura específica de carpetas y archivos, incluyendo opciones para usar Sass con el patrón 7-1 y la inicialización de Git. También permite abrir el proyecto en Visual Studio Code al finalizar.

## Dependencias
```
code 
```
para abrir vscode desde terminal
```
git 
```
para inicializar git en el proyecto

## Instrucciones

### Ejecutar el Script

Para ejecutar el script, asegúrate de tener permisos de ejecución. Puedes darle permisos ejecutando:
```bash
chmod +x script.sh
```

Luego ejecuta el script
```bash
./script.sh
```

## Estructura de carpetas creadas

### Con patrón 7-1 usanso Sass

```
.
├── assets
│   ├── css
│   ├── img
│   ├── js
│   └── sass
│       ├── abstracts
│       │   └── _abstracts.scss
│       ├── base
│       │   └── _base.scss
│       ├── components
│       │   └── _components.scss
│       ├── layout
│       │   └── _layout.scss
│       ├── pages
│       │   └── _pages.scss
│       ├── shame
│       │   └── _shame.scss
│       ├── themes
│       │   └── _themes.scss
│       └── vendors
│           └── _vendors.scss
│       ├── main.scss
└── index.html
```
### Sólo con CSS

```
.
├── assets
│   ├── css
│       ├── style.css
│   ├── img
│   ├── js
└── index.html
```