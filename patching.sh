diff -e file1 next_version_file1 > diff_script

# make file1 look like next_version_file1
ed file1 < diff_script
