{
  programs.git.settings.aliases = {
    br = "branch";
    ca = "commit -am";
    co = "checkout";
    d = "diff";
    df = "!git hist | peco | awk '{print $2}' | xargs -I {} git diff {}^ {}";
    edit-unmerged = "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; vim `f`";
    fuck = "commit --amend -m";
    graph = "log --all --decorate --graph";
    ps = "!git push origin $(git rev-parse --abbrev-ref HEAD)";
    pl = "!git pull origin $(git rev-parse --abbrev-ref HEAD)";
    af = "!git add $(git ls-files -m -o --exclude-standard | fzf -m)";
    st = "status";
    hist = ''
      log --pretty=format:"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)" --graph --date=relative --decorate --all
    '';
    llog = ''
      log --graph --name-status --pretty=format:"%C(red)%h %C(reset)(%cd) %C(green)%an %Creset%s %C(yellow)%d%Creset" --date=relative
    '';
    a = "commit --amend";
    adc = "commit --amend --no-edit";
    lbr = "branch --list --remote";
    c = "commit";
    cp = "cherry-pick";
    dc = "diff --cached";
    f = "fetch --prune";
    g = "log --graph --pretty=custom"; # Show custom graph.
    l = "log --pretty=custom"; # Show custom log.
    lc = "shortlog --email --numbered --summary"; # List contributors.
    lg = "log --graph --date=relative --pretty=format:'%C(bold blue)%h%C(reset) - %C(green)(%ar) %C(white)%s %C(dim white) [%an] %C(bold yellow)%d'";
    lgall = "log --all --graph --date=relative --pretty=format:'%C(bold blue)%h%C(reset) - %C(green)(%ar) %C(white)%s %C(dim white) [%an] %C(bold yellow)%d'";
    lh = "log -p -10"; # Show custom log.
    p = "pull";
    rank = "shortlog -sn --no-merges";
    rlc = "reset --hard HEAD~1"; # Remove last commit.
    s = "status";
    sres = "reset --soft HEAD~1"; # Undo last commit.
    res = "reset --hard HEAD";
    cl = "clean -fxd";
    sub = "submodule update --init --recursive";
    w = "instaweb --httpd=webrick"; # Start web-based visualizer.

    # Find commits by source code.
    cc = "!f() {
        git log --pretty=custom --decorate --date=short -S\"$1\";
        }; f";

    # Find commits by commit message.
    cm = "!f() {
        git log --pretty=custom --decorate --date=short --grep=\"$1\";
        }; f";

    # Credit an author on the latest commit.
    credit = "!f() {
        if [ -n \"$1\" ] && [ -n \"$2\" ]; then
            git commit --amend --author \"$1 <$2>\" -C HEAD;
        fi
        }; f";
  };
}
