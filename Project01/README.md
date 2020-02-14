# CS 1XA3: PROJECT 01
### *Lauren Zanini (Mac-ID: zaninil)*
This file will describe usage of the script, the features it contains, and any reference pages used to construct the code.

### USAGE OF THE SCRIPT
This script created on the file **project_analyze.sh** contains 4 features and 3 inputs.
The very first part checks if the user input is equal to zero or greater than one (for the parameter), using:

	if [ "$#" -eq 0 ] || [ "$#" -gt 1 ] ; then
	echo "input invalid"

The code can be run with 3 possible inputs / arguments and each are meant to be run separately.
The inputs are **"fix"**, **"merge"**, and **"file-count"**.
This can be done in the CS1XA3 directory, where the git repository was cloned, as so:

	chmod +x CS1XA3/Project01/project_analyze.sh
	./CS1XA3/Project01/project_analyze.sh fix
	./CS1XA3/Project01/project_analyze.sh merge
	./CS1XA3/Project01/project_analyze.sh file-count

These inputs must be tested separately, and multiple arguments cannot be run at the same time.
If any other arguments are inputted other than the three defined above, the code will return **"invalid input"**.

### FEATURE 01
**Description:** 
- This feature is the **"FIX ME Log"**.
- It finds all the files in the repository with the word **"#FIXME"**, and puts those files in a list called **"fixme.log"**, each separated by a newline.

**Execution:** 
- This feature can be executed by using the input **"fix"** and running the code shown in the **"USAGE OF THE SCRIPT"** section.

**References:** 
Some webpages I used for reference when writing my code include...
- [SuperUser](https://superuser.com/questions/414465/how-to-overwrite-file-using-echo)
- [COMMANDLINEFU.COM](https://www.commandlinefu.com/commands/view/12833/get-a-list-of-all-todofixme-tasks-left-to-be-done-in-your-project)
- https://osr507doc.xinuos.com/en/OSTut/Reading_just_the_first_or_last_lines_of_a_file.html
- [nixCraft](https://www.cyberciti.biz/faq/bash-get-basename-of-filename-or-directory-name/)
- [mac1xa3.ca_lab05_slide7-1](https://mac1xa3.ca/Slides/Week05/1XA3_Lab_Week05.html)

### FEATURE 02
**Description:**
- This feature is called **"Checkout Latest Merge"**.
- It finds the most recent commit with the word **"merge"**, (case insensitive), and automatically checks out that commit.
- The flag **-1** cuts the string at the last commit, only displaying the most recent one. 
- The flag **-i** ignores case sensitivity.

**Execution:**
- This feature can be executed by using the input **"merge"**, and running the respective code shown in the **"USAGE OF THE SCRRIPT"** section above.

**References:** 
Some references I used when writing this portion of the code include...
- [W3docs-GitLog](https://www.w3docs.com/learn-git/git-log.html)
- [mac1xa3.ca_lab05_slide3-1](https://mac1xa3.ca/Slides/Week05/1XA3_Lab_Week05.html)

### FEATURE 03
**Description:**
- This feature is called **"File Type Count"**.
- It uses the **read** command to prompt the user for input, a file extension.
- The feature outputs the number of files in the repository that have said extension.

**Execution:**
- This feature can be executed using the input **"file-count"**, and running the respective code shown in the **"USAGE OF THE SCRIPT"** section above.

**References:**
Some resources I used when writing this portion of the code include...
- [ComputerHope](https://www.computerhope.com/unix/bash/read.htm)
- [LinuxHint](https://linuxhint.com/bash_read_command/)
-[UnixLinuxForumsSearch](https://www.unix.com/unix-for-dummies-questions-and-answers/111362-pipe-results-grep-command-ls-comand.html)

### CUSTOM FEATURE 01
**Description:**
- This feature will order every file in the repository alphabetically.
- Create a file CS1XA3/Project01/alphabetical.log if it doesn't exist, overwrite it if it does.
- This feature will append the names of these files to **"alphabetical.log"**, separated by a newline.

### CUSTOM FEATURE 02
**Description:**
- This feature will find all files that have the same name but different extensions.
- Create a file CS1XA3/Project01/samename.log if it doesn't exist, overwrite it if it does.
- This feature will append the number of files with the same name but different extensions, and last line of each file to **"samename.log"**. 
