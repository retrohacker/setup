default:
	git clone https://github.com/Crackerz/vim.git .vim
	ln .vim/.vimrc .vimrc
	git clone https://github.com/Crackerz/xterm.git .xterm
	ln .xterm/.Xresources .Xresources
	git clone https://github.com/Crackerz/zsh.git .zsh
	git -C .zsh submodule update --init
	ln .zsh/.zshrc .zshrc
	sudo aptitude install zsh -y
	sudo chsh ubuntu -s /bin/zsh
cleanup:
	rm -rf .vim .vimrc .xterm .Xresources .zsh .zshrc
	sudo aptitude remove zsh -y
	sudo chsh ubuntu -s /bin/bash
