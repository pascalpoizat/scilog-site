#-----------------------------------------------------
# Some usefull instructions...
#
BIBLIO=biblio.bib
PUBLIS=content/publication
#-----------------------------------------------------

# Generate articles from Bibtex entries. 
# pip3 install -U academic
biblio: 
	@echo '==> Generating publication entries'
	academic import --bibtex -v $(BIBLIO) $(PUBLIS) 

clean:
	hugo mod clean
	hugo mod get -u ./...
	git config http.postBuffer 524288000

site:
	hugo

synchro-pull:
	git pull origin main
	git pull github main

synchro-push:
	git push origin main
	git push github main
	git remote update

deploy: public/index.html
	@echo "========================================"
	@echo "==> Deploy updates "
	#       rake && git commit -am ":memo: Deploy updates"; git pull; git push
	hugo && git commit -am "🤖 DEPLOY: last updates"; git pull; git push