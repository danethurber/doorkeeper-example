angular.module 'app', ['ui.router']


angular.module('app').config ($stateProvider, $urlRouterProvider) ->

  $urlRouterProvider.otherwise '/'

  $stateProvider
    .state 'root',
      url: '/',
      template: """
        <p>root</p>
      """
