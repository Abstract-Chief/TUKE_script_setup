#!/bin/bash

# -> ../info/day1.txt
#
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

check_and_install "git" "apt-get"
check_and_install "make" "apt-get"
check_and_install "gcc" "apt-get"
check_and_install "valgrind" "apt-get"
check_and_install "gdb" "apt-get"
check_and_install "cgdb" "apt-get"
check_and_install "cppcheck" "apt-get"

InstallKarl/InstallKarl.sh


