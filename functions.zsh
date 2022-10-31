# custom functions available everywhere
convert_iso() {
  let $# || { echo Usage: convert_iso pathToIsoFile pathToOutputFile; return 1;}
  hdiutil convert -format UDRW -o $2 $1
}


sshak() {
  let $# || { echo Usage: sshak hostname; return 1;}
  cat ~/.ssh/id_rsa.pub | ssh $1 "(cat > tmp.pubkey ; mkdir -p .ssh ; touch .ssh/authorized_keys ; sed -i.bak -e '/$(awk '{print $NF}' ~/.ssh/id_rsa.pub)/d' .ssh/authorized_keys;  cat tmp.pubkey >> .ssh/authorized_keys; rm tmp.pubkey)"
}

vagrant() {
    if [[ $@ == "rebuild" ]]; then
        command vagrant destroy -f && vagrant up
    else
        command vagrant "$@"
    fi
}

git() {
    if [[ $1 == "cp" ]]; then
      shift
      let $# || { echo "git cp usage: branch:path output"; return 1;}
      [ -z "$1" ] && echo "No branch:path specified" && return 1;
      [ -z "$2" ] && echo "No output path specified" && return 1;
      command git show "$1" >"$2"
    elif [[ $1 == "deploy" ]]; then
      shift
      if [[ $1 == "start" ]]; then
        shift
        let $# || { echo "git deploy start usage: remote_addr remote_name"; return 1;}
        name=${PWD##*/}
        location=$1
        if [[ -z $2 ]]; then
          remote_name="production"
        else
          remote_name=$2
        fi
        git remote add $remote_name "deploy@$location:/home/deploy/apps/$name"
        git deploy setup -r "$remote_name"
        git deploy init

        sed -i.bak -e 's/^run deploy\/before_restart/#&/' -- "deploy/after_push" && rm -- "deploy/after_push.bak"
      else
        command git deploy $@
      fi
    elif [[ $1 == "ignore" ]]; then
      shift
      let $# || { echo "git ignore usage: git ignore language or os "; return 1;}
      old="$IFS"
      IFS=','
      str="$*"
      IFS=$old
      curl -sLw "\n" "https://www.toptal.com/developers/gitignore/api/$str" > .gitignore
    else
        command git "$@"
    fi
}

docker() {
    if [[ $1 == "compose" ]]; then
      shift
      command docker-compose $@
    else
      command docker "$@"
    fi
}

ctop() {
    docker run --name=ctop \
        --rm -ti \
        -v /var/run/docker.sock:/var/run/docker.sock \
        quay.io/vektorlab/ctop:latest
}

backgrounder() {
  $@ >/dev/null 2>&1 &
  echo $!
}

tarxz_dir() {
  let $# || { echo Usage: tarxz_dir source_dir output_name; return 1;}
  if [ -z $2 ]; then
    dest=$1
  else
    dest=$2
  fi
  tar -cvf - $1 | nice xz -9 -v -c --threads=0 - > $dest.tar.xz   
}

use_graal() {
  graal_version=$(sdk list java | grep "installed" | grep "grl" | sort -k3 -b -r -t '|'  | cut -d '|' -f 6 | tr -d \[:space:\])
  sdk use java $graal_version
}

use_ojdk() {
  ojdk_version=$(sdk list java | grep "installed" | grep "adpt" | sort -k3 -b -r -t '|'  | cut -d '|' -f 6 | tr -d \[:space:\])
  sdk use java $ojdk_version
}

swarm_deploy_init(){
  name=${PWD##*/}
  git remote add mormolykeia "deploy@mormolykeia1:/home/deploy/apps/$name"
  git deploy setup -r "mormolykeia"
  git deploy init

   sed -i.bak -e 's/^run deploy\/before_restart/#&/' -- "deploy/after_push" && rm -- "deploy/after_push.bak"
}

init_buildx() {
  docker buildx create --use --name mybuilder --driver-opt network=host --config=/Users/travis/Repos/zshrc/docker-buildx.toml
  docker buildx inspect --bootstrap
}

# pyenv() {
#   local command
#   command="${1:-}"
#   if [ "$#" -gt 0 ]; then
#     shift
#   fi

#   case "$command" in
#   rehash|shell)
#     eval "$(pyenv "sh-$command" "$@")"
#     ;;
#   *)
#     command pyenv "$command" "$@"
#     ;;
#   esac
# }
