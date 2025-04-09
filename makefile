.PHONY: compile

compile:
	@$(MAKE) _compile DOCNAME=$(word 2, $(MAKECMDGOALS))

_compile:
	docker compose run --rm -e DOCNAME=$(DOCNAME) texlive $(DOCNAME)
	docker compose run --rm -e DOCNAME=$(DOCNAME) --entrypoint sh texlive -c 'find /pdf/$(DOCNAME) -type f ! -name "*.pdf" -delete'

# 無効なターゲットがエラーにならないように
%:
	@:
