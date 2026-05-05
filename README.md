# How to Use with Nix-darwin MacOS Setup

## Prerequisites
```bash
# Install Xcode CLI tools
xcode-select --install

# Install Nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```
Restart your terminal after Nix installs.

---

## Setup
```bash
# Clone configs
git clone https://github.com/yourname/dotfiles ~/.config/home-manager
git clone https://github.com/yourname/nvim-config ~/.config/nvim

# Bootstrap nix-darwin
sudo nix run nix-darwin -- switch --flake ~/.config/home-manager#mactop
```
Restart your terminal, then open `nvim`. Lazy.nvim will self-install on first launch.
The neovim config will be located in my github repos under best github repo

---

## Day to Day
```bash
sudo darwin-rebuild switch --flake ~/.config/home-manager#mactop
```

---

## Troubleshooting

**Any permission errors**
```bash
sudo chown -R $(whoami) ~/.config
```
Then retry the switch.
