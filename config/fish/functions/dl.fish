function dl
    set prev (pwd)
    set songs "$HOME/Documents/Music/Songs"
    cd $songs
    youtube-dl -x --audio-format \"wav\" $argv
    cd $prev
end

