# CS 1XA3: PROJECT 01 
***
### *Lauren Zanini (Mac-ID: zaninil)*
This file will describe usage of the script, the features it contains, and any reference pages used to construct the code.
***
### USAGE OF THE SCRIPT
6.1
This script created on the file **project_analyze.sh** contains features 6.1-6.7, two custom features, and 8 inputs.
The very first part checks if the user input is equal to zero or greater than one (for the parameter), using:

	if [ "$#" -eq 0 ] || [ "$#" -gt 1 ] ; then
	echo "input invalid"

The code can be run with 8 possible inputs / arguments and each are meant to be run separately.
The inputs are **"fix"**, **"merge"**, **"file-count"**, **"execute"**, **"size"**, **"tag"**, **"alphabet"**, and **'samename'**.
This can be done in the CS1XA3 directory, where the git repository was cloned, as so:

	chmod +x CS1XA3/Project01/project_analyze.sh
	./CS1XA3/Project01/project_analyze.sh fix
	./CS1XA3/Project01/project_analyze.sh merge
	./CS1XA3/Project01/project_analyze.sh file-count
	./CS1XA3/Project01/project_analyze.sh execute
        ./CS1XA3/Project01/project_analyze.sh size
        ./CS1XA3/Project01/project_analyze.sh tag
        ./CS1XA3/Project01/project_analyze.sh alphabet
        ./CS1XA3/Project01/project_analyze.sh samename

These inputs must be tested separately, and multiple arguments cannot be run at the same time.
If any other arguments are inputted other than the eight defined above, the code will return **"invalid input"**.
***
### FEATURE 01
**Description:** 
6.2
- This feature is the **"FIX ME Log"**.
- It finds all the files in the repository with the word **"#FIXME"**, and puts those files in a list called **"fixme.log"**, each separated by a newline.

**Execution:** 
This feature can be executed by using the input **"fix"** and running the code shown in the **"USAGE OF THE SCRIPT"** section.

