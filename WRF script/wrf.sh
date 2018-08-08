#! /bin/bash

# Check if the scripts folder is present
if [ ! -d "scripts" ]; then
	echo "Scripts directory not found"
	exit 1
fi

# Ensures that only 1 year is passed as an argument
if [[ $# -ne 1 ]]; then
	echo "Enter 1 year as an argument"
	exit 1
fi

# Variables
scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd)"
path="/home/master/Data"
year=$1
pw="1367583"

# Make the directories if they exist
mkdir -p "${path}/sst0.083/${year}"
chmod -R 777 "${path}/sst0.083/${year}"
echo "Created ${path}/sst0.083/${year}"

mkdir -p "${path}/ds083.2.grib2/${year}" 
chmod -R 777 "${path}/ds083.2.grib2/${year}" 
echo "Created ${path}/ds083.2.grib2/${year}"  

mkdir -p "${path}/ds461.0/${year}"
chmod -R 777 "${path}/ds461.0/${year}"
echo "Created ${path}/ds461.0/${year}" 

mkdir -p "${path}/ds351.0/${year}"
chmod -R 777 "${path}/ds351.0/${year}"
echo  "Created ${path}/ds351.0/${year}"

### Handle sst0.083

cd "${path}/sst0.083/${year}"
# Comment the following line out to skip
wget "ftp://polar.ncep.noaa.gov/pub/history/sst/rtg_high_res/rtg_sst_grb_hr_0.083.${year}*"

###
 

### Handle ds083.2 

if [ ! -f  "${scriptPath}/scripts/ds083.2/ds083.2.sh" ]; then
	echo ds083.2 script template was not found
else
	# Change dir, copy script and run
	cd "${path}/ds083.2.grib2/${year}"

	cp "${scriptPath}/scripts/ds083.2/ds083.2.sh" "${path}/ds083.2.grib2/${year}"
	chmod +x "${path}/ds083.2.grib2/${year}/ds083.2.sh"
	# Comment the following line out to skip
	./"ds083.2.sh" "$pw" "${year}"
fi

###


### Handle ds461.0

if [ ! -f  "${scriptPath}/scripts/ds461.0/ds461.0.sh" ]; then
	echo ds461.0 script template was not found
else
	cd "${path}/ds461.0/${year}"

	cp "${scriptPath}/scripts/ds461.0/ds461.0.sh" "${path}/ds461.0/${year}"
	chmod +x "${path}/ds461.0/${year}/ds461.0.sh"
	# Comment the following line out to skip
	./"ds461.0.sh" "$pw" "${year}"
fi

###

### Handle ds351.0

if [ ! -f  "${scriptPath}/scripts/ds351.0/ds351.0.sh" ]; then
	echo ds351.0 script template was not found
else
	cd "${path}/ds351.0/${year}"

	cp "${scriptPath}/scripts/ds351.0/ds351.0.sh" "${path}/ds351.0/${year}"
	chmod +x "${path}/ds351.0/${year}/ds351.0.sh"
	# Comment the following line out to skip
	./"ds351.0.sh" "$pw" "${year}"
fi

###

echo Complete!
exit 0
