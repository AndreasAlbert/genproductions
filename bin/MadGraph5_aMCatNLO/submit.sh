folder="cards/production/pre2017/13TeV/DM_ZLL_NLO_Vector/"
for name in $(dir ${folder}); do
	ls | grep -q "${name}"
	found=$?
	if [ $found -eq 0 ]; then
		echo "Skipping $name"
		continue
	fi
	echo "Submit $name"

	nohup ./submit_cmsconnect_gridpack_generation.sh ${name} ${folder}/${name} 1 "8 Gb" > ${name}.debug 2>&1 &
	break;
done
