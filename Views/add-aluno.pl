#!/usr/bin/perl

print "Content-type: text/html\n\n";


print <<HTML 
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap\@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Aluno</title>

</head>
<body>
     <div class="container">
     <h1 class="mt-2">Formulario para cadastro de alunos</h1>
     <form action="../Helpers/add-aluno-back.pl" method="POST">
     <div class="form-group">
     <label for="id" class="form-label">Id: </label>
     <input type="number" name="id">
     </div>
     <div class="form-group">
     <label for="nome" class="form-label">Nome: </label>
     <input type="text" name="nome">
     </div>
     <div class="form-group">
     <label for="matricula" class="form-label">Matricula: </label>
     <input type="text" name="matricula">
     </div>
     <div class="form-group">
     <label for="telefone" class="form-label">Telefone: </label>
     <input type="text" name="telefone">
     </div>
     <div class="form-group">
     <input class="btn btn-primary" type="submit">
     </div>
     </form>
     </div>
 </body>
</html>
HTML
__END__


