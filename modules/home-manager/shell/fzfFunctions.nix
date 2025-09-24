{ pkgs, lib, config, ... }:

{
    sshf = ''
      sshf()
      {
        [ -f "$HOME/.ssh/hosts" ] || return
        host=$(fzf $fzfstyle --prompt='ssh ' < "$HOME/.ssh/hosts" )
        [ "$host" != "" ] && ssh "$(echo "$host" | cut -f2 -d ' ')"
      }
    '';

    p = ''
      p()
      {
        [ -d "$HOME/projects" ] || return
        cd "$HOME/projects/$(find "$HOME/projects" -mindepth 1 -maxdepth 1 -type d -printf '%T@ %f\n' | sort --reverse -k1 -n | cut -f 2 -d ' ' | fzf || return)"
        [ -f './init.sh' ] && source './init.sh'
      }
    '';
}
