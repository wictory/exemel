use v6;
use Test;
use lib 'lib';

use XML;

plan 6;

ok open-xml('<xml></xml>'), 'open xml from Str';
ok open-xml('t/example.xml'), 'open xml from path Str';
ok open-xml('t/example.xml'.IO), 'open xml from IO::Path';
ok open-xml('t/example.xml'.IO.open), 'open xml from IO::Handle;';

dies-ok { open-xml(1) }, 'parsing an integer should fail';
dies-ok { open-xml(1.0) }, 'parsing a number should fail';
