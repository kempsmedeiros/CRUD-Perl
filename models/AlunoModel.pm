package AlunoModel;

use strict;
use warnings;

use lib "../modules";

use ConnectionDb;

my $connection = ConnectionDb->new();
my $database = $connection->connectDb();

sub new {
   my $class = shift;
   my $self = {
        #member variables
        id => shift,
        nome => shift,
        matricula => shift,
        telefone => shift,

    };
    bless $self, $class;
    return $self;

}

sub create {
    my ($self) = @_;
    my $query = "INSERT INTO alunos VALUES(?, ?, ?, ?)";
    my $stateHandler = $database->prepare($query);
    $stateHandler->execute($self->{id}, $self->{nome}, $self->{matricula}, $self->{telefone});
    
}


1;