#!/usr/bin/env bash
# modules/wireless.sh - Ferramentas wireless (limitadas no Termux, mas funcionais)
set -euo pipefail

install_wireless_tools() {
    log_cat "📡 Cheirando redes sem fio..."
    show_separator

    # aircrack-ng
    install_pkg aircrack-ng

    # bettercap (requer root, mas instala o pacote)
    if is_installed bettercap; then
        log_info "bettercap já instalado."
    else
        log_warning "bettercap pode exigir root. Instalando mesmo assim."
        install_pkg bettercap
    fi

    log_success "Ferramentas wireless instaladas. O gato está com as orelhas em pé! 🐱‍👤"
}
