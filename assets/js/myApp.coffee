# Declare app level module which depends on filters, and services
angular
  .module("myApp", [
    "myServices",
    "myFilters",
    "myDirectives",
    "ngRoute"
  ])
  .config ["$locationProvider", "$routeProvider",
    ($locationProvider, $routeProvider) ->
      $locationProvider.html5Mode true

      $routeProvider.when "/",
        templateUrl: "angular/sample/view1"

      $routeProvider.when "/view1",
        templateUrl: "angular/sample/view1"

      $routeProvider.when "/view2",
        templateUrl: "angular/sample/view2"

      $routeProvider.otherwise redirectTo: "/"
]
