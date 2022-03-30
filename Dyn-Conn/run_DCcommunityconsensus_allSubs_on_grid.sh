#!/bin/bash

echo Job ID: $SLURM_JOB_ID
echo Job name: $SLURM_JOB_NAME
echo Submit host: $SLURM_SUBMIT_HOST
echo "Node(s) used": $SLURM_JOB_NODELIST


umask 0
unset PYTHONPATH

#To iterate through the number of partitions for sub 033

# Set parameters
subjects=(005 014 015 017 018 019 020 021 022 024 025 027 028 029 032 033 034 035 036 037 038 039 041 043 044 045 046 047 049 050 052 053 054 055 056 057 058 059 060 061 062 064 065 066 068 069 070 071 072 073 074 075 076 078 079 080 081 082 083 084 085 086 088 089 091 092 093 094 095 096 098 099 100 101 102 103 104 106 107 108 109 110 111 112 113) #list of all your subjects. can be done by using a simple ls on your directory and copying it to a notepad, and replace all the new lines with spaces.
#subjects=033

no_of_subjects=`expr ${#subjects[@]} - 1` #gets the total number of subjects in the array above, to use in for loop. I do it this way so that the code is a little cleaner.
gamma=1
omega=1
n_partitions=150

analysis_dir=/mnt/chrastil/lab/users/erica/projects/MLINDIV/githubclone/Dyn-Conn

output_dir=${analysis_dir}/partitions/S200
mkdir -p output_dir

​echo $analysis_dir

echo Starting rundccc on $HOSTNAME with $SLURM_CPUS_PER_TASK at `date`


for n in `seq 0 ${no_of_subjects}`
do
    ${analysis_dir}/run_DCcommunityconsensus_allSubs.sh ${subjects[n]} $gamma $omega $n_partitions
done



echo Finished at `date`