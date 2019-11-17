cd .IntelliJIdea2019.2

git pull

~/idea-IU/bin/idea.sh

rm -fr "$(find ./ -iname eval 2>/dev/null | grep -e \..*/config/eval)"
rm -fr "$(find ./ -iname *statistics* 2>/dev/null | grep -e \..*/config/.*\.xml)"
sed -i.bak '/evlsprt*/d' $(find ./ -iname 'other.xml' 2>/dev/null | grep -e \..*/config/options/other\.xml)
git add .
git commit -m 'update'
git push