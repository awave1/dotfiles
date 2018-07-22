link_file() {
  dir=$1
  source_dir=$PWD/$dir
  for file in $(ls $source_dir); do
    filename=$(basename $file)
    echo $file
  done
}

