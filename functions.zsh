# custom functions available everywhere
convert_iso() {
  let $# || { echo Usage: convert_iso pathToIsoFile pathToOutputFile; return 1;}
  hdiutil convert -format UDRW -o $2 $1
}

makeStaticM4v(){
    let $# || { echo Usage: makeStaticM4v jpgFilePath audioFilePath; return 1;}
    convert -resize 1280x720 -gravity center -extent 1280x720 -background black $1 /tmp/video.jpg
    ffmpeg -loop 1 -framerate 2 -i /tmp/video.jpg -i $2 -c:v libx264 -preset medium -tune stillimage -crf 18 -c:a aac -b:a 128k -shortest -pix_fmt yuv420p -movflags +faststart $2.mp4
    rm /tmp/video.jpg
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

ctop() {
    docker run --name=ctop \
        --rm -ti \
        -v /var/run/docker.sock:/var/run/docker.sock \
        quay.io/vektorlab/ctop:latest
}
