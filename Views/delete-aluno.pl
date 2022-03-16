#!/usr/bin/perl

use CGI ':standard';
use lib "../controllers"; 
use Alunos;

print "Content-type: text/html\n\n";

my $id = param('deleteId');

my $aluno_deletado = Alunos->new();
$aluno_deletado->deleteById($id);


print <<HTML
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap\@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deletar aluno</title>
</head>
<body>
    <div class="container mt-5">
    <div>o Id : $id foi deletado com sucesso\n\n</div>
    <div><a href='../index.pl' class="btn btn-success">Clique aqui</a> 
    para voltar a listagem de Alunos</div>
    </div>
</body>
</html>
HTML