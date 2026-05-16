
#!/usr/bin/env bash
# modules/wordlists.sh - Wordlists essenciais
set -euo pipefail

WORDLIST_DIR="$HOME/cattool/wordlists"

install_wordlists() {
    log_cat "🧶 Desenrolando novelos de palavras..."
    show_separator
    mkdir -p "$WORDLIST_DIR"

    # rockyou.txt
    if [[ -f "$WORDLIST_DIR/rockyou.txt" ]]; then
        log_info "rockyou.txt já existe."
    else
        log_info "Extraindo rockyou.txt..."
        if [[ -f "/data/data/com.termux/files/usr/share/wordlists/rockyou.txt.gz" ]]; then
            run_with_spinner "Descomprimindo rockyou" \
                gunzip -c /data/data/com.termux/files/usr/share/wordlists/rockyou.txt.gz > "$WORDLIST_DIR/rockyou.txt"
        else
            log_warning "rockyou.txt.gz não encontrado no sistema. Baixando..."
            run_with_spinner "Baixando rockyou" \
                curl -fsSL "https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt" -o "$WORDLIST_DIR/rockyou.txt"
        fi
        log_success "rockyou.txt pronto."
    fi

    # SecLists (clone parcial)
    if [[ -d "$WORDLIST_DIR/SecLists" ]]; then
        log_info "SecLists já clonado. Atualizando..."
        safe_cd "$WORDLIST_DIR/SecLists" && git pull --rebase
    else
        log_info "Clonando SecLists (apenas Discovery e Passwords)..."
        git clone --depth 1 --filter=blob:none --sparse \
            https://github.com/danielmiessler/SecLists.git "$WORDLIST_DIR/SecLists"
        safe_cd "$WORDLIST_DIR/SecLists" && git sparse-checkout set Discovery Passwords
    fi

    log_success "Wordlists prontas! O gatinho está brincando com os fios. 🧵"
}
