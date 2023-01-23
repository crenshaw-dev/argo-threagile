.PHONY: build
build:
	docker run --rm -it -v "${PWD}":/app/work threagile/threagile -verbose -model /app/work/threagile.yaml -output /app/work
	# Pretty-print.
	jq 'sort_by(.synthetic_id)' risks.json --sort-keys > risks-formatted.json
	rm risks.json
	mv risks-formatted.json risks.json
	jq . stats.json > stats-formatted.json
	rm stats.json
	mv stats-formatted.json stats.json
