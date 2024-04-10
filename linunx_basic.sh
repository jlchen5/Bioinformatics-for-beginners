#!/bin/bash

ls -a # List all files in the directory, including hidden files starting with .
ls -A # List files other than . and ..
ls -r # Reverse order
ls -t # Sort by modification time
ls -S # Sort by file size
ls -h # Display sizes in a human-readable format
ls -l # Detailed listing including file permissions, owner, file size, etc.

cd /  # Change to the root directory
cd ~  # Change to the "home" directory, equivalent to cd command (can omit ~)
cd -  # Change to the previous working directory
cd !$ # Use the last command's argument as the argument for cd

pwd   # Command to view the current working directory path

mkdir t # Create a folder named 't' in the current working directory
mkdir -p /tmp/test/t1/t # Create a path 'test/t1/t' in the tmp directory; create if it doesn't exist

rm -i *.log # Delete any .log files, prompt for confirmation before each deletion
rm -rf test # Delete the test subdirectory and all files within it without confirmation
rm -- -f*   # Delete files starting with -f
rmdir t     # Delete the folder named 't' in the current working directory

mv test.log test1.txt # Rename the file test.log to test1.txt
mv log1.txt log2.txt log3.txt /test3/ # Move files log1.txt, log2.txt, log3.txt to the root's test3 directory
mv -i log1.txt log2.txt # Rename file1 to file2, prompt for confirmation if file2 already exists
mv * ../ # Move all files in the current folder to the parent directory

cp -ai a.txt test/ # Copy a.txt to the test directory, preserve original file timestamp, prompt for overwrite if the original file exists
cp -s a.txt link_a.txt # Create a symbolic link for a.txt named link_a.txt

cat filename # Display the entire content of a file
cat file1 file2 > file # Concatenate several files into one file
cat -n log2012.log > log2013.log # Add line numbers to the content of log2012.log and save it as log2013.log
cat -b log2012.log log2013.log > log.log # Add line numbers (skip blank lines) from log2012.log and log2013.log and append to log.log

more +3 text.txt  # Display content starting from line 3 in a file
ls -l | more -5   # Display detailed information about files in the current directory, show 5 lines at a time
ps -aux | less -N # View process information with ps and paginate using less
less 1.log 2.log  # View content of multiple files

head 1.log -n 20 # Display the first 20 lines of 1.log
head -c 20 log2014.log # Display the first 20 bytes of log2014.log
head -n -10 t.log # Display the last 10 lines of t.log
tail -f 1.log # Display the last 10 lines of 1.log in real-time
ping 127.0.0.1 > ping.log & # Continuously read and append increasing content to ping.log
tail -f ping.log # Run in the background: check with jobs -l or bring to the foreground with fg.

tar -c # Create a new compressed file
tar -f # Specify the compressed file
tar -r # Add files to an existing compressed file
tar -u # Add changed and existing files to the compressed package
tar -x # Extract files from the compressed package
tar -t # Display the contents of the compressed file
tar -z # Support gzip compression
tar -j # Support bzip2 compression
tar -Z # Support compress decompression
tar -v # Display the operation process

chown -c # Display changed information
chown -R # Process all files in the specified directory and its subdirectories
chown -c user:group log2012.log # Change owner and group, and display change information
chown -c :mail t.log # Change the file group
chown -cR user: test/ # Change the owner and group of the folder and its subdirectories to mail

which   # View the location of an executable file
whereis # View the location of a file
locate  # View the location of a file using a database
find    # Search the hard drive for file names

find -name # Search for files by name
find -perm # Search for files by permission
find -user # Search for files by owner
find -group  # Search for files by group
find -type  # Search for files of a certain type, such as:
   # b - block device file
   # d - directory
   # c - character device file
   # l - symbolic link file
   # p - pipe file
   # f - regular file
find -size n   # n:[c] Search for files of length n blocks, with c indicating file size in bytes
find -amin n   # Search for files accessed in the last N minutes
find -atime n  # Search for files accessed in the last n*24 hours
find -cmin n   # Search for files with changed status in the last N minutes
find -ctime n  # Search for files with changed status in the last n*24 hours
find -mmin n   # Search for files with changed data in the last N minutes
find -mtime n  # Search for files with changed data in the last n*24 hours
# (Use a minus sign '-' to specify files changed within the last n days and a plus sign '+' for files changed more than n days ago.)
find -maxdepth n # Maximum depth to search for directories
find -prune    # Option to specify directories to ignore; use with caution when using -depth option, as -prune may be ignored by find
find -newer    # To find files newer than one file but older than another, use -newer option

grep ^gene  filename  # Anchor at the beginning of a line; e.g., '^gene' matches all lines starting with gene.
grep gene$    # Anchor at the end of a line; e.g., 'gene$' matches all lines ending with gene.
grep .    # Match any non-newline character; e.g., 'gr.p' matches gr followed by any character, then p.
grep *    # Match zero or more occurrences of the preceding character; e.g., '*grep' matches lines with zero or more spaces followed by grep.
grep .*   # Used together, represent any character.
grep []   # Match a specified range of characters; e.g., '[Gg]rep' matches Grep and grep.
grep [^]  # Match a character not in the specified range; e.g., '[^A-FH-Z]rep' matches lines starting with a letter not in A-R and T-Z, followed by rep.
grep \(..\)    # Mark matching characters; e.g., '\(love\)' marks love as 1.
grep \<        # Anchor at the beginning of a word; e.g., '\<grep' matches lines containing grep at the beginning of a word.
grep \>        # Anchor at the end of a word; e.g., 'grep\>' matches lines containing grep at the end of a word.
grep x\{m\}    # Repeat character x m times; e.g., '0\{5\}' matches lines with exactly 5 occurrences of 0.
grep x\{m,\}   # Repeat character x at least m times; e.g., '0\{5,\}' matches lines with at least 5 occurrences of 0.
grep x\{m,n\}  # Repeat character x at least m times but not more than n times; e.g., '0\{5,10\}' matches lines with 5 to 10 occurrences of 0.
grep \w        # Match word and digit characters, i.e., [A-Za-z0-9]; e.g., 'G\w*p' matches G followed by zero or more word or digit characters, then p.
grep \W        # Inverse of \w, match one or more non-word characters, such as dots, periods, etc.
grep \b        # Word boundary; e.g., '\bgrep\b' matches only grep.

wc -c # Count bytes
wc -l # Count lines
wc -m # Count characters
wc -w # Count words; a word is defined as a string separated by whitespace, tabs, or newline characters
