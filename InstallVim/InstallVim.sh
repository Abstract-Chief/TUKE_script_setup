#!/bin/bash
sudo apt update > /dev/null
if [ $? -eq 0 ]; then
   echo "------------------------update apt OK"
else
   echo "------------------------update apt FAIL" 
   exit 1
fi
if [ -d neovim ]; then
   echo the folder neovim already exists
   echo delete it and create a new one?
   read -p "Y(yes)/N(no): " var
   echo $var
   if [[ "$var" == "Y" ]]; then
      rm -rf neovim
   else
      echo run the script again when you delete the folder
      exit 1
   fi
fi
git clone https://github.com/neovim/neovim 
if [ $? -eq 0 ]; then
   echo "------------------------clone neovim OK"
else
   echo "------------------------clone neovim FAIL"
   exit 1
fi
sudo apt install make 
if [ $? -eq 0 ]; then
   echo "------------------------install make OK"
else
   echo "------------------------install make FAIL"
   exit 1
fi
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo 
if [ $? -eq 0 ]; then
   echo "------------------------make neovim OK"
else
   echo "------------------------make neovim FAIL"
   exit 1
fi
sudo make install
if [ $? -eq 0 ]; then
   echo "------------------------make neovim install OK"
else
   echo "------------------------make neovim install FAIL"
   exit 1
fi
cd -
if [ -f UbuntuMono.zip ]; then
   rm -rf UbuntuMono.zip
fi
if [ -d fonts ]; then
   rm -rf fonts
fi
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/UbuntuMono.zip
if [ $? -eq 0 ]; then
   echo "------------------------install fonts OK"
else
   echo "------------------------install fonts FAIL"
   exit 1
fi
sudo apt install unzip
if [ $? -eq 0 ]; then
   echo "------------------------install unzip OK"
else
   echo "------------------------install unzip FAIL"
   exit 1
fi
mkdir fonts
unzip UbuntuMono.zip -d fonts
if [ $? -eq 0 ]; then
   echo "------------------------unzip OK"
else
   echo "------------------------unzip FAIL"
   exit 1
fi
sudo mv fonts/UbuntuMonoNerdFont-Regular.ttf /usr/share/fonts/
rm -rf fonts
rm -rf UbuntuMono.zip
rm -rf neovim
if [ $? -eq 0 ]; then
   echo "------------------------succeful install NERD font  OK"
else
   echo "------------------------install NERD font FAIL"
   exit 1
fi
sudo apt install tilix
if [ $? -eq 0 ]; then
   echo "------------------------succeful install tilix"
else
   echo "------------------------install tilix FAIL"
   exit 1
fi
sudo apt install zsh
if [ $? -eq 0 ]; then
   echo "------------------------succeful install zsh"
else
   echo "------------------------install zsh FAIL"
   exit 1
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
if [ $? -eq 0 ]; then
   echo "------------------------succeful install oh my zsh"
fi
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
if [ $? -eq 0 ]; then
   echo "------------------------succeful install AstroVim"
else
   echo "------------------------install AstroVim FAIL"
   exit 1
fi
echo "!!!!! вам треба знайти таку строку </usr/bin/tilix.wrapper> !!!!!"
echo "!!!!! зліва буде число його треба ввести і натиснути enter  !!!!!"
sudo update-alternatives --config x-terminal-emulator
#graphick configure
cat info.txt
