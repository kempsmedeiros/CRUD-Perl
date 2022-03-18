#!/usr/bin/perl

use lib "../rules";

use CGI ':standard';
use AlunoRule;

print "Content-type: text/html\n\n";

my $id = param('editedId');

my $aluno_editado = AlunoRule->new();
my $stateHandler = $aluno_editado->getById($id);


print <<HTML; 
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap\@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Aluno</title>

</head>
<body>
     <div class="container">
     <h1 class="mt-2">Editar aluno</h1>
     <form action="../routes/AlunoRoute.cgi" method="GET">
     <input type="hidden" name="function" value="updateById"/>

HTML

while (my @data = $stateHandler->fetchrow_array()) {
my $id = $data[0];
my $nome = $data[1];
my $matricula = $data[2];
my $telefone = $data[3];

print "<div>
     <input type='hidden' name='id' value='$id'></div>";

print "<div>
     <label for='nome' class='form-label'>Nome: </label>
     <input type='text' name='nome' value='$nome'></div>";

print "<div>
     <label for='matricula' class='form-label'>Matricula: </label>
     <input type='text' name='matricula' value='$matricula'></div>";

print "<div>
     <label for='telefone' class='form-label'>Telefone: </label>
     <input type='text' name='telefone' value='$telefone'></div>";

}

print <<HTML
     <div>
     <!-- <a href="edit-aluno-back.pl?updateid=$id">EDITAR</a>-->
     <input type="submit" class="btn btn-primary">
     </div>
     </form>
     </div>
 </body>
</html>
HTML
