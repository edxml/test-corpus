|license| |python package| |php package|

.. |license| image::  https://img.shields.io/badge/License-MIT-blue.svg
.. |python package| image::    https://github.com/edxml/test-corpus/workflows/Python%20package/badge.svg
.. |php package| image::    https://github.com/edxml/test-corpus/workflows/PHP%20package/badge.svg

=====================
The EDXML Test Corpus
=====================

The EDXML test corpus is a collection of portable unit tests for EDXML implementations. Each unit test consists of one or more EDXML files. Implementations can be subjected to the tests by having them parse the files. The focus of the collection is on testing if implementations correctly detect invalid input and more generally on driving implementations off their happy path.

The collection is not complete in the sense that it provides any guarantees regarding the correctness or quality of implementations that pass the tests. Implementations must always be validated against the `EDXML Specification <http://www.edxml.org/spec>`_.

The collection is also no substitute for unit tests that directly invoke the internal APIs of an implementation. The test corpus is complementary, adding particular value for testing the handling of invalid EDXML data which is typically difficult to produce using internal APIs.

How to Use
==========

The test corpus can be used in your projects by cloning this repository. For PHP and Python projects you can also use a package manager to add the test corpus as a dependency. This repository includes both a `Python package`_ and a `Composer package`_ for PHP.

.. _Python package: python/edxml-test-corpus
.. _Composer package: php

Testing if a file or set of files was parsed correctly is done in various ways, depending on the type of test. The collection is subdivided in three categories containing tree different types of tests:

1. Valid data that implementations must ingest without problems (in ``valid/``)
2. Invalid data that implementations must refuse to ingest (in ``invalid/``)
3. Conflicting / non-conflicting data that implementations must detect (in ``conflict/``)

These three types of tests are explained in detail below.

Testing valid data
------------------
These tests can be used to verify that an implementation can successfully parse valid EDXML data that is presented to it. Success can be determined in two different ways.

1. Parsing must not result in any errors produced by the implementation.
2. When the test includes a file named ``expected.edxml``, the correctness of the internal representation that is the result of parsing the input data can be verified.

Testing the correctness of the internal representation of input EDXML data is done by having the implementation serialize this representation back to EDXML and comparing this to ``expected.edxml``. When both EDXML data sets are `equivalent`, the test is successful. Given two EDXML data sets A and B equivalence means that

1. Each event in A must have an equivalent event in B, and the other way around. The meaning of equivalence for EDXML events is defined in the `EDXML Specification <http://www.edxml.org/spec>`_.
2. The combination of all ``<ontology>`` elements from A must be the equivalent of the combination of all ``<ontology>`` elements from B, and the other way around. The meaning of equivalence for EDXML ontologies is defined in the `EDXML Specification <http://www.edxml.org/spec>`_.

Each test is contained in its own subdirectory. The files that need to be ingested are named ``input-xxx.edxml`` where the ``xxx`` represents a sequence number. The files are intended to be ingested in the order as indicated by these sequence numbers. Depending on the implementation this may or may not make any difference.

Testing invalid data
--------------------
These tests can be used to verify that an implementation can successfully detect various errors in EDXML input data. Each of the EDXML files in this sub-collection must be refused by the implementation as being invalid.

There can be various aspects of EDXML data that can be invalid, like an ontology definition or the structure of an event. Implementations may produce specific types of exceptions for each of these cases. The files are grouped by these aspects to allow testing for specific types of exceptions being produced by the implementation.

Testing conflict handling
------------------------
EDXML events can be versioned and versioned events can yield conflicts. These tests include events that are conflicting as well as events that are not. EDXML implementations must correctly identify both.
