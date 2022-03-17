#!/usr/bin/perl

use strict;
use CGI ':standard';
use lib "../controllers"; 
use Alunos;

my $q = CGI->new;
print $q->redirect('../index.pl');


print "Content-type: text/html\n\n";


my $id = param('id');
my $nome = param('nome');
my $matricula = param('matricula');
my $telefone = param('telefone');

my $aluno_editado = Alunos->new();
$aluno_editado->update($id, $nome, $matricula, $telefone);

