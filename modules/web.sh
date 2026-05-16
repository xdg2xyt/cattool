#!/usr/bin/env bash
# modules/web.sh - Ferramentas de segurança web
set -euo pipefail

install_web_tools() {
    log_cat "🌐 Instalando ferramentas web..."
    show_separator

    # sqlmap
    clone_tool "https://github.com/sqlmapproject/sqlmap.git" "$HOME/tools/sqlmap" "sqlmap"
    ensure_path "$HOME/tools/sqlmap"

    # ffuf
    install_go_tool "github.com/ffuf/ffuf/v2@latest" "ffuf"

    # nuclei
    install_go_tool "github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest" "nuclei"

    # katana
    install_go_tool "github.com/projectdiscovery/katana/cmd/katana@latest" "katana"

    # gobuster
    install_go_tool "github.com/OJ/gobuster/v3@latest" "gobuster"

    # nikto (via pkg)
    install_pkg nikto

    log_success "Ferramentas web instaladas. 🕸️🐱"
}
