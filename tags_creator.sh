#!/bin/bash

# Ejecutar el siguiente comando para crear la etiqueta:
# ./tags_creator.sh v1.0.2 CREA

# Ejecutar el siguiente comando para eliminar la etiqueta:
# ./tags_creator.sh v1.0.2 BORRA

git checkout master

if [[ $2 = CREA ]] 
then

    echo "Lista todas las etiquetas"
    git tag -l

    echo "Crea la etiqueta $1"
    git tag $1

    echo "Lista nuevamente todas las etiquetas"
    git tag -l

    echo "Envia la etiqueta al repositorio remoto"
    git push origin --tags

elif [[ $2 = BORRA ]] 
then
    echo "Borra la etiqueta"
    git tag -d $1    	

    echo "Compueba que se borro la etiqueta en local"
    git tag -l 

    echo "Borra la etiqueta en el Github"
    git push origin --delete $1
fi