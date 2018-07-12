/**
 * Created by Glenio on 12/07/2018.
 */
app.controller("formEmpresaRepresentante", function ($scope, $http){
    $scope.minhaEmpresa= "";
    $scope .cidades=[];

    $http.get('listarEmpresaUsuario.priv').then(function (retorno) {
        $scope.minhaEmpresa= retorno.data;
    });

    $http.get('listarCidades.priv').then(function (retorno) {
        console.log(retorno.data);
        $scope.cidades= retorno.data;
    });

    $scope.addCidade = function (cidade) {
        cidade.empresa= $scope.minhaEmpresa;
        console.log(cidade);
        $http.post('addCidade.priv', cidade).then(function () {
            console.info('cadastrado com sucesso');
            $http.get('listarCidades.priv').then(function (retorno) {
                $scope.cidades= retorno.data;
            });
        });


    }

});

