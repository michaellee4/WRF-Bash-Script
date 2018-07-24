#!/bin/csh
#################################################################
# Csh Script to retrieve 368 online Data files of 'ds351.0',
# total 21.06G. This script uses 'wget' to download data.
#
# Highlight this script by Select All, Copy and Paste it into a file;
# make the file executable and run it on command line.
#
# You need pass in your password as a parameter to execute
# this script; or you can set an environment variable RDAPSWD
# if your Operating System supports it.
#
# Contact tcram@ucar.edu (Thomas Cram) for further assistance.
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
set opt2 = "$opt $opt1 http://rda.ucar.edu/data/ds351.0/"
set filelist = ( \
  little_r/1999/OBS:1999100100 \
  little_r/1999/OBS:1999100106 \
  little_r/1999/OBS:1999100112 \
  little_r/1999/OBS:1999100118 \
  little_r/1999/OBS:1999100200 \
  little_r/1999/OBS:1999100206 \
  little_r/1999/OBS:1999100212 \
  little_r/1999/OBS:1999100218 \
  little_r/1999/OBS:1999100300 \
  little_r/1999/OBS:1999100306 \
  little_r/1999/OBS:1999100312 \
  little_r/1999/OBS:1999100318 \
  little_r/1999/OBS:1999100400 \
  little_r/1999/OBS:1999100406 \
  little_r/1999/OBS:1999100412 \
  little_r/1999/OBS:1999100418 \
  little_r/1999/OBS:1999100500 \
  little_r/1999/OBS:1999100506 \
  little_r/1999/OBS:1999100512 \
  little_r/1999/OBS:1999100518 \
  little_r/1999/OBS:1999100600 \
  little_r/1999/OBS:1999100606 \
  little_r/1999/OBS:1999100612 \
  little_r/1999/OBS:1999100618 \
  little_r/1999/OBS:1999100700 \
  little_r/1999/OBS:1999100706 \
  little_r/1999/OBS:1999100712 \
  little_r/1999/OBS:1999100718 \
  little_r/1999/OBS:1999100800 \
  little_r/1999/OBS:1999100806 \
  little_r/1999/OBS:1999100812 \
  little_r/1999/OBS:1999100818 \
  little_r/1999/OBS:1999100900 \
  little_r/1999/OBS:1999100906 \
  little_r/1999/OBS:1999100912 \
  little_r/1999/OBS:1999100918 \
  little_r/1999/OBS:1999101000 \
  little_r/1999/OBS:1999101006 \
  little_r/1999/OBS:1999101012 \
  little_r/1999/OBS:1999101018 \
  little_r/1999/OBS:1999101100 \
  little_r/1999/OBS:1999101106 \
  little_r/1999/OBS:1999101112 \
  little_r/1999/OBS:1999101118 \
  little_r/1999/OBS:1999101200 \
  little_r/1999/OBS:1999101206 \
  little_r/1999/OBS:1999101212 \
  little_r/1999/OBS:1999101218 \
  little_r/1999/OBS:1999101300 \
  little_r/1999/OBS:1999101306 \
  little_r/1999/OBS:1999101312 \
  little_r/1999/OBS:1999101318 \
  little_r/1999/OBS:1999101400 \
  little_r/1999/OBS:1999101406 \
  little_r/1999/OBS:1999101412 \
  little_r/1999/OBS:1999101418 \
  little_r/1999/OBS:1999101500 \
  little_r/1999/OBS:1999101506 \
  little_r/1999/OBS:1999101512 \
  little_r/1999/OBS:1999101518 \
  little_r/1999/OBS:1999101600 \
  little_r/1999/OBS:1999101606 \
  little_r/1999/OBS:1999101612 \
  little_r/1999/OBS:1999101618 \
  little_r/1999/OBS:1999101700 \
  little_r/1999/OBS:1999101706 \
  little_r/1999/OBS:1999101712 \
  little_r/1999/OBS:1999101718 \
  little_r/1999/OBS:1999101800 \
  little_r/1999/OBS:1999101806 \
  little_r/1999/OBS:1999101812 \
  little_r/1999/OBS:1999101818 \
  little_r/1999/OBS:1999101900 \
  little_r/1999/OBS:1999101906 \
  little_r/1999/OBS:1999101912 \
  little_r/1999/OBS:1999101918 \
  little_r/1999/OBS:1999102000 \
  little_r/1999/OBS:1999102006 \
  little_r/1999/OBS:1999102012 \
  little_r/1999/OBS:1999102018 \
  little_r/1999/OBS:1999102100 \
  little_r/1999/OBS:1999102106 \
  little_r/1999/OBS:1999102112 \
  little_r/1999/OBS:1999102118 \
  little_r/1999/OBS:1999102200 \
  little_r/1999/OBS:1999102206 \
  little_r/1999/OBS:1999102212 \
  little_r/1999/OBS:1999102218 \
  little_r/1999/OBS:1999102300 \
  little_r/1999/OBS:1999102306 \
  little_r/1999/OBS:1999102312 \
  little_r/1999/OBS:1999102318 \
  little_r/1999/OBS:1999102400 \
  little_r/1999/OBS:1999102406 \
  little_r/1999/OBS:1999102412 \
  little_r/1999/OBS:1999102418 \
  little_r/1999/OBS:1999102500 \
  little_r/1999/OBS:1999102506 \
  little_r/1999/OBS:1999102512 \
  little_r/1999/OBS:1999102518 \
  little_r/1999/OBS:1999102600 \
  little_r/1999/OBS:1999102606 \
  little_r/1999/OBS:1999102612 \
  little_r/1999/OBS:1999102618 \
  little_r/1999/OBS:1999102700 \
  little_r/1999/OBS:1999102706 \
  little_r/1999/OBS:1999102712 \
  little_r/1999/OBS:1999102718 \
  little_r/1999/OBS:1999102800 \
  little_r/1999/OBS:1999102806 \
  little_r/1999/OBS:1999102812 \
  little_r/1999/OBS:1999102818 \
  little_r/1999/OBS:1999102900 \
  little_r/1999/OBS:1999102906 \
  little_r/1999/OBS:1999102912 \
  little_r/1999/OBS:1999102918 \
  little_r/1999/OBS:1999103000 \
  little_r/1999/OBS:1999103006 \
  little_r/1999/OBS:1999103012 \
  little_r/1999/OBS:1999103018 \
  little_r/1999/OBS:1999103100 \
  little_r/1999/OBS:1999103106 \
  little_r/1999/OBS:1999103112 \
  little_r/1999/OBS:1999103118 \
  little_r/1999/OBS:1999110100 \
  little_r/1999/OBS:1999110106 \
  little_r/1999/OBS:1999110112 \
  little_r/1999/OBS:1999110118 \
  little_r/1999/OBS:1999110200 \
  little_r/1999/OBS:1999110206 \
  little_r/1999/OBS:1999110212 \
  little_r/1999/OBS:1999110218 \
  little_r/1999/OBS:1999110300 \
  little_r/1999/OBS:1999110306 \
  little_r/1999/OBS:1999110312 \
  little_r/1999/OBS:1999110318 \
  little_r/1999/OBS:1999110400 \
  little_r/1999/OBS:1999110406 \
  little_r/1999/OBS:1999110412 \
  little_r/1999/OBS:1999110418 \
  little_r/1999/OBS:1999110500 \
  little_r/1999/OBS:1999110506 \
  little_r/1999/OBS:1999110512 \
  little_r/1999/OBS:1999110518 \
  little_r/1999/OBS:1999110600 \
  little_r/1999/OBS:1999110606 \
  little_r/1999/OBS:1999110612 \
  little_r/1999/OBS:1999110618 \
  little_r/1999/OBS:1999110700 \
  little_r/1999/OBS:1999110706 \
  little_r/1999/OBS:1999110712 \
  little_r/1999/OBS:1999110718 \
  little_r/1999/OBS:1999110800 \
  little_r/1999/OBS:1999110806 \
  little_r/1999/OBS:1999110812 \
  little_r/1999/OBS:1999110818 \
  little_r/1999/OBS:1999110900 \
  little_r/1999/OBS:1999110906 \
  little_r/1999/OBS:1999110912 \
  little_r/1999/OBS:1999110918 \
  little_r/1999/OBS:1999111000 \
  little_r/1999/OBS:1999111006 \
  little_r/1999/OBS:1999111012 \
  little_r/1999/OBS:1999111018 \
  little_r/1999/OBS:1999111100 \
  little_r/1999/OBS:1999111106 \
  little_r/1999/OBS:1999111112 \
  little_r/1999/OBS:1999111118 \
  little_r/1999/OBS:1999111200 \
  little_r/1999/OBS:1999111206 \
  little_r/1999/OBS:1999111212 \
  little_r/1999/OBS:1999111218 \
  little_r/1999/OBS:1999111300 \
  little_r/1999/OBS:1999111306 \
  little_r/1999/OBS:1999111312 \
  little_r/1999/OBS:1999111318 \
  little_r/1999/OBS:1999111400 \
  little_r/1999/OBS:1999111406 \
  little_r/1999/OBS:1999111412 \
  little_r/1999/OBS:1999111418 \
  little_r/1999/OBS:1999111500 \
  little_r/1999/OBS:1999111506 \
  little_r/1999/OBS:1999111512 \
  little_r/1999/OBS:1999111518 \
  little_r/1999/OBS:1999111600 \
  little_r/1999/OBS:1999111606 \
  little_r/1999/OBS:1999111612 \
  little_r/1999/OBS:1999111618 \
  little_r/1999/OBS:1999111700 \
  little_r/1999/OBS:1999111706 \
  little_r/1999/OBS:1999111712 \
  little_r/1999/OBS:1999111718 \
  little_r/1999/OBS:1999111800 \
  little_r/1999/OBS:1999111806 \
  little_r/1999/OBS:1999111812 \
  little_r/1999/OBS:1999111818 \
  little_r/1999/OBS:1999111900 \
  little_r/1999/OBS:1999111906 \
  little_r/1999/OBS:1999111912 \
  little_r/1999/OBS:1999111918 \
  little_r/1999/OBS:1999112000 \
  little_r/1999/OBS:1999112006 \
  little_r/1999/OBS:1999112012 \
  little_r/1999/OBS:1999112018 \
  little_r/1999/OBS:1999112100 \
  little_r/1999/OBS:1999112106 \
  little_r/1999/OBS:1999112112 \
  little_r/1999/OBS:1999112118 \
  little_r/1999/OBS:1999112200 \
  little_r/1999/OBS:1999112206 \
  little_r/1999/OBS:1999112212 \
  little_r/1999/OBS:1999112218 \
  little_r/1999/OBS:1999112300 \
  little_r/1999/OBS:1999112306 \
  little_r/1999/OBS:1999112312 \
  little_r/1999/OBS:1999112318 \
  little_r/1999/OBS:1999112400 \
  little_r/1999/OBS:1999112406 \
  little_r/1999/OBS:1999112412 \
  little_r/1999/OBS:1999112418 \
  little_r/1999/OBS:1999112500 \
  little_r/1999/OBS:1999112506 \
  little_r/1999/OBS:1999112512 \
  little_r/1999/OBS:1999112518 \
  little_r/1999/OBS:1999112600 \
  little_r/1999/OBS:1999112606 \
  little_r/1999/OBS:1999112612 \
  little_r/1999/OBS:1999112618 \
  little_r/1999/OBS:1999112700 \
  little_r/1999/OBS:1999112706 \
  little_r/1999/OBS:1999112712 \
  little_r/1999/OBS:1999112718 \
  little_r/1999/OBS:1999112800 \
  little_r/1999/OBS:1999112806 \
  little_r/1999/OBS:1999112812 \
  little_r/1999/OBS:1999112818 \
  little_r/1999/OBS:1999112900 \
  little_r/1999/OBS:1999112906 \
  little_r/1999/OBS:1999112912 \
  little_r/1999/OBS:1999112918 \
  little_r/1999/OBS:1999113000 \
  little_r/1999/OBS:1999113006 \
  little_r/1999/OBS:1999113012 \
  little_r/1999/OBS:1999113018 \
  little_r/1999/OBS:1999120100 \
  little_r/1999/OBS:1999120106 \
  little_r/1999/OBS:1999120112 \
  little_r/1999/OBS:1999120118 \
  little_r/1999/OBS:1999120200 \
  little_r/1999/OBS:1999120206 \
  little_r/1999/OBS:1999120212 \
  little_r/1999/OBS:1999120218 \
  little_r/1999/OBS:1999120300 \
  little_r/1999/OBS:1999120306 \
  little_r/1999/OBS:1999120312 \
  little_r/1999/OBS:1999120318 \
  little_r/1999/OBS:1999120400 \
  little_r/1999/OBS:1999120406 \
  little_r/1999/OBS:1999120412 \
  little_r/1999/OBS:1999120418 \
  little_r/1999/OBS:1999120500 \
  little_r/1999/OBS:1999120506 \
  little_r/1999/OBS:1999120512 \
  little_r/1999/OBS:1999120518 \
  little_r/1999/OBS:1999120600 \
  little_r/1999/OBS:1999120606 \
  little_r/1999/OBS:1999120612 \
  little_r/1999/OBS:1999120618 \
  little_r/1999/OBS:1999120700 \
  little_r/1999/OBS:1999120706 \
  little_r/1999/OBS:1999120712 \
  little_r/1999/OBS:1999120718 \
  little_r/1999/OBS:1999120800 \
  little_r/1999/OBS:1999120806 \
  little_r/1999/OBS:1999120812 \
  little_r/1999/OBS:1999120818 \
  little_r/1999/OBS:1999120900 \
  little_r/1999/OBS:1999120906 \
  little_r/1999/OBS:1999120912 \
  little_r/1999/OBS:1999120918 \
  little_r/1999/OBS:1999121000 \
  little_r/1999/OBS:1999121006 \
  little_r/1999/OBS:1999121012 \
  little_r/1999/OBS:1999121018 \
  little_r/1999/OBS:1999121100 \
  little_r/1999/OBS:1999121106 \
  little_r/1999/OBS:1999121112 \
  little_r/1999/OBS:1999121118 \
  little_r/1999/OBS:1999121200 \
  little_r/1999/OBS:1999121206 \
  little_r/1999/OBS:1999121212 \
  little_r/1999/OBS:1999121218 \
  little_r/1999/OBS:1999121300 \
  little_r/1999/OBS:1999121306 \
  little_r/1999/OBS:1999121312 \
  little_r/1999/OBS:1999121318 \
  little_r/1999/OBS:1999121400 \
  little_r/1999/OBS:1999121406 \
  little_r/1999/OBS:1999121412 \
  little_r/1999/OBS:1999121418 \
  little_r/1999/OBS:1999121500 \
  little_r/1999/OBS:1999121506 \
  little_r/1999/OBS:1999121512 \
  little_r/1999/OBS:1999121518 \
  little_r/1999/OBS:1999121600 \
  little_r/1999/OBS:1999121606 \
  little_r/1999/OBS:1999121612 \
  little_r/1999/OBS:1999121618 \
  little_r/1999/OBS:1999121700 \
  little_r/1999/OBS:1999121706 \
  little_r/1999/OBS:1999121712 \
  little_r/1999/OBS:1999121718 \
  little_r/1999/OBS:1999121800 \
  little_r/1999/OBS:1999121806 \
  little_r/1999/OBS:1999121812 \
  little_r/1999/OBS:1999121818 \
  little_r/1999/OBS:1999121900 \
  little_r/1999/OBS:1999121906 \
  little_r/1999/OBS:1999121912 \
  little_r/1999/OBS:1999121918 \
  little_r/1999/OBS:1999122000 \
  little_r/1999/OBS:1999122006 \
  little_r/1999/OBS:1999122012 \
  little_r/1999/OBS:1999122018 \
  little_r/1999/OBS:1999122100 \
  little_r/1999/OBS:1999122106 \
  little_r/1999/OBS:1999122112 \
  little_r/1999/OBS:1999122118 \
  little_r/1999/OBS:1999122200 \
  little_r/1999/OBS:1999122206 \
  little_r/1999/OBS:1999122212 \
  little_r/1999/OBS:1999122218 \
  little_r/1999/OBS:1999122300 \
  little_r/1999/OBS:1999122306 \
  little_r/1999/OBS:1999122312 \
  little_r/1999/OBS:1999122318 \
  little_r/1999/OBS:1999122400 \
  little_r/1999/OBS:1999122406 \
  little_r/1999/OBS:1999122412 \
  little_r/1999/OBS:1999122418 \
  little_r/1999/OBS:1999122500 \
  little_r/1999/OBS:1999122506 \
  little_r/1999/OBS:1999122512 \
  little_r/1999/OBS:1999122518 \
  little_r/1999/OBS:1999122600 \
  little_r/1999/OBS:1999122606 \
  little_r/1999/OBS:1999122612 \
  little_r/1999/OBS:1999122618 \
  little_r/1999/OBS:1999122700 \
  little_r/1999/OBS:1999122706 \
  little_r/1999/OBS:1999122712 \
  little_r/1999/OBS:1999122718 \
  little_r/1999/OBS:1999122800 \
  little_r/1999/OBS:1999122806 \
  little_r/1999/OBS:1999122812 \
  little_r/1999/OBS:1999122818 \
  little_r/1999/OBS:1999122900 \
  little_r/1999/OBS:1999122906 \
  little_r/1999/OBS:1999122912 \
  little_r/1999/OBS:1999122918 \
  little_r/1999/OBS:1999123000 \
  little_r/1999/OBS:1999123006 \
  little_r/1999/OBS:1999123012 \
  little_r/1999/OBS:1999123018 \
  little_r/1999/OBS:1999123100 \
  little_r/1999/OBS:1999123106 \
  little_r/1999/OBS:1999123112 \
  little_r/1999/OBS:1999123118 \
)
while($#filelist > 0)
 set syscmd = "$opt2$filelist[1]"
 echo "$syscmd ..."
 $syscmd
 shift filelist
end

rm -f auth.rda_ucar_edu Authentication.log
exit 0