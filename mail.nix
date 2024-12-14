{ pkgs, ... }:
{
  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  # https://github.com/nix-community/home-manager/blob/master/tests/modules/programs/neomutt/neomutt-with-binds.nix
  # https://github.com/nix-community/home-manager/blob/master/modules/programs/neomutt.nix
  programs.neomutt = {
    enable = true;
    binds = [
        {
          action = "sidebar-prev";
          key = "K";
          map = [ "index" "pager" ];
        }
        {
          action = "sidebar-next";
          key = "J";
          map = [ "index" "pager" ];
        }
        {
          action = "sidebar-open";
          key = "L";
          map = [ "index" "pager" ];
        }
        {
          action = "noop";
          key = "g";
          map = [ "index" "pager" ];
        }
        {
          action = "noop";
          key = "gg";
          map = [ "index" "pager" ];
        }
        {
          action = "first-entry";
          key = "gg";
          map = [ "index" ];
        }
        {
          action = "last-entry";
          key = "G";
          map = [ "index" ];
        }
        {
          action = "noop";
          key = "\\Cu";
          map = [ "index" "pager" ];
        }
        {
          action = "half-up";
          key = "\\Cu";
          map = [ "index" "pager" ];
        }
        {
          action = "noop";
          key = "\\Cd";
          map = [ "index" "pager" ];
        }
        {
          action = "half-down";
          key = "\\Cd";
          map = [ "index" "pager" ];
        }
    ];
    sidebar.enable = true;
    sidebar.format = "%D %* [%?N?%N / ?%S]";
    sort = "reverse-date-received";
    extraConfig =''
      set index_format = "[%Z] %?X?A&-? %D  %-20.20F  %s"
      set date_format = "%y/%m/%d %H:%M"
      set folder_format="%C %d %f %m %s"
    '';
  };
  programs.notmuch = {
    enable = true;
    hooks = {
      preNew = "mbsync --all";
    };
  };
  accounts.email = {
    accounts.root = {
      address = "<mail>";
      imap.host = "<host>";
      mbsync = {
        enable = true;
        create = "maildir";
      };
      msmtp.enable = false;
      notmuch.enable = true;
      neomutt.enable = true;
      primary = true;
      realName = "Root";
      passwordCommand = "gopass show --password mail";
      smtp = {
        host = "<host>";
      };
      userName = "<name>";
    };
  };
}
