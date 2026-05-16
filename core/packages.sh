#!/usr/bin/env bash
# core/helpers.sh - Funções auxiliares genéricas
set -euo pipefail

safe_cd() {
    local dir="$1"
    if cd "$dir" 2>/dev/null; then
        return 0
    else
        log_error "Não foi possível acessar $dir"
        return 1
    fi
}

run_with_spinner() {
    local message="$1"
    shift
    "$@" &
    local pid=$!
    show_spinner "$message" "$pid"
    wait "$pid"
}

is_installed() {
    command -v "$1" &>/dev/null
}

# Evita duplicação em ~/.bashrc
append_unique_to_bashrc() {
    local line="$1"
    if ! grep -Fxq "$line" "$HOME/.bashrc"; then
        echo "$line" >> "$HOME/.bashrc"
        log_success "Linha adicionada ao .bashrc: ${line}"
    else
        log_info "Linha já presente no .bashrc, pulando."
    fi
}
