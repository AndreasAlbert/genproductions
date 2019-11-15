
topdir='cards/production/2017/13TeV/monojetv/dmsimp'

for folder in $topdir/*/; do
   for name in $(dir ${folder}); do
   	ls | grep -q "${name}"
   	found=$?
   	if [ $found -eq 0 ]; then
   		echo "Skipping $name"
   		continue
   	fi
   	echo "Submit $name"
   
   	nohup ./submit_condor_gridpack_generation.sh ${name} ${folder}/${name} > ${name}.debug 2>&1 &
   	break;
   done
   break;
done
