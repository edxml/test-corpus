.PHONY: all dependencies check test clean

all: test

dependencies:
	@echo "Installing dependencies:"
	composer install

check: dependencies
	@echo "Checking PHP code..."
	vendor/bin/php-cs-fixer fix --dry-run Corpus.php && echo "Well done. Your code is in shiny style!"

test: dependencies
	@echo "Running tests:"
	vendor/bin/phpunit TestCorpus.php

clean:
	@echo "Cleaning up:"
	rm -rf .php_cs.cache
