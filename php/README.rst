|license| |phpversion|

.. |license| image::  https://img.shields.io/badge/License-LGPL%20v3-blue.svg
.. |phpversion| image::  https://shields.io/badge/php-%5E7.4%20%7C%20%5E8.0-blue

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
