NAME="DM"
#### Parse Arguments
i=1
GDMV=${!i}; i=$((i+1))
GQV=${!i}; i=$((i+1))
GLV=${!i}; i=$((i+1))

GNU=${!i}; i=$((i+1))

MMED=${!i}; i=$((i+1))
MDM=${!i}; i=$((i+1))

NEWDIR="Vector_Dilepton_NLO_Mphi${MMED}_Mchi${MDM}_gSM-${GQV}_gDM-${GDMV}_gL-${GLV}_13TeV-madgraph";
cp -r Vector_Dilepton_NLO_Mphi_Mchi_gSM-0p1_gDM-1p0_gL-0p01_13TeV-madgraph ${NEWDIR};

echo "set param_card mass  5000001 ${MMED}" > ${NEWDIR}/${NAME}_customizecards.dat
echo "set param_card mass  5000521 ${MDM}">> ${NEWDIR}/${NAME}_customizecards.dat
echo "set param_card decay 5000001 auto">> ${NEWDIR}/${NAME}_customizecards.dat

### Start by setting everything to zero
echo "Setting all couplings to zero."
for i in {4..24}; do echo "set dminputs ${i} 0.0"; done >> ${NEWDIR}/${NAME}_customizecards.dat

# GQV
if [ ! -z ${GQV} ]; then
	echo "Setting vector quark coupling: GQV = ${GQV}"
	for i in {4..9}; do echo "set dminputs ${i} ${GQV}"; done >> ${NEWDIR}/${NAME}_customizecards.dat
fi
# GLV
if [ ! -z ${GLV} ]; then
	echo "Setting vector lepton coupling: GLV = ${GLV}"
	for i in {10..12}; do echo "set dminputs ${i} ${GLV}"; done >> ${NEWDIR}/${NAME}_customizecards.dat
fi
# GQA
if [ ! -z ${GQA} ]; then
	echo "Setting axial quark coupling: GQA = ${GQA}"
	for i in {13..18}; do echo "set dminputs ${i} ${GQA}"; done >> ${NEWDIR}/${NAME}_customizecards.dat
fi
# GLA
if [ ! -z ${GLA} ]; then
	echo "Setting axial lepton coupling: GLA = ${GLA}"
	for i in {19..21}; do echo "set dminputs ${i} ${GLA}"; done >> ${NEWDIR}/${NAME}_customizecards.dat
fi
# GNU
if [ ! -z ${GNU} ]; then
	echo "Setting neutrino coupling: GNU = ${GNU}"
	for i in {22..24}; do echo "set dminputs ${i} ${GNU}"; done >> ${NEWDIR}/${NAME}_customizecards.dat
fi

# Off-diagonal couplings
echo "Setting off-diagonal couplings"
for i in {25..28}; do echo "set dminputs ${i} 0.000001"; done >> ${NEWDIR}/${NAME}_customizecards.dat


