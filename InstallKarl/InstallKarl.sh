#!/bin/bash
sudo apt update 
if [ $? -eq 0 ]; then
   echo ---update apt OK
else
   echo ---update apt FAIL 
   exit 1
fi
sudo apt install git 
if [ $? -eq 0 ]; then
   echo ---install git OK
else
   echo ---install git FAIL
   exit 1
fi
sudo apt-get install libncurses5-dev libncursesw5-dev > /dev/null
if [ $? -eq 0 ]; then
   echo ---install ncurses OK
else
   echo ---install ncurses FAIL
   exit 1
fi
if [ -d ~/karel-the-robot ]; then
   echo the folder karel-the-robot already exists
   echo delete it and create a new one?
   read -p "Y(yes)/N(no): " var
   echo $var
   if [[ "$var" == "Y" ]]; then
      rm -rf ~/karel-the-robot
   else
      echo run the script again when you delete the folder
      exit 1
   fi
fi
git clone git@github.com:Abstract-Chief/KarelRobot.git ~/KarelRobot> /dev/null
if [ $? -eq 0 ]; then
   echo ---install Karel Files OK
else
   echo ---install Karel Files FAIL
   exit 1
fi
sudo apt install gcc cmake make gettext  pkg-config check > /dev/null
if [ $? -eq 0 ]; then
   echo ---install Karel Help Files OK
else
   echo ---install Karel Help Files FAIL
   exit 1
fi
mkdir ~/KarelRobot/build 
cd ~/KarelRobot/build 
cmake .. > /dev/null
sudo make
sudo make install 
make clean
cd -
rm -rf ~/KarelRobot
if [ $? -eq 0 ]; then
   echo ---install Karel complete 
else
   echo ---install Karel error 
   exit 1
fi
if [ -d ~/karel_project ]; then
   echo the folder karel_project already exists
   echo delete it and create a new one?
   read -p "Y(yes)/N(no): " var
   echo $var
   if [[ "$var" == "Y" ]]; then
      rm -rf ~/karel_project
   else
      echo run the script again when you delete the folder
      exit 1
   fi
fi
mkdir ~/karel_project
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp -r $SCRIPT_DIR/src/karel_project/* ~/karel_project/
echo "succeful karel_project install search info in karel_project/guide.txt"
echo "\\/\\/\\/\\/\\/"
echo "use <cd ~/karel_project>"
cat ~/karel_project/guide.txt
