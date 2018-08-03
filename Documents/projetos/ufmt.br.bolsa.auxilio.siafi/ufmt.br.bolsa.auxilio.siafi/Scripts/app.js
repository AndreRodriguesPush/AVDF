var app = angular.module('PortalSistemas', []);
//var urlPadrao = '/';
var urlPadrao = '/ufmt.portalsistemas/';

var gerandoToken = function (app, idUsuario, $scope, $http, $window) {
    $http
        .post(urlPadrao + 'Login/GerarToken', { "idAplicacao": app.AplicacaoUID, "idUsuario": idUsuario })
        .then(function (data) {
            window.open(app.Url, '_blank');
            $scope.erro = false;
        }, function () {
            window.open(app.Url, '_blank');
            $scope.mensagem = "Falha ao gerar Token, tente novamente!";
            $scope.erro = true;
        });
}

app.controller('Academico', function ($scope, $http, $window, $filter) {
    $scope.gerarToken = function (app, idUsuario) {
        gerandoToken(app, idUsuario, $scope, $http, $window);
    }

    $scope.init = function () {
        $http({ method: 'POST', url: urlPadrao + 'Sistema/Academico' })
            .then(function (retorno) {
                $scope.academicos = retorno.data;
            }, function () {
                console.log("Falha ao carregar registro de sistemas");
            });
    }

    $scope.sortBy = function (propriedade) {
        $http({ method: 'POST', url: urlPadrao + 'Sistema/Academico' })
            .then(function (retorno) {
                $scope.academicos = retorno.data;
            }, function () {
                console.log("Falha ao carregar registro de sistemas");
            });

        $scope.academicos = $filter('orderBy')($scope.academicos, propriedade, $scope.reverse);
        $scope.reverse = !$scope.reverse;
    };

    $scope.getAcessadosRecentemente = function (idUsuario, idPublico) {
        $http
            .post(urlPadrao + 'Sistema/GetAcessadosRecentemente', { "usuarioUID": idUsuario, "publicoUID": idPublico })
        .then(function (data) {
            $scope.academicos = data.data;
        }, function () {
            $scope.mensagem = "Falha ao buscar os sistemas acessados recentemente, tente novamente!";
            $scope.erro = true;
        });
    }

    $scope.getMaisAcessados = function (categoria) {
        $http
            .post(urlPadrao + 'Sistema/GetMaisAcessados', { "categoria": categoria })
            .then(function (data) {
                $scope.academicos = data.data;
            }, function () {
                $scope.mensagem = "Falha buscar os sistemas mais acessados, tente novamente!";

            });
    }
});

app.controller('Administrativo', function ($scope, $http, $window, $filter) {
    $scope.gerarToken = function (app, idUsuario) {
        gerandoToken(app, idUsuario, $scope, $http, $window);
    }

    $scope.init = function () {
        $http
            .post(urlPadrao + 'Sistema/Administrativo')
            .then(function (retorno) {
                $scope.admins = retorno.data;
            }, function () {
                console.log("Falha ao carregar registro de sistemas");
            });
    }

    $scope.sortBy = function (propriedade) {
        $http
            .post(urlPadrao + 'Sistema/Administrativo')
            .then(function (retorno) {
                $scope.admins = retorno.data;
            }, function () {
                console.log("Falha ao carregar registro de sistemas");
            });

        $scope.admins = $filter('orderBy')($scope.admins, propriedade, $scope.reverse);
        $scope.reverse = !$scope.reverse;
    };

    $scope.getAcessadosRecentemente = function (idUsuario, idPublico) {
        $http
        .post(urlPadrao + 'Sistema/GetAcessadosRecentemente', { "usuarioUID": idUsuario, "publicoUID": idPublico })
            .then(function (data) {
                $scope.admins = data.data;
            }, function () {
                $scope.mensagem = "Falha ao buscar os sistemas acessados recentemente, tente novamente!";
                $scope.erro = true;
            });
    }

    $scope.getMaisAcessados = function (categoria) {
        $http
            .post(urlPadrao + 'Sistema/GetMaisAcessados', { "categoria": categoria })
            .then(function (data) {
                $scope.admins = data.data;
            }, function () {
                $scope.mensagem = "Falha buscar os sistemas mais acessados, tente novamente!";

            });
    }
});

