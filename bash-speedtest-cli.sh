#!/bin/bash

# Set up variables
waitTime='60'
resultsFile='speedtestresults.txt'
resultsSummaryFile='speedtestsummary.txt'
currentTime=$(date "+%Y-%m-%d %H:%M:%S")
BASEDIR=$(dirname $(readlink -f $0))
helpMessage='usage [-s save to file] [-g save to github] [-c record in csv] [-o run once] [-w wait time in seconds] [-r results file]'


# Get script arguments
while getopts sgcohw:r: opt;
do

case $opt in
    s)
        save=true;;
    g)
        github=true;;
    c)
        csv=true;;
    o)
        once=true;;
	w)
		waitTime="$OPTARG";;
	r)
		resultsFile="$OPTARG";;
    h)
        echo $helpMessage 
		exit 0;;
    \?)
		echo $helpMessage
        echo "Exiting due to illegal option" >&2
		exit 1;;
esac
sleep 1
done


# Loop run test and wait $waitTime between tests
while true
do

save() {
	echo "Saving to file $resultsFileFull"
	if [ $csv ]
		then
		echo $results >> $resultsFileFull
		echo "Removing Whitelines"
		# Adding pipe for clobber
		`awk 'NF' $resultsFileFull >| temp.txt && mv temp.txt $resultsFileFull`
		echo "creating summary file"
		`tail -n 5000 $resultsFileFull >| $resultsSummaryFileFull`
	else
		echo $results | python -m json.tool >> $resultsFileFull
	fi
	echo "File saved"
}

resultsFileFull=$BASEDIR/$resultsFile
resultsSummaryFileFull=$BASEDIR/$resultsSummaryFile
cd $BASEDIR
echo "Starting SpeedTest check at $currentTime"


if [ $csv ] 
then
    results=$(speedtest-cli --csv)
    echo $results
else
    results=$(speedtest-cli --json)
    echo $results | python -m json.tool
fi
echo 'SpeedTest complete'


if [ $save ] 
then
	save
elif [ $github ] 
then
	save
    echo "Attempting git add, commit, & push to GitHub of $resultsFile"
        echo `git add $resultsFile $resultsSummaryFile`
        echo `git commit $resultsFile $resultsSummaryFile -m "Speedtest results updated at $currentTime"`
        echo `git push origin master`
    echo "File pushed $resultsFileFull"
fi

if [ $once ] 
then
	echo "Job done!"
	break
fi

echo "Waiting $waitTime seconds until next test..."

sleep $(($waitTime * 10))

done
