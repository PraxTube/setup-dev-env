alias setclip="xclip -selection c -rmlastnl"

compare_str() {
  if [ "$1" = "$2" ]; then
    echo "+ Equal."
  else
    echo "- NOT equal!!!"
  fi
}

alias vim=~/Downloads/nvim.appimage
alias vieb=~/Downloads/Vieb-9.6.0.AppImage 

# Rust crates
alias ls=exa
alias cat=bat
alias du=dust
alias top=btm
alias grepp=grep
alias grep=rg

alias ndays=/home/rancic/code/rust/projects/ndays/target/release/ndays

# FFMPEG
cvideo() {
  ffmpeg -i "$1" -c:v libx264 -crf 23 -preset medium -c:a aac -b:a 128k "$2"
}

hflip_video() {
  ffmpeg -i "$1" -vf "hflip" -c:v libx264 -crf 23 -preset medium -c:a aac -b:a 128k "$2"
}

vid2aud() {
  ffmpeg -i "$1" -vn -acodec libmp3lame "$2"
}

merge_aud() {
  ffmpeg -i "$1" -i "$2" -filter_complex "[0:a]adelay=1000|1000[a1];[1:a]volume=0.5[a2];[a1][a2]amix=inputs=2:duration=first:dropout_transition=3" "$3"
}

truncate_silence() {
  ffmpeg -i "$1" -af silenceremove=start_periods=1.5:stop_periods=-1:stop_duration=0.2:start_threshold=-55dB:stop_threshold=-55dB "$2"
}

double_audio() {
  ffmpeg -i "$1" -filter:a "volume=2" "$2"
}

# Misc
qrcode() {
  qrencode -t utf8 "$1"
}

mass_rename() {
  if [ $# -ne 1 ]; then
    echo "Usage: mass_rename <extension>"
    return 1
  fi

  extension=$1
  i=1
  for item in *; do
    if [ -f "$item" ] && [ "${item##*.}" = "$extension" ]; then
      mv "$item" "$i.$extension"
      let i++
    fi
  done
}

dmu() {
  yt-dlp -x --audio-format wav "$1" --no-keep-fragments --no-keep-video
}

wttr() {
  curl wttr.in/?T
}

# Croatian
hrv() {
  output=$(dict -d fd-hrv-eng "$1")
  echo "$output" | tee /dev/tty | xclip -selection clipboard
}

mbox() {
  matchbox_server 192.168.178.30:3536
}

set_ping() {
  sudo tc qdisc add dev enp3s0 root netem delay "$1"ms
}

reset_ping() {
  sudo tc qdisc del dev enp3s0 root
}

copyace() {
  reset_ping
  scp target/release/ace-of-the-heavens anto@anto:~/
}

buildace() {
  cargo build --release
  copyace
  cargo run --release
}
