DIR=${1}

oldname=$(basename $DIR)
newname=${oldname}_nopdfwgt
NEWDIR=$(dirname $DIR)/${newname}

cp -r $DIR $NEWDIR
cd $NEWDIR
rename $oldname $newname *dat
sed -i "s/$oldname/$newname/g" *dat
sed -i 's/.*T.*=.*pdfwgt.*/F=pdfwgt/g' *dat
cd -
