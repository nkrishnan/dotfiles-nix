# dotfiles-nix
## Setup
### Install nix
Use the version from determinate systems since it does a handful of additional useful stuff
```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

### Build the home-manager flake
Modify system and user info and run
```
nix run . -- build --flake .
```

### Activate the new config
```
nix run . -- switch --flake .
```

### Add/remove packages
Edit home.nix and run
```
home-manager switch --flake .
```

## References
1. (Zero to Nix)[https://zero-to-nix.com/]
1. (Home Manager Options)[https://rycee.gitlab.io/home-manager/options]
1. (Managing Dotfiles with Home Manager)[https://www.bekk.christmas/post/2021/16/dotfiles-with-nix-and-home-manager]
1. (Home Manager Flakes)[https://www.chrisportela.com/posts/home-manager-flake/]
1. (Nix Flakes)[https://www.tweag.io/blog/2020-05-25-flakes/]