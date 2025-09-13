{ pkgs, lib, config, ... }:

{
  sxiv = "nsxiv";
  x = "xrandr";
  psu = "ps -fwwu $(whoami)";
  
  wcl = "wc -l";
  wcc = "wc -c";
  wcw = "wc -w";
  
  s = "sudo";
  sv = "sudoedit";
  
  # Git
  g = "git";
  gcl = "git clone";
  gre = "git remote";
  gs = "git status";
  gd = "git diff";
  ga = "git add";
  gaa = "git add --all";
  gc = "git commit";
  gcm = "git commit -m";
  gl = "git log";
  glo = "git log --oneline --graph";
  gpp = "git pull && git push";
  gpl = "git pull";
  gps = "git push";
  gb = "git branch";
  gch = "git checkout";
  gm = "git merge";

}
