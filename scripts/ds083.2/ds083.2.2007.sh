#!/bin/csh
#################################################################
# Csh Script to retrieve 102 online Data files of 'ds083.2',
# total 1.03G. This script uses 'wget' to download data.
#
# Highlight this script by Select All, Copy and Paste it into a file;
# make the file executable and run it on command line.
#
# You need pass in your password as a parameter to execute
# this script; or you can set an environment variable RDAPSWD
# if your Operating System supports it.
#
# Contact schuster@ucar.edu (Doug Schuster) for further assistance.
#################################################################

set pswd = $1
if(x$pswd == x && `env | grep RDAPSWD` != '') then
 set pswd = $RDAPSWD
endif
if(x$pswd == x) then
 echo
 echo Usage: $0 YourPassword
 echo
 exit 1
endif
set v = `wget -V |grep 'GNU Wget ' | cut -d ' ' -f 3`
set a = `echo $v | cut -d '.' -f 1`
set b = `echo $v | cut -d '.' -f 2`
if(100 * $a + $b > 109) then
 set opt = 'wget --no-check-certificate'
else
 set opt = 'wget'
endif
set opt1 = '-O Authentication.log --save-cookies auth.rda_ucar_edu --post-data'
set opt2 = "email=yzbjb@126.com&passwd=$pswd&action=login"
$opt $opt1="$opt2" https://rda.ucar.edu/cgi-bin/login
set opt1 = "-N --load-cookies auth.rda_ucar_edu"
set opt2 = "$opt $opt1 http://rda.ucar.edu/data/ds083.2/"
set filelist = ( \
  grib2/2007/2007.12/fnl_20071206_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071206_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071207_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071207_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071207_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071207_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071208_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071208_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071208_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071208_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071209_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071209_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071209_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071209_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071210_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071210_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071210_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071210_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071211_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071211_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071211_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071211_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071212_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071212_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071212_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071212_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071213_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071213_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071213_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071213_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071214_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071214_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071214_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071214_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071215_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071215_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071215_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071215_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071216_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071216_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071216_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071216_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071217_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071217_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071217_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071217_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071218_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071218_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071218_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071218_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071219_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071219_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071219_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071219_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071220_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071220_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071220_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071220_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071221_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071221_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071221_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071221_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071222_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071222_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071222_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071222_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071223_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071223_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071223_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071223_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071224_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071224_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071224_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071224_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071225_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071225_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071225_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071225_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071226_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071226_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071226_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071226_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071227_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071227_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071227_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071227_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071228_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071228_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071228_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071228_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071229_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071229_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071229_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071229_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071230_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071230_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071230_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071230_18_00.grib2 \
  grib2/2007/2007.12/fnl_20071231_00_00.grib2 \
  grib2/2007/2007.12/fnl_20071231_06_00.grib2 \
  grib2/2007/2007.12/fnl_20071231_12_00.grib2 \
  grib2/2007/2007.12/fnl_20071231_18_00.grib2 \
)
while($#filelist > 0)
 set syscmd = "$opt2$filelist[1]"
 echo "$syscmd ..."
 $syscmd
 shift filelist
end

rm -f auth.rda_ucar_edu Authentication.log
exit 0