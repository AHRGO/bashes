#!/bin/bash

atualiza_lista_branchs_no_remoto() {
    git fetch origin
}


procura_branch_no_remoto() {
    local current_branch=$(git branch --show-current)

    git ls-remote --heads origin "$current_branch" >/dev/null 2>&1
}

executa_busca_branch() {
    atualiza_lista_branchs_no_remoto
    
    if procura_branch_no_remoto; then
        echo "A branch existe no remoto"
    else
        echo "A branch não existe no remoto"
    fi
}

func_delete_branch_v1() {
    echo "Atenção! Esse script irá apagar todos os seus branchs locais que não tenham subido ainda. Deseja prosseguir? [N/y]"
    read -r response
    response=$(echo "$response" | tr '[:upper:]' '[:lower:]')
    if [[ "$response" == "y" ]]; then
        # echo "Parabéns, vc apagou todas as suas branchs"
        executa_busca_branch
    elif [[ "$response" == "n" || -z "$response" ]]; then
        echo "Operação cancelada"
    else
        echo "Encerrando o script. Aperte uma tecla válida da próxima vez"
    fi
}


func_delete_branch_v1
