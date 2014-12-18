package xt::Utils::postgresql;

use strict;
use warnings;
use Test::More;
use t::Utils;
eval "use Test::PostgreSQL 1.00";
plan skip_all => "Test::postgresql required" if $@;

my $pgsql = Test::PostgreSQL->new
    or plan skip_all => $Test::PostgreSQL::errstr;

{
    no warnings "redefine";
    sub t::Utils::setup_dbh {
        my $dbh = DBI->connect($pgsql->dsn);
        $dbh->{"Warn"} = 0;
        $dbh;
    }
}

1;
