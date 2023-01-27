all: index.md hello_fabric.ipynb

clean:
	rm index.md hello_fabric.ipynb

index.md: prepare.md notebooks/*.md
	pandoc --resource-path=images/ --embed-resources --standalone --wrap=none \
		-i prepare.md notebooks/configure_jupyter.md \
		notebooks/reserve.md notebooks/configure.md notebooks/login.md \
		--metadata title="Hello, FABRIC" -o index.md.tmp
	grep -v '^:::' index.md.tmp > index.md
	rm index.md.tmp

hello_fabric.ipynb: notebooks/*.md
	pandoc --resource-path=images/ --embed-resources --standalone --wrap=none \
		-i notebooks/title.md notebooks/configure_jupyter.md \
		notebooks/reserve.md notebooks/configure.md notebooks/login.md \
		-o hello_fabric.ipynb

