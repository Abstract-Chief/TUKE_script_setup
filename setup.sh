#!/bin/bash

# -> ../info/day1.txt
#
packet_manager=$(get_package_manager)
if command -v apt &> /dev/null; then
    packet_manager="apt-get"
elif command -v dnf &> /dev/null; then
    packet_manager="dnf"
elif command -v yum &> /dev/null; then
    packet_manager="yum"
elif command -v pacman &> /dev/null; then
    packet_manager="pacman"
elif command -v zypper &> /dev/null; then
    packet_manager="zypper"
elif command -v brew &> /dev/null; then
    packet_manager="brew"
else
    echo "Пакетный менеджер не поддерживается или не найден"
    exit 1
fi
echo "Use packet manager: $packet_manager"
check_and_install() {
    local package_name="$1"
    local install_command="$2"

    # Проверка наличия пакета
    if ! command -v "$package_name" &>/dev/null; then
        echo "Пакет $package_name не найден. Установка..."
        # Установка пакета через пакетный менеджер
        if sudo "$install_command" install -y "$package_name" > /dev/null; then
            echo "Пакет $package_name успешно установлен."
        else
            echo "Ошибка при установке пакета $package_name."
            exit 1
        fi
    else
        echo "Пакет $package_name уже установлен."
    fi
}

check_and_install "git" "$packet_manager"
check_and_install "make" "$packet_manager"
check_and_install "gcc" "$packet_manager"
check_and_install "valgrind" "$packet_manager"
check_and_install "gdb" "$packet_manager"
check_and_install "cgdb" "$packet_manager"
check_and_install "cppcheck" "$packet_manager"

InstallKarl/InstallKarl.sh


