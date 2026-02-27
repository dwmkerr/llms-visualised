serve:
	python3 -m http.server 8080

build:
	@echo "Static site — no build step needed"

deploy:
	git push origin main
	@echo "GitHub Actions will deploy to Pages automatically"
