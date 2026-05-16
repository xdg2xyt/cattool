#!/usr/bin/env bash
# core/checks.sh - Verificações de ambiente e sistema
set -euo pipefail

check_internet() {
    log_info "Verificando conexão com a internet..."
    if ping -c 1 8.8.8.8 &>/dev/null; then
        log_success "Internet funcionando!"
    else
        log_error "Sem conexão com a internet. O gatinho precisa de rede."
        exit 1
    fi
}

check_storage() {
    local available
    available=$(df -BM /data | awk 'NR==2 {print $4}' | sed 's/M//')
    if [[ "$available" -lt 500 ]]; then
        log_warning "Espaço em disco baixo (${available}MB). Algumas ferramentas podem falhar."
    else
        log_success "Espaço OK (${available}MB livres)."
    fi
}

ensure_path() {
    local dir="$1"
    mkdir -p "$dir"
    if [[ ":$PATH:" != *":$dir:"* ]]; then
        export PATH="$dir:$PATH"
        log_info "PATH atualizado com $dir"
    fi
}
