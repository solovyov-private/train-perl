#!/usr/bin/perl


use DBI;
use Encode;
use Data::Dumper;
#use utf8;

#binmode STDOUT, ":utf8";
#binmode STDIN, ":utf8";

#my $DNS = 'dbi:mysql:database=DB_NAME;host=localhost;port=3306;';
my $DNS = 'dbi:mysql:database=DB_NAME;host=localhost;port=3306;mysql_read_default_file=/etc/my.cnf;';
my $user = 'user';
my $pass = 'pass';
my$param = {
              (
#                mysql_enable_utf8mb4 => 1,
#                mysql_enable_utf8 => 1,
                 RaiseError => 1,
                 PrintError => 1
              )
};

my $dbh = DBI->connect($DNS, $user, $pass, $param);
#$dbh->{'mysql_enable_utf8'}             = 1;
#$dbh->do("SET character_set_client      = utf8;");
#$dbh->do("SET character_set_connection  = latin1;");
$dbh->do("SET character_set_results     = utf8;");
#$dbh->do("SET character_set_server      = latin1;");

my $sth = $dbh->prepare("SELECT * FROM TABLE order by ID asc");

$sth->execute();

my(@row);

while(@row = $sth->fetchrow_array){
        print STDOUT Dumper \@row;
        print STDOUT "----> ".encode_utf8($row[1])." <----\n";
        print STDOUT "----> ".Dumper($row[1])." <----\n";
}

$dbh->disconnect;
