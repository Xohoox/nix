{ pkgs, lib, config, ... }:

{
  myip = "https://checkipv4.dedyn.io/";
  myip6 = "curl https://checkipv6.dedyn.io/";
  wget = "wget --hsts-file=$XDG_CACHE_HOME/wget/wget-hsts";
  ":q" = "exit";
}
