.PHONY: test build doc

update:
	swift package update

test:
	swift test

build:
	swift build