**References:** 
The resources I used when writing this portion of the code include...
- [SuperUser Overwrite file using echo](https://superuser.com/questions/414465/how-to-overwrite-file-using-echo)
- [COMMANDLINEFU.COM list of todo/fixme](https://www.commandlinefu.com/commands/view/12833/get-a-list-of-all-todofixme-tasks-left-to-be-done-in-your-project)
- [Reading first/last lines of a file](https://osr507doc.xinuos.com/en/OSTut/Reading_just_the_first_or_last_lines_of_a_file.html)
- [nixCraft get basename](https://www.cyberciti.biz/faq/bash-get-basename-of-filename-or-directory-name/)
- [mac1xa3.ca_lab05_slide7-1](https://mac1xa3.ca/Slides/Week05/1XA3_Lab_Week05.html)
***
### FEATURE 02
**Description:**
6.3
- This feature is called **"Checkout Latest Merge"**.
- It finds the most recent commit with the word **"merge"**, (case insensitive), and automatically checks out that commit.
- The flag **-1** cuts the string at the last commit, only displaying the most recent one. 
- The flag **-i** ignores case sensitivity.

**Execution:**
This feature can be executed by using the input **"merge"**, and running the respective code shown in the **"USAGE OF THE SCRRIPT"** section above.

**References:** 
The resources I used when writing this portion of the code include...
- [W3docs-GitLog](https://www.w3docs.com/learn-git/git-log.html)
- [mac1xa3.ca_lab05_slide3-1](https://mac1xa3.ca/Slides/Week05/1XA3_Lab_Week05.html)
***
### FEATURE 03
**Description:**
6.5
- This feature is called **"File Type Count"**.
- It uses the **read** command to prompt the user for input, a file extension.
- The feature outputs the number of files in the repository that have said extension.

**Execution:**
This feature can be executed using the input **"file-count"**, and running the respective code shown in the **"USAGE OF THE SCRIPT"** section above.

**References:**
The resources I used when writing this portion of the code include...
- [ComputerHope RRead Command](https://www.computerhope.com/unix/bash/read.htm)
- [LinuxHint Bash Read Command](https://linuxhint.com/bash_read_command/)
- [UnixLinuxForumsSearch Pipe Grep ls](https://www.unix.com/unix-for-dummies-questions-and-answers/111362-pipe-results-grep-command-ls-comand.html)
***
### FEATURE 04
***Description:***
6.7
- This feature is called **"Switch to Executable"**.
- It uses the **read** command to prompt the user for input, the user will either input **"c"** for **Change**, or **"r"** for **Restore**.
- If the user inputs **"c"**, the feature changes the permissions for each shell script so that only the people with write permissions also have executable permissions. 
- If the userr inputs **"c"**, it also stores a log of the file (the shell script) and its original permissions in **"permissions.log"**.
- If the user inputs **"r"**, the feature restores each file (shell script) to its original permissions.

**Execution:**
This feature can be executed using the input **"execute"**, and running the respective code shown in the **"USAGE OF THE SCRIPT"** section above.

**References:**
The resources I used when writing this portion of the code include...
- [mac1xa3.ca lab05 slide5-2 slide7-1](https://mac1xa3.ca/Slides/Week05/1XA3_Lab_Week05.html)
- [Stack Exchange Octal File Permissions](https://askubuntu.com/questions/152001/how-can-i-get-octal-file-permissions-from-command-line)
- [Stack Exchange Arithmetic Loop](https://unix.stackexchange.com/questions/410636/how-can-i-create-an-arithmetic-loop-in-a-posix-shell-script)
- [Linuxize](https://linuxize.com/post/bash-check-if-file-exists/)
- [Stack Overflow Split One String to Multiple Variables](https://stackoverflow.com/questions/10520623/how-to-split-one-string-into-multiple-variables-in-bash-shell)
- [Geeks for Geeks Cut Command Linux](https://www.geeksforgeeks.org/cut-command-linux-examples/)
- [Stack Exchange Executable](https://askubuntu.com/questions/229589/how-to-make-a-file-e-g-a-sh-script-executable-so-it-can-be-run-from-a-termi)
- [Stack Exchange Restore File Permissions](https://unix.stackexchange.com/questions/504934/how-to-restore-file-permissions-to-their-default-following-chmod-r-777)
- Mark Hutchison helped me with this feature, MACID: hutchm16
***
### FEATURE 05
**Description:**
6.4
- This feature is called **"File Size List"**.
- It lists all the files in the repository (not the directories) and their sizes, in **human readable format**.
- This feature lists the files from largest to smallest.
- This feature includes everything in the git directory. 

**Execution:** 
This feature can be executed using the input **"size"**, and running the respective code shown in the **"USAGE OF THE SCRIPT"** section above.

**References:**
The resources I used when writing this portion of the code include...
- [mac1xa3.ca lab05 slides5-2 slides6-1](https://mac1xa3.ca/Slides/Week05/1XA3_Lab_Week05.html)
- [Geeks for Geeks du Command](https://www.geeksforgeeks.org/du-command-linux-examples/)
- [nixCraft Sort du -h by size](https://www.cyberciti.biz/faq/how-do-i-sort-du-h-output-by-size-under-linux/)
- [Sort Manual](https://ss64.com/bash/sort.html)
- [Xargs Manual](https://ss64.com/bash/xargs.html)
***
### FEATURE 06
**Description:**
6.6
- This feature is called **"Find Tag"**.
- It uses the **read** command to prompt the user for input, any single word, a Tag. 
- The feature finds all of the lines that begin with a comment and include said Tag in all of the python files in the repository.
- The feature creates a file called **"Tag.log"** if it does not already exist, and it overwrites it if it does, and appends these lines to the file. 

**Execution:**
This feature can be executed using the input **"tag"**, and running the respective code shown in the **"USAGE OF THE SCRIPT"** section above.

**References:**
The resources I used when writing this portion of the code include...
- [mac1xa3.ca lab05 slide5-2 slide7-1](https://mac1xa3.ca/Slides/Week05/1XA3_Lab_Week05.html)
- [Computer Hope egrep Commands](https://www.computerhope.com/unix/uegrep.htm)
- [egrep Manual](https://linux.die.net/man/1/egrep)
- [mac1xa3.ca lecture05](https://mac1xa3.ca/Slides/Week05/1XA3_Lecture_Week05.html)
- Mark Hutchison helped me with the egrep, MACID: hutchm16
***
### CUSTOM FEATURE 01
**Description:**
01
- This feature is called **"Alphabetical Log"**. 
- This feature will order every file in the repository alphabetically.
- Create a file CS1XA3/Project01/alphabetical.log if it doesn't exist, overwrite it if it does.
- This feature will append the names of these files to **"alphabetical.log"**, separated by a newline.

**Execution:** 
This feature can be executed using the input **"alphabet"**, and running the respective code shown in the **"USAGE OF THE SCRIPT"** section above.

**References:**
The resources I used when writing this portion of the code include...
- [lostsaloon Sort Output of ls](https://www.lostsaloon.com/technology/how-to-sort-the-output-of-ls-in-linux/)
- [Stack Exchange Sort Alphabetically](https://askubuntu.com/questions/662339/sort-files-alphabetically-before-processing)
***
### CUSTOM FEATURE 02
**Description:**
02
- This feature is called **"Same Name Log"**
- This feature will find all files that have the same name but different extensions.
- Create a file CS1XA3/Project01/samename.log if it doesn't exist, overwrite it if it does.
- This feature will append the number of files with the same name but different extensions, the names of the files, and last line of each file to **"samename.log"**. 

**Execution:**
This feature can be executed using the input **"samename"**, and running the respective code shown in the **"USAGE OF THE SCRIPT"** section above.

**References:**
The resources I used when writing this portion of the code include...
- [Stack Exchange Duplicate Files](https://superuser.com/questions/1365853/osx-command-line-find-duplicate-filenames-with-different-extensions)
- [Stack Exchange Last Line of File](https://unix.stackexchange.com/questions/286544/how-to-extract-first-and-last-lines-in-a-file)
- [uniq Manual](https://ss64.com/bash/uniq.html)
***
### CONCLUDE
All other inputs that are undefined will return **"invalid input."**
***
