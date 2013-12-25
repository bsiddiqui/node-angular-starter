angular.module('myApp').controller 'SampleCtrl', ['$scope',
  ($scope, $http, User, Authentication) ->
    $scope.message = "hello world"
]
