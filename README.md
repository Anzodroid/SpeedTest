# speedtest-cli-bash
Bash script to run regular speed tests using the SpeedTest CLI tool and store the results both locally and in a GitHub repo.

## Requirements
- The excellent [speedtest-cli](https://github.com/sivel/speedtest-cli "speedtest-cli GitHub page").
- Python with pip (if on Windows you will probably need to install this - download [here](https://www.python.org/downloads 'Python.org Download page'). PIP should be included as part of the Python install.
- Make sure that you have a Python entry in your PATH! Windows requires an environmental variable to be set at `My Computer ‣ Properties ‣ Advanced ‣ Environment Variables`. There's a few Stack Overflow questions about this.

## Instructions
- Install the speedtest cli with PIP by using `pip install speedtest-cli`
- If you want to push to GitHub then you'll need to set up a repo after you clone.
- Empty out the speedtestresults.txt file.
- By default the script will simply print the results in JSON to the terminal. To save your results you need to use an optional parameter flag when starting the script - either -s to save to disk, or -g to save to disk and GitHub.
- Run `bash-speedtest-cli.sh` in your terminal, using any of the following flags as required.

## Config
Optional parameter flags control how you want the script to run. 
```
-h => Get script help and usage 
-s => Save the results to your local file.
-g => Save the results to your local file and also push to your GitHub repo.
-c => Receive the results in CSV format instead of JSON
-o => Run the test only once
-w [option] => Set the wait time between runs in seconds (Default is 60 seconds)
-r [option] => Change the results file you're saving to (Default is speedtestresults.txt)
```
Using multiple flags is fine, but avoid:
- Using both `-s` & `-g` will only save and not push to github. If you want to save and push then use -g
- Using both `-o` & `-w` the wait time will be ignored if the script runs only once.
```
