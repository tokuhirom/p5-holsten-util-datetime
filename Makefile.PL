use inc::Module::Install;
name 'Holsten-Util-DateTime';
all_from 'lib/Holsten/Util/DateTime.pm';

# requires '';


readme_markdown_from 'lib/Holsten/Util/DateTime.pm';
tests 't/*.t t/*/*.t t/*/*/*.t t/*/*/*/*.t';
test_requires 'Test::More';
test_requires 'YAML';
author_tests('xt');
# use_test_base;
auto_include;
WriteAll;
