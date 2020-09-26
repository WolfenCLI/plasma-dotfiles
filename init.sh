sudo pacman -S tmux zsh zsh-autosuggestions git yay alacritty curl flameshot rclone
yay -S brave-nightly-bin 

ln -s "$PWD/.profile" "$HOME/.profile"
ln -s "$PWD/.tmux.conf" "$HOME/.tmux.conf"
ln -s "$PWD/local/bin" "$HOME/.local/"
ln -s "$PWD/config/alacritty" "$HOME/.config/"

rm "$HOME/.config/kglobalshortcutsrc" "$HOME/.config/khotkeysrc"
ln -s "$PWD/config/kglobalshortcutsrc" "$HOME/.config/"
ln -s "$PWD/config/khotkeysrc" "$HOME/.config/"

mkdir ~/.config/nvim/
ln -s "$PWD/nvim/init.vim" "$HOME/.config/nvim/init.vim"

chsh -s /bin/zsh

# Install Oh-my-zsh.
echo "[!!!!] If a zsh shell opens after this, press CTRL+D once to continue"
read foo
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Oh-my-zsh Powerlevel theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# zsh autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

rm "$HOME/.zshrc"
ln -s "$PWD/.zshrc" "$HOME/"

echo "If you're on an AMD processor and having visual artifacts you might want to edit /etc/default/grub adding to GRUB_CMDLINE_LINUX the following: \"amdiommu=on iommu=pt\" then run update-grub"

