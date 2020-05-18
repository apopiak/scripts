#!/bin/bash

# continuously reduce the priority of background tasks like rustc
while true; do
    renice 15 $(pidof rustc)
    sleep 5
done