# speedtest-cli-bash
Bash script to run regular speed tests using the SpeedTest CLI tool and store the results both locally and in a GitHub repo.

## Requirements
- The excellent [speedtest-cli](https://github.com/sivel/speedtest-cli "speedtest-cli GitHub page").
- Python with pip (if on Windows you will probably need to install this - download [here](https://www.python.org/downloads 'Python.org Download page'). PIP should be included as part of the Python install.
- Make sure that you have a Python entry in your PATH! Windows requires an environmental variable to be set at `My Computer ‣ Properties ‣ Advanced ‣ Environment Variables`. There's a few Stack Overflow questions about this.

## Instructions
- Install the speedtest cli with PIP by using `pip install speedtest-cli`
- If you want to push to GitHub then you'll need to set up a repo after you clone.
- Empty out the speedtestresults.txt file and confirm that this is in the same directory as your bash file.
- By default the script will simply print the results to the terminal. To save your results you need to use an optional parameter flag when starting the script.
- Optional flags to be passed => `-s, -g, -c, -o, -h`. See below for what they do.
- Run `bash-speedtest-cli.sh` in your terminal, using any flags as required.

## Config
- The three optional parameter flags control how you want the script to run. 
```
-s => Save the results to your local file.
-g => Save the results to your local file and also push to your GitHub repo.
-c => Receive the results in a CSV format instead of JSON
-o => Run the test only once
-h => Get script usage 
```
- Using multiple flags is fine, but avoid using both `-s` & `-g` as this will duplicate your results.
- There are some script variables used to control the time format, wait time between tests and the results filename. Find them here:
```
currentTime
waitTime
resultsFile
```
- The wait time is in seconds.
