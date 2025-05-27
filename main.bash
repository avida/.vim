#!/bin/bash

# Terminal-based file browser with keyboard navigation using find and no external tools

SECRETS_TMP_DIR="secrets"
SECRETS_ENC_FN="secrets.gpg"

PACKAGE_LIST="tmux vim git python3 python3-pip python3-setuptools curl zsh"
PYENV_PACKAGES="zlib1g-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils liblzma-dev python3-venv libffi-dev"

PI_PACKAGE_LIST="wiringpi"
PYTHON_PACKAGES="flask flask_socketio plumbum"
PIP_RASPI="spidev RPi.GPIO redis rq"

PACKAGE_MGR="apt update; apt-get install -y"
ACTIONS_DIR="actions"

onend() {
clear_tmp_secrets
tput cnorm
clear
exit
}

trap "onend" INT

load_underscore_files() {
    local search_dir="$1"

    if [[ -z "$search_dir" ]]; then
        search_dir="."  # default to current directory
    fi

    # Find all files with "_" in their name, ignore directories, and source them
    while IFS= read -r file; do
        if [[ -f "$file" ]]; then
            echo "Loading: $file"
            source "$file"
        fi
    done < <(find "$search_dir" -type f -name '_*')
}


navigate() {
    local current_dir="./actions"
    load_underscore_files $current_dir

    while true; do
        clear
        tput cup 0 0  # Ensure cursor starts at top
        echo "Browsing: $current_dir"
        echo "Use ↑ ↓ to navigate, Enter to select, 'q' to quit"
        echo

        # Gather items in the directory
        mapfile -t dirs < <(find "$current_dir" -maxdepth 1 -mindepth 1 -type d ! -name '_*' 2>/dev/null | sort)
        mapfile -t files < <(find "$current_dir" -maxdepth 1 -mindepth 1 -type f ! -name '_*' 2>/dev/null | sort)
        entries=("..")
        entries+=("${dirs[@]}")
        entries+=("${files[@]}")

        local selected=0
        local total=${#entries[@]}

        while true; do
            tput cup 3 0  # Move to the top of menu entries
            for i in "${!entries[@]}"; do
                            local entry="${entries[$i]}"
                entry="${entry#$current_dir/}"
                entry="${entry#$current_dir}"
                local is_dir=""
                [[ -d "${entries[$i]}" || "${entries[$i]}" == ".." ]] && is_dir="1"

                if [[ $i -eq $selected ]]; then
                    tput rev
                fi

                if [[ "$is_dir" == "1" ]]; then
                    printf "   \033[34m%s\033[0m\n" "$entry"
                else
                    printf "   %s\n" "$entry"
                fi

                if [[ $i -eq $selected ]]; then
                    tput sgr0
                fi
            done

            # Clear remaining lines in case list shrinks
            tput ed

            # Read a single key
            IFS= read -rsn1 key
            if [[ $key == $'\x1b' ]]; then
                read -rsn2 -t 0.001 key
                case $key in
                    "[A") ((selected--));;
                    "[B") ((selected++));;
                esac
            elif [[ $key == "" ]]; then
                break
            elif [[ $key == "q" ]]; then
                tput cnorm; clear; exit
            fi

            (( selected < 0 )) && selected=$((total - 1))
            (( selected >= total )) && selected=0

            tput cup 3 0
        done

        # Handle selection
        chosen="${entries[$selected]}"
        if [[ "$chosen" == ".." ]]; then
            current_dir="$(dirname "$current_dir")"
        elif [[ -d "$chosen" ]]; then
            current_dir="$chosen"
        elif [[ -f "$chosen" ]]; then
            clear
            echo "Executing: $chosen"
            echo "========================="
            echo "Running: $chosen"
            SECONDS=0
            echo "--------------------------"
            source "$chosen"
            duration=$SECONDS
            echo "--------------------------"
            echo -e "Execution time: \e[33m${duration} seconds\e[0m"
            echo "Press any key to continue..."
            read -n 1
        fi
    done
}

# Start in current directory
tput civis  # Hide cursor
navigate "$(pwd)"
tput cnorm  # Show cursor
clear

