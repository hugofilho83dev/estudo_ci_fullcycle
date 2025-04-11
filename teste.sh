#!/bin/bash

# Verifica se existem tags no repositório
if [ $(git tag | wc -l) -eq 0 ]; then
    echo "Nenhuma tag encontrada. Criando a primeira tag."
    new_tag="v1.0.0"
    echo "If: $new_tag"
else
    # Obtém a última tag e incrementa
    latest_tag=$(git describe --tags $(git rev-list --tags --max-count=1))
    echo "Última tag encontrada: $latest_tag"

    # Remove o prefixo 'v' da tag para manipulação numérica
    version_number=$(echo $latest_tag | sed 's/^v//')

    # Incrementa a última parte da versão
    new_version=$(echo $version_number | awk -F. '{$NF+=1; OFS="."; print $0}')

    # Adiciona o prefixo 'v' novamente
    new_tag="v$new_version"
    echo "Else: $new_tag"
fi

echo "Nova tag gerada: $new_tag"