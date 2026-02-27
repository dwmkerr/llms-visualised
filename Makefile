PORT ?= 8556

serve:
	@echo "Starting server at http://localhost:$(PORT)"
	@echo "Opening landing page in browser..."
	@python3 -m http.server $(PORT) &
	@sleep 1
	@open http://localhost:$(PORT)/chapters/01-embeddings/index.html
	@wait

deploy:
	git push origin main
	@echo "GitHub Actions will deploy to Pages automatically"
