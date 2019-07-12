BINARY=100blog

default:
	@echo 'Usage of make: [ build | linux | windows | run | clean ]'

build:
	go build -o ./bin/${BINARY} ./

darwin_dmg: build
	# 制作 ${BINARY}
	cd bin && zip -r ${BINARY}.zip ./*
	mv ./bin/${BINARY}.zip ./tools/osx
	cd ./tools/osx && ./darwinpack.sh -n ${BINARY} -i icon.png -b image.png
	rm -rf ./tools/osx/${BINARY}.zip

linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ./bin/${BINARY} ./

windows:
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -ldflags -H=windowsgui -o ./bin/${BINARY}.exe ./

run: build
	cd bin && ./${BINARY}

clean:
	rm -f ./${BINARY}*

.PHONY: default build linux run docker docker_push clean