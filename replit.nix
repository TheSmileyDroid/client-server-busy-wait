{ pkgs }: {
	deps = [
		pkgs.nodePackages.prettier
		pkgs.neovim
  pkgs.entr
  pkgs.clang_12
		pkgs.ccls
		pkgs.gdb
		pkgs.gnumake
	];
}