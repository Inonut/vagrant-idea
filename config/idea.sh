IDEA_VERSION=$(cat ./idea-IU/product-info.json | jq .version | sed -e "s/\"//g")
IDEA_SETTINGS=".IntelliJIdea$IDEA_VERSION"
if [ ! -d "$IDEA_SETTINGS" ]; then
    if [ ! -z "$1" ]; then
        git clone $1 GIT_IDEA_SETTINGS
        sudo mv ~/GIT_IDEA_SETTINGS/ ~/$IDEA_SETTINGS
        sudo chmod -R ugo+rwx .$IDEA_SETTINGS
    fi
fi
cd $IDEA_SETTINGS

git pull

~/idea-IU/bin/idea.sh

rm -fr "$(find ./ -iname eval 2>/dev/null | grep -e \..*/config/eval)"
rm -fr "$(find ./ -iname *statistics* 2>/dev/null | grep -e \..*/config/.*\.xml)"
sed -i.bak '/evlsprt*/d' $(find ./ -iname 'other.xml' 2>/dev/null | grep -e \..*/config/options/other\.xml)
git add .
git commit -m 'update'
git push
