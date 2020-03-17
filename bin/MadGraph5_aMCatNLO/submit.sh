folder="cards/production/2017/13TeV/GJets_Gpt_1j_5f_NLO/"
for name in $(dir -1 ${folder} | grep GJet); do
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
