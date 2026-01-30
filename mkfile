files=`{walk -f | grep 'index\.md$' | sed 's:\.md$:.html:' | grep -v '^out/'}
copypng=`{walk -f | grep '\.png$' | grep -v '^out/'}
copysvg=`{walk -f | grep '\.svg$' | grep -v '^out/'}

nl='
'

mkdflags=-f toc -f fencedcode -f tables -T -x
getfirsttitle='
/^#[ \t]/ {
	sub(/^#[ \t]+/, "")
	print
	exit
}
END {
	exit "not found"
}'
linkconv='s:href="([a-zA-Z0-9\-_\.\/]+\/)index.md:href="\1:g'

all:V: ${files:%=out/%} ${copypng:%=out/%} ${copysvg:%=out/%} out/Scalem-DemoData.zip

test:V:
	@{cd out && ../test/deadlinks.rc}

out/index.html:Q: index.md fragments/header.ht fragments/footer.ht
	mkdir -p `{basename -d $target}
	title=`{markdown -t `$nl{awk $"getfirsttitle <index.md}}
	title=`{echo -n $title | sed 's:/:\\/:g;s:<:\\<:g;s:>:\\>:g'}
	if(~ $#title 0)
		title="Scalem"
	{
		cat fragments/header.ht | sed 's/%TITLE%/'^$"title^'/g'
		markdown $mkdflags index.md
		cat fragments/footer.ht
	} | sed $"linkconv >$target
	echo √ gen $target

out/%/index.html:Q: %/index.md fragments/header.ht fragments/footer.ht
	mkdir -p `{basename -d $target}
	title=`{markdown -t `$nl{awk $"getfirsttitle <$stem/index.md}}
	title=`{echo -n $title | sed 's:/:\\/:g;s:<:\\<:g;s:>:\\>:g'}
	if(~ $#title 0)
		title="Scalem"
	{
		cat fragments/header.ht | sed 's/%TITLE%/'^$"title^'/g'
		markdown $mkdflags $stem/index.md
		cat fragments/footer.ht
	} | sed $"linkconv >$target
	echo √ gen $target

out/%.png:Q: %.png
	mkdir -p `{basename -d $target}
	cp $stem.png $target
	echo √ cpy `{basename $target}

out/%.svg:Q: %.svg
	mkdir -p `{basename -d $target}
	cp $stem.svg $target
	echo √ cpy `{basename $target}

out/Scalem-DemoData.zip:Q: Scalem-DemoData.zip
	cp $prereq $target
