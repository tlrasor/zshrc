# custom functions available everywhere
convert_iso() {
  let $# || { echo Usage: convert_iso pathToIsoFile pathToOutputFile; return 1;}
  hdiutil convert -format UDRW -o $2 $1
}

sshak() {
  let $# || { echo Usage: sshak hostname; return 1;}
  cat ~/.ssh/id_rsa.pub | ssh $1 "(cat > tmp.pubkey ; mkdir -p .ssh ; touch .ssh/authorized_keys ; sed -i.bak -e '/$(awk '{print $NF}' ~/.ssh/id_rsa.pub)/d' .ssh/authorized_keys;  cat tmp.pubkey >> .ssh/authorized_keys; rm tmp.pubkey)"
}

sshak_argo() {
  let $# || { echo Usage: sshak hostname; return 1;}
  cat ~/.ssh/argo_deploy.rsa.pub | ssh $1 "(cat > tmp.pubkey ; mkdir -p .ssh ; touch .ssh/authorized_keys ; sed -i.bak -e '/$(awk '{print $NF}' ~/.ssh/id_rsa.pub)/d' .ssh/authorized_keys;  cat tmp.pubkey >> .ssh/authorized_keys; rm tmp.pubkey)"
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
      curl -sLw "\n" "https://www.toptal.com/developers/gitignore/api/$str" >> .gitignore
    else
        command git "$@"
    fi
}

ctop() {
    docker run --name=ctop \
        --rm -ti \
        -v /var/run/docker.sock:/var/run/docker.sock \
        quay.io/vektorlab/ctop:latest
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

