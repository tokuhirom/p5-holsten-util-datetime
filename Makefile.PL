use inc::Module::Install;
name 'Holsten-Util-DateTime';
all_from 'lib/Holsten/Util/DateTime.pm';

requires 'perl5i::2';
requires 'DateTime';
requires 'DateTime::Format::Strptime';
requires 'DateTime::Util::DayOfWeek';
requires 'DateTime::Event::Recurrence';
requires 'Test::More' => 0.88; # done_testing, subtest

readme_markdown_from 'lib/Holsten/Util/DateTime.pm';
tests 't/*.t t/*/*.t t/*/*/*.t t/*/*/*/*.t';
test_requires 'Test::More';
test_requires 'YAML';
author_tests('xt');
# use_test_base;
auto_include;
WriteAll;
