.PHONY: all python-package check test clean

python-package:
	cd python/edxml-test-corpus && $(MAKE) dist

check:
	cd python/edxml-test-corpus && $(MAKE) check
	cd php && $(MAKE) check

test:
	cd python/edxml-test-corpus && $(MAKE) check
	cd php && $(MAKE) check

clean:
	cd python/edxml-test-corpus && $(MAKE) clean
	cd php && $(MAKE) clean

