
all:

.PHONY: publish
publish:
	mkdir -p tmp
	[[ -d tmp/gh-pages ]] || git clone git@github.com:trentm/talk-bunyan-in-prod.git tmp/gh-pages
	cd tmp/gh-pages && git checkout gh-pages && git pull --rebase origin gh-pages
	cp -PR \
		index.html \
		css \
		img \
		js \
		lib \
		plugin \
		tmp/gh-pages/
	(cd tmp/gh-pages \
		&& git commit -a -m "publish latest version" \
		&& git push origin gh-pages || true)
	echo "Published to http://trentm.github.io/talk-bunyan-in-prod"

