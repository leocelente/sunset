# sunset

Exercising scripting by attempting to run a timelapse. 

## How it works
 - `timelapse.sh` takes a picture with the webcam every 10 seconds for 2 hours. 
 - `sunset.py` uses the free API from [Sunrise-Sunset.Org](https://sunrise-sunset.org/api) to calculate 1 hour prior to sunset in the specified timezone. 
 - `install.sh` checks for dependencies and adds a cronjob to daily schedule running the `timelapse.sh` script according to the output of `sunset.py`
