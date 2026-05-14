default:
  just --list

# Allow passing arguments to recipes
set positional-arguments

alias t := test
alias v := version
alias s := switch
alias r := remote

# Version control
# Automatically detect version information from git
# Falls back to timestamp if not in a git repository
version := if `git rev-parse --git-dir 2>/dev/null; echo $?` == "0" {
    `git describe --tags --always --dirty 2>/dev/null || echo "dev"`
} else {
    `date -u '+%Y%m%d-%H%M%S'`
}
git_commit := `git rev-parse --short HEAD 2>/dev/null || echo "unknown"`
git_branch := `git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown"`
build_time := `date -u '+%Y-%m-%d_%H:%M:%S'`
build_by := `whoami`

SSH_PORT := env_var_or_default("SSH_PORT","22")
REMOTE_HOST := "192.168.1.96"
REMOTE_USER := "root"
REMOTE_ADDR := REMOTE_USER + "@" + REMOTE_HOST

[group('build')]
[doc('Test Command')]
[confirm('Are you sure')]
[working-directory: 'secrets']
test dir="secrets":
    ls -la {{dir}}

[doc('Rebuild Switch OS')]
switch system="nixos":
    nh os switch -H {{system}} .

[doc('Rebuild without applying OS')]
dry system="nixos":
    nh os switch -H {{system}} . --dry -- --show-trace

[group('bump')]
bump package="":
    nix flake update {{package}}

# nix flake update https://github.com/Mic92/nix-update
update package="":
    nix-shell -p nix-update {{package}}

[group('bump')]
bump-nvim:
    nix flake update nixvim

[working-directory: 'secrets']
secrets:
    sops pacto/secrets.yaml

[working-directory: 'secrets']
secrets-update:
    sops updatekeys pacto/secrets.yaml

[group('remote')]
[confirm('Are you sure you want to install server remotely?')]
[doc('Cannibalize remote host')]
anywhere:
    nix run github:nix-community/nixos-anywhere -- --build-on remote --no-reboot --flake .#pi {{REMOTE_ADDR}} -p {{SSH_PORT}}

[group('remote')]
[doc('Build and switch to remote host')]
remote:
    NIX_SSHOPTS="-p {{SSH_PORT}}" nixos-rebuild switch --flake .#server --target-host {{REMOTE_ADDR}}

[doc('Generate Config Topology')]
topology:
    nix build .#topology.x86_64-linux.config.output

[doc('Build ISO')]
build-iso:
    nix build .#nixosConfigurations.live.config.system.build.isoImage

# Show version information
[doc('Version Information')]
version:
    @echo "Version:    {{version}}"
    @echo "Commit:     {{git_commit}}"
    @echo "Branch:     {{git_branch}}"
    @echo "Built:      {{build_time}}"
    @echo "Built by:   {{build_by}}"
