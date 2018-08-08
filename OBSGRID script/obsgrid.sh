#! /bin/bash

# Ensures that only 2 years are passed as an argument
if [[ $# -ne 2 ]]; then
    echo "Correct input is ./obsgrid.sh [Project name] [Year]"
    exit 1
fi

pname=$1
year=$2

if [ ${year} -eq 2016 ]; then
	cd "/home/master/Models/WRF3.7/OBSGRID"
	rm -f met_em.d0*
	rm -f metoa_em.d0*
	rm -f OBS_DOMAIN*
	rm -f wrfsfdda_d0*
	ln -sf "/home/master/Models/WRF3.7/OBSGRID/backup/WPS_Outputs/\"${pname}\"/${year}/01/*" "."
	cp "/home/master/Project/\"${pname}\"/OBSGRID/${year}/01/*" "."
	./run_obsgrid_2.csh
	mv "metoa_em.d0*" "/home/master/Models/WRF3.7/OBSGRID/backup/OBSGRID_Outputs/\"${pname}\"/${year}/01/"
	mv "wrfsfdda_d0*" "/home/master/Models/WRF3.7/OBSGRID/backup/OBSGRID_Outputs/\"${pname}\"/${year}/01/"
	rm -f OBS_DOMAIN*
	rm -f met_em.d0*
	ln -sf "/home/master/Models/WRF3.7/OBSGRID/backup/WPS_Outputs/\"${pname}\"/${year}/02/*" "."
	cp "/home/master/Project/\"${pname}\"/OBSGRID/${year}/02/*" "."
	./run_obsgrid_2.csh
	mv "metoa_em.d0*" "/home/master/Models/WRF3.7/OBSGRID/backup/OBSGRID_Outputs/\"${pname}\"/${year}/02/"
	mv "wrfsfdda_d0*" "/home/master/Models/WRF3.7/OBSGRID/backup/OBSGRID_Outputs/\"${pname}\"/${year}/02/"
else
	cd "/home/master/Models/WRF3.7/OBSGRID"
	rm -f met_em.d0*
	rm -f metoa_em.d0*
	rm -f OBS_DOMAIN*
	rm -f wrfsfdda_d0*
	ln -sf "/home/master/Models/WRF3.7/OBSGRID/backup/WPS_Outputs/\"${pname}\"/${year}/*" "."
	cp "/home/master/Project/\"${pname}\"/OBSGRID/${year}/01/*" "."
	./run_obsgrid_2.csh
	mv "metoa_em.d0*" "/home/master/Models/WRF3.7/OBSGRID/backup/OBSGRID_Outputs/\"${pname}\"/${year}/01/"
	mv "wrfsfdda_d0*" "/home/master/Models/WRF3.7/OBSGRID/backup/OBSGRID_Outputs/\"${pname}\"/${year}/01/"
	rm -f OBS_DOMAIN*
	cp "/home/master/Project/\"${pname}\"/OBSGRID/${year}/02/*" "."
	./run_obsgrid_2.csh
	mv "metoa_em.d0*" "/home/master/Models/WRF3.7/OBSGRID/backup/OBSGRID_Outputs/\"${pname}\"/${year}/02/"
	mv "wrfsfdda_d0*" "/home/master/Models/WRF3.7/OBSGRID/backup/OBSGRID_Outputs/\"${pname}\"/${year}/02/"
fi


