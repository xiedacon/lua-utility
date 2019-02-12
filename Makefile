
test:
	lua test.lua

opm:
	opm build \
	&& opm upload \
	&& opm clean dist

.PHONY: test
