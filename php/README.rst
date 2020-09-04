======================================
The EDXML Test Corpus Composer Package
======================================

This is a PHP / Composer package that provides the EDXML test corpus. It can be used to include the test corpus in PHP projects by adding this package as a dependency::

    composer require edxml/test-corpus

Besides the corpus data files the package also provides a constant which contains the path to the root directory containing the data files. It can be used like this:

.. code-block:: php

    <?php

    use Edxml\Testing\Corpus;

    echo 'The test are in this path: ' . Corpus::PATH;
