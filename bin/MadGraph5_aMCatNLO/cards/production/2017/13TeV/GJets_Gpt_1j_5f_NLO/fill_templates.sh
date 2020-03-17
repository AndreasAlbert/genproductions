for DIR in ./*/; do
    NAME=$(basename $DIR)
    cp cuts_template.f $DIR/${NAME}_cuts.f
done
rm GJets_1j_Gpt-650ToInf_5f_NLO/*cuts.f

sed -i "s/@PHOTONPTMAX/250/g" GJets_1j_Gpt-100To250_5f_NLO/*cuts.f
sed -i "s/@PHOTONPTMAX/400/g" GJets_1j_Gpt-250To400_5f_NLO/*cuts.f
sed -i "s/@PHOTONPTMAX/650/g" GJets_1j_Gpt-400To650_5f_NLO/*cuts.f
