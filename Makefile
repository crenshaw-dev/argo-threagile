.PHONY: build
build:
	docker run --rm -it -v "${PWD}":/app/work threagile/threagile -verbose -model /app/work/threagile.yaml -output /app/work
	# Pretty-print.
	jq 'map(.data_breach_technical_assets |= sort) | sort_by(.synthetic_id)' risks.json --sort-keys > risks-formatted.json
	rm risks.json
	mv risks-formatted.json risks.json
	jq . stats.json --sort-keys > stats-formatted.json
	rm stats.json
	mv stats-formatted.json stats.json
