function proxy-env
  if test -z "$TARGET_PROXY"
    set TARGET_PROXY "http://127.0.0.1:1081"
  end

  if not set -q argv[1]
    echo "error: no command"
    return 1
  end

  if test $argv[1] = "help" || test $argv[1] = "-help" || test $argv[1] = "--help"
    echo "Commands:"
    echo "  status echo proxy environment variables"
    echo "  on     set proxy environment variables"
    echo "  off    remove proxy environment variables"
    echo ""
    echo "Install example:"
    echo "  ln -s \$PWD/proxy-env.fish \$HOME/.config/fish/functions/proxy-env.fish"
    return 0
  end


  if test $argv[1] = "on"
    export http_proxy=$TARGET_PROXY
    export https_proxy=$http_proxy
    export HTTP_PROXY=$http_proxy
    export HTTPS_PROXY=$http_proxy
    return 0
  end

  if test $argv[1] = "off"
    set -e http_proxy
    set -e https_proxy
    set -e HTTP_PROXY
    set -e HTTPS_PROXY
    return 0
  end

  if test $argv[1] = "status"
    echo http_proxy = $http_proxy
    echo http_proxy = $http_proxy
    echo https_proxy = $https_proxy
    echo HTTP_PROXY = $HTTP_PROXY
    echo HTTPS_PROXY = $HTTPS_PROXY
    return 0
  end

  echo "error: unknown command \"$1\""
  return 1
end
