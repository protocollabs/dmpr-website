
help_install_jekyll:
	@echo "Install Jekyll"
	@echo "sudo apt-get install ruby-full"
	@echo "sudo gem install jekyll"
	@echo "sudo gem install bundler\n"

help_install_gae:
	@echo "Install Google GAE"
	@echo "mkdir -p $$HOME/src/www"
	@echo "cd $$HOME/src/www"
	@echo "wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-141.0.0-linux-x86_64.tar.gz"
	@echo "./google-cloud-sdk/install.sh\n"

help: help_install_jekyll help_install_gae

serve-local:
	bundle exec jekyll serve

create:
	bundle exec jekyll build

upload: create
	cp app.yaml _site
	cd _site
	$(HOME)/src/www/google-cloud-sdk/bin/gcloud app deploy
