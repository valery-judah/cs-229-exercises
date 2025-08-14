setup:        ## create venv + install
	python -m venv .venv && . .venv/bin/activate && pip install -U pip && pip install -r requirements.txt && pip install -r requirements-dev.txt
smoke:        ## run a tiny sanity notebook
	.venv/bin/pytest -q -k smoke
test:         ## run all tests (incl. notebooks)
	.venv/bin/pytest -q
check:        ## lint/format/docs links
	pre-commit run --all-files
clean:        ## remove temporary files
	rm -rf .venv
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -delete
help:         ## show this help message
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-20s %s\n", $$1, $$2}'
