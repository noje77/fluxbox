#!/usr/bin/env bash 
# conky sourcing weather 

f1 ()
{
curl -s https://weather.com/fr-FR/temps/aujour/l/b603a185f2f7e03fdd596b91b8f656590f90719d9827e79401f4a1d910f08ba2 >temp.html
html2text temp.html | grep "°" | sed 's/Â//' | sed 's/.\°Bons-en-Chablais\,\_Haute-Savoie//' | sed 's/essentie//' | sed 's/Â//' | sed '/FR/d' | sed '/°F/d' | sed '/Ã/d' | sed '/^$/d' | sed 's/ //g' | head -n 6 >weather.txt
rm temp.html 
}


f2 ()
{
curl -s https://weather.com/fr-FR/temps/aujour/l/b603a185f2f7e03fdd596b91b8f656590f90719d9827e79401f4a1d910f08ba2 >temp.html
html2text temp.html >temp.txt
rm temp.html
recode -q UTF-8..ISO-8859-1 temp.txt 
cat -n temp.txt | grep "85" | sed '/185/d' | sed 's/85//' >temp2.txt
rm temp.txt 
cat temp2.txt | sed 's/^[ \t]*//' >indice.txt
rm temp2.txt
}



f3 ()
{
curl -s https://weather.com/fr-FR/temps/aujour/l/b603a185f2f7e03fdd596b91b8f656590f90719d9827e79401f4a1d910f08ba2 >humide.html
html2text humide.html | sed '1,/HumiditÃ©/d' | less | sed -n 1p >humide.txt
#html2text humide.html | sed -n 111p >humide.txt
rm humide.html
}

f1
f2 
f3

## final output for conky 
ligne1=$(head -n1 weather.txt)
indice=$(cat indice.txt)
echo "$ligne1 - $indice" >meteo.txt

humide=$(cat humide.txt)
echo "Humidité $humide" >>meteo.txt

echo "" >>meteo.txt
minmax=$(sed -n 2p weather.txt)
echo "Max.Min $minmax" >>meteo.txt

echo "" >>meteo.txt 
matin=$(sed -n 3p weather.txt)
apresmidi=$(sed -n 4p weather.txt)
soir=$(sed -n 5p weather.txt)
nuit=$(sed -n 6p weather.txt)
echo "Matin            $matin" >>meteo.txt
echo "Après-Midi    $apresmidi" >>meteo.txt
echo "Soir 	            $soir" >>meteo.txt
echo "Nuit		    $nuit" >>meteo.txt
rm weather.txt
rm indice.txt
cat meteo.txt
rm meteo.txt 
rm humide.txt

## interprétation
# première ligne température actuelle
# deuxième ligne température maxi mini
# troisième ligne = Matin 
# quatrième ligne = Après-Midi
# cinquième ligne = Soir  
# sixième ligne = Nuit
##
