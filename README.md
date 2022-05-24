# sunset

Exercising scripting by attempting to run a timelapse. 

## How it works
 - `timelapse.sh` takes a picture with the webcam every 10 seconds for 2 hours. 
 - `sunset.py` uses the free API from [Sunrise-Sunset.Org](https://sunrise-sunset.org/api) to calculate 1 hour prior to sunset in the specified timezone.
 - `schedule.sh` schedules executing `timelapse.sh` at the time returned by `sunset.py` using the `at` command  
 - `install.sh` checks for dependencies and adds a cronjob to daily run the `schedule.sh`

## First output
![gif](out.gif)