app.controller('GestaoPessoas', function ($scope, $http, $window, $filter) {
    $scope.gerarToken = function (app, idUsuario) {
        gerandoToken(app, idUsuario, $scope, $http, $window);
    }

    $scope.init = function () {
        $http
            .post(urlPadrao + 'Sistema/GestaoPessoas')
            .then(function (retorno) {
                $scope.gestoes = retorno.data;
            }, function () {
                console.log("Falha ao carregar registro de sistemas");
            });
    }

    $scope.sortBy = function (propriedade) {
        $http
            .post(urlPadrao + 'Sistema/GestaoPessoas')
            .then(function (retorno) {
                $scope.gestoes = retorno.data;
            }, function () {
                console.log("Falha ao carregar registro de sistemas");
            });

        $scope.gestoes = $filter('orderBy')($scope.gestoes, propriedade, $scope.reverse);
        $scope.reverse = !$scope.reverse;
    };

    $scope.getAcessadosRecentemente = function (idUsuario, idPublico) {
        $http
            .post(urlPadrao + 'Sistema/GetAcessadosRecentemente', { "usuarioUID": idUsuario, "publicoUID": idPublico })
            .then(function (data) {
                $scope.gestoes = data.data;
            }, function () {
                $scope.mensagem = "Falha ao buscar os sistemas acessados recentemente, tente novamente!";
                $scope.erro = true;
            });
    }

    $scope.getMaisAcessados = function (categoria) {
        $http
            .post(urlPadrao + 'Sistema/GetMaisAcessados', { "categoria": categoria })
            .then(function (data) {
                $scope.gestoes = data.data;
            }, function () {
                $scope.mensagem = "Falha buscar os sistemas mais acessados, tente novamente!";

            });
    }
});

app.controller('Comunicacao', function ($scope, $http, $window, $filter) {
    $scope.gerarToken = function (app, idUsuario) {
        gerandoToken(app, idUsuario, $scope, $http, $window);
    }

    $scope.init = function () {
        $http
            .post(urlPadrao + 'Sistema/Comunicacao')
            .then(function (retorno) {
                $scope.comunicacoes = retorno.data;
            }, function () {
                console.log("Falha ao carregar registro de sistemas");
            });
    }

    $scope.sortBy = function (propriedade) {
        $http
            .post(urlPadrao + 'Sistema/Comunicacao')
            .then(function (retorno) {
                $scope.comunicacoes = retorno.data;
            }, function () {
                console.log("Falha ao carregar registro de sistemas");
            });

        $scope.comunicacoes = $filter('orderBy')($scope.comunicacoes, propriedade, $scope.reverse);
        $scope.reverse = !$scope.reverse;
    };

    $scope.getAcessadosRecentemente = function (idUsuario, idPublico) {
        $http
            .post(urlPadrao + 'Sistema/GetAcessadosRecentemente', { "usuarioUID": idUsuario, "publicoUID": idPublico })
            .then(function (data) {
                $scope.comunicacoes = data.data;
            }, function () {
                $scope.mensagem = "Falha ao buscar os sistemas acessados recentemente, tente novamente!";
                $scope.erro = true;
            });
    }

    $scope.getMaisAcessados = function (categoria) {
        $http
            .post(urlPadrao + 'Sistema/GetMaisAcessados', { "categoria": categoria })
            .then(function (data) {
                $scope.comunicacoes = data.data;
            }, function () {
                $scope.mensagem = "Falha buscar os sistemas mais acessados, tente novamente!";

            });
    }
});

app.controller('Todos', function ($scope, $http, $window, $filter) {
    $scope.gerarToken = function (app, idUsuario) {
        gerandoToken(app, idUsuario, $scope, $http, $window);
    }

    $scope.init = function () {
        $http.post(urlPadrao + 'Sistema/Todos')
            .then(function (retorno) {
                $scope.todos = retorno.data;
            }, function () {
                console.log("Falha ao carregar registro de sistemas");
            });
    }

    $scope.sortBy = function (propriedade) {
        $http.post(urlPadrao + 'Sistema/Todos')
            .then(function (retorno) {
                $scope.todos = retorno.data;
            }, function () {
                console.log("Falha ao carregar registro de sistemas");
            });

        $scope.todos = $filter('orderBy')($scope.todos, propriedade, $scope.reverse);
        $scope.reverse = !$scope.reverse;
    };

    $scope.getAcessadosRecentemente = function (idUsuario, idPublico) {
        var req = {
            method: 'POST',
            url: urlPadrao + 'Sistema/GetAcessadosRecentemente',
            headers: {
                'Content-Type': 'application/json'
            },
            data: { "usuarioUID": idUsuario, "publicoUID": idPublico }
        }

        $http(req)
            .then(function (data) {
                $scope.todos = data.data;
            }, function () {
                $scope.mensagem = "Falha ao buscar os sistemas acessados recentemente, tente novamente!";
                $scope.erro = true;
            });
    }

    $scope.getMaisAcessados = function (categoria) {
        $http
            .post(urlPadrao + 'Sistema/GetMaisAcessados', { "categoria": categoria })
            .then(function (data) {
                $scope.todos = data.data;
            }, function () {
                $scope.mensagem = "Falha buscar os sistemas mais acessados, tente novamente!";
            });
    }
});