#!/usr/bin/env python3
from http.client import HTTPConnection as Connection
from json.decoder import JSONDecoder as Decoder
from datetime import datetime, timedelta
import sys

latitude = -22.0295
longitude = -47.8793
timezone = -3
HOST = "api.sunrise-sunset.org"
offset = 0

if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1]:
        offset = int(sys.argv[1])

    try:
        connection = Connection(HOST, port=80)
        connection.request("GET", f"/json?lat={latitude}&lng={longitude}")
        response = b"".join(connection.getresponse().readlines()).decode()
        connection.close()

        decoder = Decoder()
        decoded = decoder.decode(response)
        time_str = decoded["results"]["sunset"]

        sunset_time = datetime.strptime(time_str, "%I:%M:%S %p")
        tz_corrected = sunset_time + timedelta(hours=timezone)

        sunset = tz_corrected + timedelta(hours=offset)
    except:
        sunset = datetime.strptime("18:00:00", "%-H:%M") + timedelta(hours=offset)

    print(sunset.strftime("%-H:%M"))
