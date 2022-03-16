package ConnectDb;

use strict;
use warnings;
use DBI;

## Usando o modulo Exporter para exportar uma variavel
use Exporter qw(import);
### Usar "our" ao invés de "my"
our @EXPORT = qw($dbh);

my $db = 'DBI:mysql:escola';
my $user = 'kemps';
my $password = 'root';

## lembrar de usar "our" ao invés de "my" para exportar
our $dbh = DBI->connect ($db,
                        $user,
                        $password) 
                        or die "Can't connect to database: $DBI::errstr\n";


1;