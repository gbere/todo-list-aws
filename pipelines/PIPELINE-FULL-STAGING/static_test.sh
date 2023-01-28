#!/bin/bash

source todo-list-aws/bin/activate
set -x

RAD_ERRORS=$(radon cc src -nc | wc -l)

if [[ $RAD_ERRORS -ne 0 ]]
then
    echo 'Ha fallado el análisis estatico de RADON. La complegidad ciclomática ' \ 
         '(flag cc), se esperaba que fuese calidad B o superior' \ 
         '(flag -nc lista errores de calidad C o peores)'
    exit 1
fi
RAD_ERRORS=$(radon mi src -nc | wc -l)
if [[ $RAD_ERRORS -ne 0 ]]
then
    echo 'Ha fallado el análisis estatico de RADON en el indice de mantenibilidad (flag mi)'
    exit 1
fi

flake8 src/*.py
if [[ $? -ne 0 ]]
then
    exit 1
fi
bandit src/*.py
if [[ $? -ne 0 ]]
then
    exit 1
fi