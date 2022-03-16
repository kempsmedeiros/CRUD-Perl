#!/usr/bin/perl
use strict;
use CGI ':standard';
use lib "controllers"; 

use Alunos;

print "Content-type: text/html\n\n";


print <<HTML;
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap\@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Alunos</title>
</head>
<body>
    <div class="container">
   <h1 class="mt-2">Lista de Alunos</h1>
   <table class='table'>
   <tr><td>ID</td><td>Nome</td><td>Matricula</td><td>Telefone</td><td>Editar</td><td>Deletar</td></tr>
HTML


my $alunos = Alunos->new();
my $sth = $alunos->getAll();

while (my @data = $sth->fetchrow_array()) {
my $id = $data[0];
my $nome = $data[1];
my $matricula = $data[2];
my $telefone = $data[3];

print "<tr><td>$id</td><td>$nome</td><td>$matricula</td><td>$telefone</td>
        <td><a class='btn btn-primary' href='Views/edit-aluno.pl?editedId=$id'>Edit</a></td>
        <td><a class='btn btn-danger' href='Views/delete-aluno.pl?deleteId=$id'>Delete</a></td></tr>";

};



print <<HTML;
 </table>
 <br>
 <a class='btn btn-success' href='Views/add-aluno.pl'>CLIQUE AQUI</a> 
        Para adicionar um novo aluno</div></body></html>
HTML


