# custom functions
tophistory() {
  history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}' | sort -rn | head -n 30
}

# search keyword [path]
search() {
    arg=()
    if [ ! -z "$2" ]; then
        arg+=(-name $1)
        pattern=$2
    else
        pattern=$1
    fi

    /usr/bin/find ${arg[@]} -type f -exec grep -Hin1 "$pattern" {} \;
}

# sources a given set of files
# usage:
#    load file|regexp|path root
load() {
    regexp="$1"
    root="$PWD"
    if [ ! -z "$2" ]; then
        root="$2"
    fi
    if [ -e "$root" ]; then
        for f in $(find $root -print | grep "$regexp" | sort); do
            source "$f"
        done
    fi
}

convert_iso() {
  let $# || { echo Usage: convert_iso pathToIsoFile pathToOutputFile; return 1;}
  hdiutil convert --format UDRW -o $2 $1
}


makeStaticM4v(){
    let $# || { echo Usage: makeStaticM4v jpgFilePath audioFilePath; return 1;}
    convert -resize 1280x720 -gravity center -extent 1280x720 -background black $1 /tmp/video.jpg
    ffmpeg -loop 1 -framerate 2 -i /tmp/video.jpg -i $2 -c:v libx264 -preset medium -tune stillimage -crf 18 -c:a aac -b:a 128k -shortest -pix_fmt yuv420p -movflags +faststart $2.mp4
    rm /tmp/video.jpg
}


