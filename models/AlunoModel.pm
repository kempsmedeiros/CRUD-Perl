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

sub getAll {
    my ($self) = @_;
    my $query = "SELECT id, nome, matricula, telefone FROM alunos";
    my $stateHandler = $database->prepare($query);
    $stateHandler->execute();
    return $stateHandler;
    
}

sub getById {
    my ($self, $id_passed) = @_;
    my $query = "SELECT id, nome, matricula, telefone FROM alunos WHERE id=?";
    my $stateHandler = $database->prepare($query);
    $stateHandler->execute($id_passed);
    return $stateHandler;
}

sub updateById {
    my ($self, $id_passed) = @_;
    my $query = "UPDATE alunos SET nome=?, matricula=?, telefone=? WHERE id=?";
    my $stateHandler = $database->prepare($query);
    $stateHandler->execute($self->{nome}, $self->{matricula}, $self->{telefone}, $self->{id});
}


1;