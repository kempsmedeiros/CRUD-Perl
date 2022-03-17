package Alunos;

use strict;
use warnings;

use DBI;

## Usar somente isso para importar a variavel $dbh
use lib ".";

use ConnectDb;

my $connection = ConnectDb->new();
my $dbh = $connection->conn();

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

sub setId {
    my ($self, $newId) = @_;
    $self->{id} = $newId if defined($newId);
    return $self->{id};
}

sub getId {
    my ($self) = @_;
    return $self->{id};
}

sub setNome {
    my ($self, $newNome) = @_;
    $self->{nome} = $newNome if defined($newNome);
    return $self->{nome};
}

sub getNome {
    my ($self) = @_;
    return $self->{nome};
}

sub setMatricula {
    my ($self, $newMatricula) = @_;
    $self->{matricula} = $newMatricula if defined($newMatricula);
    return $self->{matricula};
}

sub getMatricula {
    my ($self) = @_;
    return $self->{matricula};

}

sub setTelefone {
    my ($self, $newTelefone) = @_;
    $self->{telefone} = $newTelefone if defined($newTelefone);
    return $self->{telefone};
}

sub getTelefone {
    my ($self) = @_;
    return $self->{telefone};
}

sub getAll {
    my ($self) = @_;
    my $query = "SELECT id, nome, matricula, telefone FROM alunos";
    my $sth = $dbh->prepare($query);
    $sth->execute();
    return $sth;    

}

sub getById {
    my ($self, $id_passed) = @_;
    my $query = "SELECT id, nome, matricula, telefone FROM alunos WHERE id=$id_passed";
    my $sth = $dbh->prepare($query);
    $sth->execute();
    return $sth;
}
    
sub save {
    my ($self) = @_;
    my $query = "INSERT INTO alunos VALUES(?, ?, ?, ?)";
    my $sth = $dbh->prepare($query);
    $sth->execute($self->{id}, $self->{nome}, $self->{matricula}, $self->{telefone});
}

sub update {
    my ($self, $id, $nome, $matricula, $telefone) = @_;
    my $query = "UPDATE alunos SET nome='$nome', matricula='$matricula', telefone='$telefone' WHERE id='$id'";
    my $sth = $dbh->prepare($query);
    $sth->execute();
}

sub deleteById {
    my ($self, $id_passed) = @_;
    my $query = "DELETE FROM alunos WHERE id=$id_passed";
    my $sth = $dbh->prepare($query);
    $sth->execute();
}


1;

