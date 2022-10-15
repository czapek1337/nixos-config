{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "master";
      core.editor = "${pkgs.nano}/bin/nano";
      user = {
        name = "Gabriel Waksmundzki";
        email = "czapek1337@gmail.com";
      };
    };
  };

  programs.nano.nanorc = ''
    set tabsize 2
    set tabstospaces
    set autoindent
  '';

  environment.systemPackages = with pkgs; [
    llvmPackages_14.bintools
    llvmPackages_14.clang
    llvmPackages_14.lld

    htop
    man-pages
    man-pages-posix
    nano
    neofetch
    nix-index
    p7zip
    psmisc
    ripgrep
    unzip
    wget
    xxd
  ];
}
