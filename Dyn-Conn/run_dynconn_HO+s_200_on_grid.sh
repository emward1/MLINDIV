#!/bin/bash

#To run on the grid for all subjects:
#In a separate script:
#run again with part 2: subjects that had errors from last time
subjects=(002 003 005 006 007 008 009 010 011 012 013 014 015 017 018 019 020 021 022 024 025 026 027 028 029 031 032 033 034 035 036 037 038 039 041 043 044 045 046 047 049 050 052 053 054 055 056 057 058 059 060 061 062 064 065 066 068 069 070 071 072 073 074 075 076 078 079 080 081 082 083 084 085 086 088 089 091 092 093 094 095 096 098 099 100 101 102 103 104 106 107 108 109 110 111 112 113) #list of all your subjects. can be done by using a simple ls on your directory and copying it to a notepad, and replace all the new lines with spaces.
no_of_subjects=`expr ${#subjects[@]} - 1` #gets the total number of subjects in the array above, to use in for loop. I do it this way so that the code is a little cleaner.
pipeline_path=/mnt/chrastil/lab/users/erica/projects/MLINDIV/githubclone/Dyn-Conn



for i in `seq 0 ${no_of_subjects}`;
do
	${pipeline_path}/run_dynconn_HO+S_200.sh ${subjects[i]} 
done
