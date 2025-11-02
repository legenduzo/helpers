This repository is designed to hold all the helper functions that either automates my work or abstracts away needless repetitive work.

Feel free to use, contribute to, or suggest improvements for this project.

Thanks.

## File names and meanings
Method - The Filenames will be designed to look like oversimplifications sometimes, but then, they follow what has come before. ls and pwd for example in unix-like operating systems.




#### g
This is used to execute `git` commands. It executes `git add .`, `git commit -m 'message'`, and `git push`.  
###### Usage Syntax  
> g 'commit message'.  



#### gv
This is used to execute compilation commands. It executes `gcc` and includes multiple error checks for the c89 target, then executes `valgrind` to check for memory leaks, and then executes `betty` to check for clean code practices.  
###### Usage Syntax
> gv `your_c_filename` `output_filename` `test_filename`  

Note that including `test_filename` is optional.

## Autocommit for windows
1. Create an empty `autocommit_registry` and an `autocommit.ps1` file in a location where you write your personal commands. It helps to have that folder as part of the PATH environment variables
2. Run `notepad $PROFILE` and append the autocommit part of windows_profile's content
3. Save and use `autocommit` command to activate when Powershell is active in a projet
