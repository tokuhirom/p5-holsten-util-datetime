use perl5i::2;
use Holsten::Util::DateTime;
use Test::More;

subtest 'strptime' => sub {
    {
        my $t = strptime('%Y-%m-%d' => '2010-08-09');
        is $t->year, 2010;
        is $t->month, 8;
        is $t->day, 9;
        isa_ok $t->time_zone, ref(localtime->time_zone);
    }

    {
        my $t = strptime('2010-08-09' => '%Y-%m-%d');
        is $t->ymd, '2010-08-09', 'reverse order';
    }
    done_testing;
};

subtest 'parse_date' => sub {
    is parse_date('2010-08-08')->ymd(), '2010-08-08';
    done_testing;
};

subtest 'parse_datetime' => sub {
    is parse_datetime('2010-08-09 01:02:03')->strftime('%T %Y-%m-%d'), '01:02:03 2010-08-09';
    done_testing;
};

subtest 'make_daily_list' => sub {
    my @dates = make_daily_list(parse_date('2010-08-08'), parse_date('2010-08-12'));
    is scalar(@dates), 5;
    is join(',', map { $_->ymd } @dates), '2010-08-08,2010-08-09,2010-08-10,2010-08-11,2010-08-12';
    done_testing;
};

done_testing;
