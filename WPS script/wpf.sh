#! /bin/bash

# Ensures that only 2 years are passed as an argument
if [[ $# -ne 2 ]]; then
    echo "Correct input is ./wpf.sh [Project Name] [Year]"
    exit 1
fi

# Variables
pname=$1
year=$2

# Handle years
if [ ${year} -lt 2017 ]; then
	cd "/home/master/Models/WRF3.7/WPS"
else
	cd "/home/master/Models/WRF3.9/WPS"
fi

# Remove other files
rm -f GRIBFILE.*
rm -f geo_em.d0*
rm -f met_em.d0*
rm -f SSN:201*
rm -f FNL:201*

if [ ${year} -eq 2016 ]; then
	cp "/home/master/Project/\"${pname}\"/WPS/namelist_${year}a.wps" "namelist.wps"
	./geogrid.exe
	ln -sf "/home/master/Data/ungribdata/${year}/sst/* ."
	ln -sf "/home/master/Data/ungribdata/${year}/fnl01/* ."
	./metgrid.exe
	mv "met_em.do*" "/home/master/Models/WRF3.7/OBSGRID/backup/WPS_Outputs/\"${pname}\"/${year}/01"
	rm -f GRIBFILE.*
	rm -f geo_em.d0*
	rm -f met_em.d0*
	rm -f SSN:201*
	rm -f FNL:201*
	cp "/home/master/Project/\"${pname}\"/WPS/namelist_${year}b.wps" "namelist.wps"
	./geogrid.exe
	ln -sf "/home/master/Data/ungribdata/${year}/sst/* ."
	ln -sf "/home/master/Data/ungribdata/${year}/fnl02/* ."
	./metgrid.exe
	mv "met_em.do*" "/home/master/Models/WRF3.7/OBSGRID/backup/WPS_Outputs/\"${pname}\"/${year}/02"
else
	cp "/home/master/Project/\"${pname}\"/WPS/namelist_${year}.wps" "namelist.wps"
	./geogrid.exe
	ln -sf "/home/master/Data/ungribdata/${year}/sst/* ."
	ln -sf "/home/master/Data/ungribdata/${year}/fnl/* ."
	./metgrid.exe
	mv "met_em.do*" "/home/master/Models/WRF3.7/OBSGRID/backup/WPS_Outputs/\"${pname}\"/${year}"
fi


