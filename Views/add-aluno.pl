#!/usr/bin/perl

print "Content-type: text/html\n\n";


print <<HTML 
<!DOCTYPE html>
<html ng-app="addNewAluno">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap\@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular-route.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular-animate.js"></script>
    <script type="text/javascript">
        angular
            .module('addNewAluno', [])
            .controller('newAluno', ['\$scope', '\$http', function(\$scope, \$http) {
                \$scope.title = "Formulario para cadastro de alunos";
                \$scope.newAluno = {
                    id: "",
                    nome: "",
                    matricula: "",
                    telefone: ""
                }
                \$scope.submit = function() {
                    \$http.get('http://localhost/cgi-bin/CRUD-Perl-refactored/routes/AlunoRoute.cgi?function=create&id=' + \$scope.newAluno.id + '&nome=' + \$scope.newAluno.nome + '&matricula=' + \$scope.newAluno.matricula + '&telefone=' + \$scope.newAluno.telefone)
                    .then(function(res) {
                    \$scope.AlunoEdited = res.data[0];
                    window.location.href = "http://localhost/cgi-bin/CRUD-Perl-refactored/index.cgi";
                    });
                    
                };

            }]);
    </script>
    <title>Adicionar Aluno</title>

</head>
<body>
     <div class="container" ng-controller="newAluno">
     <h1 class="mt-2">{{title}}</h1>
     <form ng-submit="submit()">
     <div class="form-group">
     <label for="id" class="form-label">Id: </label>
     <input type="number" name="id" ng-model="newAluno.id">
     </div>
     <div class="form-group">
     <label for="nome" class="form-label">Nome: </label>
     <input type="text" name="nome" ng-model="newAluno.nome">
     </div>
     <div class="form-group">
     <label for="matricula" class="form-label">Matricula: </label>
     <input type="text" name="matricula" ng-model="newAluno.matricula">
     </div>
     <div class="form-group">
     <label for="telefone" class="form-label">Telefone: </label>
     <input type="text" name="telefone" ng-model="newAluno.telefone">
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


