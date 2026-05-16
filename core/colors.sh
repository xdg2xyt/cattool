#!/usr/bin/env bash
# core/colors.sh - Paleta de cores ANSI para o CATTOOL
set -euo pipefail

# Reset
NC='\e[0m'

# Estilos básicos
BOLD='\e[1m'
DIM='\e[2m'
UNDERLINE='\e[4m'

# Cores padrão
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
MAGENTA='\e[35m'
CYAN='\e[36m'
WHITE='\e[37m'

# Backgrounds (uso opcional)
BG_RED='\e[41m'
BG_GREEN='\e[42m'
BG_YELLOW='\e[43m'
BG_BLUE='\e[44m'
BG_MAGENTA='\e[45m'
BG_CYAN='\e[46m'

# Cores cat-friendly extras
PINK='\e[38;5;213m'
LAVENDER='\e[38;5;183m'
PEACH='\e[38;5;216m'
