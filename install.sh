#!/usr/bin/env bash
# install.sh - CATTOOL Bootstrapper principal
# Um instalador modular para Termux, com estilo felino profissional.

set -euo pipefail
IFS=$'\n\t'

# Define diretório base do CATTOOL
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export CATTOOL_HOME="$SCRIPT_DIR"

# Carrega core libraries
source "$CATTOOL_HOME/core/colors.sh"
source "$CATTOOL_HOME/core/logging.sh"
source "$CATTOOL_HOME/core/checks.sh"
source "$CATTOOL_HOME/core/ui.sh"
source "$CATTOOL_HOME/core/helpers.sh"
source "$CATTOOL_HOME/core/packages.sh"

# Carrega módulos
source "$CATTOOL_HOME/modules/osint.sh"
source "$CATTOOL_HOME/modules/web.sh"
source "$CATTOOL_HOME/modules/wireless.sh"
source "$CATTOOL_HOME/modules/wordlists.sh"
source "$CATTOOL_HOME/modules/utils.sh"
source "$CATTOOL_HOME/modules/aliases.sh"

# Trap para erros inesperados
trap 'log_error "O gatinho encontrou um erro inesperado na linha $LINENO. Limpando bigodes..."' ERR

# Banner inicial
show_banner

# Verificações de ambiente
log_info "🔍 Checando ambiente Termux..."
check_internet
check_storage
log_success "Ambiente pronto para receber carinho felino."

# Atualização dos repositórios Termux (silenciosa, rápida)
log_info "Atualizando lista de pacotes (pkg update)..."
run_with_spinner "Atualizando pkg" pkg update -y
log_success "Lista de pacotes atualizada."

# Menu principal interativo
PS3="$(echo -e ${PEACH}'🐱 Escolha uma opção: '${NC})"
options=(
    "Instalar TUDO (completo)"
    "OSINT (theHarvester, Sherlock, Amass)"
    "WEB (sqlmap, ffuf, nuclei, katana, gobuster, nikto)"
    "Wireless (aircrack-ng, bettercap)"
    "Wordlists (rockyou, SecLists)"
    "Utilitários (htop, lazygit, fzf)"
    "Configurar aliases e PATH"
    "Sair"
)

log_cat "O que você gostaria de fazer hoje? 😸"
select opt in "${options[@]}"; do
    case $REPLY in
        1)
            log_cat "🌀 Instalação COMPLETA! Isso vai levar um lanchinho felino..."
            install_osint_tools
            install_web_tools
            install_wireless_tools
            install_wordlists
            install_utils
            setup_aliases
            break
            ;;
        2)
            install_osint_tools
            break
            ;;
        3)
            install_web_tools
            break
            ;;
        4)
            install_wireless_tools
            break
            ;;
        5)
            install_wordlists
            break
            ;;
        6)
            install_utils
            break
            ;;
        7)
            setup_aliases
            break
            ;;
        8)
            log_cat "Até mais! O gatinho vai dormir agora. 😴"
            exit 0
            ;;
        *)
            log_warning "Opção inválida. Tente de novo, humano."
            ;;
    esac
done

log_cat "✨ Instalação concluída! Os gatinhos aprovam. ✨"
log_cat "   🐾 Reabra o terminal ou execute 'source ~/.bashrc'."
