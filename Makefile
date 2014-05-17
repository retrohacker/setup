default:
	git clone https://github.com/Crackerz/vim.git .vim
	ln .vim/.vimrc .vimrc
	git clone https://github.com/Crackerz/xterm.git .xterm
	ln .xterm/.Xresources .Xresources
	git clone https://github.com/Crackerz/zsh.git .zsh
	git -C .zsh submodule update --init
	ln .zsh/.zshrc .zshrc
	sudo aptitude install zsh nodejs golang docker.io htop build-essential -y
	sudo chsh ${USER} -s /bin/zsh
	sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
cleanup:
	sudo rm -rf .vim .vimrc .xterm .Xresources .zsh .zshrc /usr/local/bin/docker
	sudo aptitude remove zsh nodejs golang docker.io htop build-essential -y
	sudo chsh ubuntu -s /bin/bash
