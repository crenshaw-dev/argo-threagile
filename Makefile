.PHONY: build
build:
	docker run --rm -it -v "${PWD}":/app/work threagile/threagile -verbose -model /app/work/threagile.yaml -output /app/work
	# Pretty-print.
	jq . risks.json > risks-formatted.json
	rm risks.json
	mv risks-formatted.json risks.json
