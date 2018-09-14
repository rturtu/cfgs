if [ -e vimrc ]; then
	rm vimrc;
fi;
if [ -e bashrc ]; then
	rm bashrc;
fi;
cp ~/.bashrc bashrc
cp ~/.vimrc vimrc

