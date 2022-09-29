.PHONY: all dependencies dist pypi check test clean

all: check test dist

dependencies:
	@echo "Installing dependencies:"
	python3 -m pip install --upgrade pip setuptools wheel
	pip3 install flake8 pytest

check: dependencies
	@echo "Checking Python code..."
	python3 -m flake8 --max-line-length=120 && echo "Well done. Your code is in shiny style!"

test: dependencies
	@echo "Running tests:"
	python3 -m pytest tests -W ignore::DeprecationWarning

dist: clean
	pip3 install wheel
	@echo "Building distribution:"
	python3 setup.py sdist bdist_wheel

pypi: dist
	# NOTE: twine will read TWINE_USERNAME and TWINE_PASSWORD from environment
	pip3 install twine
	twine check dist/*
	@echo "Uploading to PyPI:"
	twine upload dist/*

clean:
	@echo "Cleaning up:"
	rm -rf build dist edxml_test_corpus.egg-info
