default:
	git clone https://github.com/Crackerz/vim.git .vim
	ln .vim/.vimrc .vimrc
	git clone https://github.com/Crackerz/xterm.git .xterm
	ln .xterm/.Xresources .Xresources
	git clone https://github.com/Crackerz/zsh.git .zsh
	git -C .zsh submodule update --init
	ln .zsh/.zshrc .zshrc
	sudo aptitude install zsh golang docker.io htop build-essential python-software-properties python g++ -y
	sudo chsh ${USER} -s /bin/zsh
	sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
	sudo usermod -aG docker ubuntu
	# Install NodeJS!
	sudo add-apt-repository ppa:chris-lea/node.js -y
	sudo aptitude update
	sudo aptitude install nodejs -y
	npm completion >> .zshrc
	# Setup workspace
	mkdir -p Development/code
	# Logout for changes to take effect
	exit

cleanup:
	# Cleanup should only be run if you default errors mid-setup
	sudo rm -rf .vim .vimrc .xterm .Xresources .zsh .zshrc /usr/local/bin/docker
	sudo aptitude remove zsh nodejs golang docker.io htop build-essential nodejs -y
	sudo add-apt-repository ppa:chris-lea/node.js -ry
	sudo aptitude update
	sudo chsh ubuntu -s /bin/bash
