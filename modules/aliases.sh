#!/usr/bin/env bash
# modules/aliases.sh - Configuração de aliases e PATH sem duplicação
set -euo pipefail

setup_aliases() {
    log_cat "📝 Configurando aliases amigos dos gatos..."
    show_separator

    # Aliases úteis
    append_unique_to_bashrc "alias meow='echo 😺 Miau!'"
    append_unique_to_bashrc "alias cattool='cd ~/cattool && bash install.sh'"
    append_unique_to_bashrc "alias fuzzy='fzf'"
    append_unique_to_bashrc "alias htop='htop'"

    # PATH para ferramentas clonadas
    append_unique_to_bashrc 'export PATH="$HOME/go/bin:$HOME/tools/sherlock:$HOME/tools/sqlmap:$PATH"'

    # Recarregar bashrc se possível
    if [[ $- == *i* ]]; then
        log_info "Recarregando ~/.bashrc..."
        source "$HOME/.bashrc"
    fi

    log_success "Aliases prontos! Digite 'meow' para um cumprimento felino."
}
