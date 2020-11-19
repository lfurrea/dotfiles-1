asdf_dir=$(brew --prefix asdf)/asdf.sh

if test -f $asdf_dir
then
  source $asdf_dir
fi
