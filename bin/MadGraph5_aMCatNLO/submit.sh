folder="cards/production/pre2017/28TeV/DM_ZLL_LO_Vector_forHE/"
for name in $(dir ${folder}); do
	ls | grep -q "${name}"
	found=$?
	if [ $found -eq 0 ]; then
		echo "Skipping $name"
		continue
	fi
	echo "Submit $name"

	nohup ./submit_cmsconnect_gridpack_generation.sh ${name} ${folder}/${name} > ${name}.debug 2>&1 &
	break;
done
