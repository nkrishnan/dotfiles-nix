{ pkgs, ... }:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-basic
      geometry hyperref;
  });
in
{
  home.username = "nkrishnan";
  home.homeDirectory = "/home/nkrishnan";
  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };
  programs = {
    home-manager.enable = true;
    bash = {
      enable = false;
    };
    git = {
      enable = true;
      userName = "Neeraj Krishnan";
      userEmail = "krishnan.neeraj@gmail.com";
      extraConfig = {
        core = {
          editor = "emacsclient -t";
          whitespace = "trailing-space,space-before-tab";
        };
      };
    };
    emacs = {
      enable = true;
      extraConfig = ''
        (global-set-key (kbd "M-x") 'helm-M-x)
        (global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
        (global-set-key (kbd "C-x C-f") 'helm-find-files)
        (helm-mode 1)

        (add-to-list 'display-buffer-alist
          `(,(rx bos "*helm" (* not-newline) "*" eos)
          (display-buffer-in-side-window)
          (inhibit-same-window . t)
          (window-height . 0.4)))

        (global-set-key (kbd "C-x C-b") 'ibuffer)
        (autoload 'ibuffer "ibuffer" "List Buffers." t)
      '';
      extraPackages = epkgs: with epkgs; [
        blacken
        csv-mode
        docker
        docker-cli
        eyebrowse
        company-jedi
        dockerfile-mode
        elpy
        f3
        flycheck
        git-link
        go-mode
        graphviz-dot-mode
        helm
        helm-company
        helm-projectile
        helm-selector
        ipython-shell-send
        jedi
        jinja2-mode
        json-mode
        magit
        magit-find-file
        markdown-mode
        nix-mode
        nord-theme
        org
        projectile
        python-black
        python-insert-docstring
        python-mode
        python-pytest
        terraform-doc
        terraform-mode
        transient
        yaml-mode
      ];
    };
    readline.enable = true;
    ssh = {
      enable = true;
    };
    tmux = {
      enable = true;
      clock24 = true;
      disableConfirmationPrompt = true;
      historyLimit = 50000;
      keyMode = "emacs";
      mouse = true;
      newSession = true;
      plugins = with pkgs; [
        tmuxPlugins.yank
      ];
      shell = "${pkgs.zsh}/bin/zsh";
      shortcut = "a";
      terminal = "screen-256color";
    };
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      defaultKeymap = "emacs";
      dotDir = ".config/zsh";
      history.save = 100000;
      historySubstringSearch.enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "branch"
          "colorize"
          "docker"
          "git"
          "helm"
          "kubectl"
          "poetry"
          "terraform"
        ];
      };
      sessionVariables = {
        EDITOR = "emacsclient -t";
      };
      shellAliases = {
        # colorize where possible
        ls = "ls -G";
        diff = "colordiff";
        master = "git checkout master";
        gcf = "git diff-tree --no-commit-id --name-only -r $1";
      };
    };
  };
  home.packages = with pkgs; [
    autoconf
    buildkit
    bzip2
    chez
    colordiff
    csview
    docker
    docker-compose
    freetds
    gcc
    ghostscript
    google-cloud-sdk
    graphviz
    jq
    jsonnet
    kind
    kubectl
    kubernetes-helm
    kustomize
    micromamba
    minikube
    mysql80
    nix-index
    packer
    pandoc
    parquet-tools
    poetry
    postgresql
    pre-commit
    pyenv
    python39
    sqlite
    terraform
    tex
    tflint
    twine
    vault
    watch
    wget
    zlib
    zstd
  ];
  home.stateVersion = "22.11";
}
