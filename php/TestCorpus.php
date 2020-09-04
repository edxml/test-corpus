<?php

use PHPUnit\Framework\TestCase;
use Edxml\Testing\Corpus;

class TestCorpus extends TestCase
{
    public function testCorpusPath(): void
    {
        self::assertStringContainsString("corpus/", Corpus::PATH);
    }
}
