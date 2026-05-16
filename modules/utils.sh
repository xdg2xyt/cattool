#!/usr/bin/env bash
# modules/utils.sh - Utilitários de produtividade
set -euo pipefail

install_utils() {
    log_cat "⚙️  Instalando utilidades..."
    show_separator

    install_pkg htop
    install_pkg lazygit
    install_pkg fzf

    log_success "Utilitários instalados. Gato produtivo no terminal! 💻"
}
