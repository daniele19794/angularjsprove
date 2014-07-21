var demoApp = angular
				.module('demoApp', [ 'customFilters' ])
				.controller(
						'personController',

						function($scope, $http, ProgettiService) {

							$scope.showAlert = false;
							$scope.alertMessage = '';

							$scope.formAddProgetto = {};
							$scope.formAddProgetto.titolo = "";

							$scope.formAddItem = {};
							$scope.formAddItem.titolo = "";
							$scope.formAddItem.progetto = "";

							//Gestione Paginazione

							$scope.selectedPage = 1;
							$scope.pageSize = 2;
							$scope.selectPage = function(newPage) {
								$scope.selectedPage = newPage;
							}

							$scope.getPageClass = function(page) {
								return $scope.selectedPage == page ? 'btn-primary'
										: '';
							}

							$scope.showError = function() {
								console.log('showerror');
							}

							$scope.deleteProgetto = function(row) {
								console.info(row);
								$scope.progetti.splice(row, 1);
							}

							$scope.currentProgetto = function(row) {
								console.info('provaaaa' + row);
								$scope.formAddItem.progetto = row;
							}

							$scope.addProgetto = function() {
								$scope.progetti.push({
									titolo : $scope.formAddProgetto.titolo,
									dataInizio : '10/10/2012',
									dataFine : '10/10/2012',
								//items:{item:{titolo:'item1'},item:{titolo:'item1'}}
								});
								console.info($scope.formAddProgetto.titolo);
							};

							$scope.deleteItem = function(rowIndex, i) {
								console.info('prova' + i + 'sdaf ' + rowIndex);
								$scope.progetti[rowIndex].items.splice(
										$scope.progetti[rowIndex].items
												.indexOf(i), 1);

								// aggiungere aggiornamento db

							};
							$scope.chiama = function() {
								console.log('chiama');
								var responsePromise = $http
										.get("http://localhost:8080/angularjsprove/rest/emp/dummy");

								responsePromise.success(function(data, status,
										headers, config) {

									console.log('adfasdf ' + data.titolo);
									//$scope.myData.name = data.name;

								});
								responsePromise
										.error(function(data, status, headers,
												config) {
											$scope.showAlert = true;
											$scope.alertMessage = 'Errore nel recupero dati dal server';

										});
							};

							//$scope.progetti =[{id:1, titolo:'prova'}]

							$scope.getProgetti = function() {
								console.log('getProgetti');
								//$scope.pro = ProgettiService.getAllProgetti();
								// $http
								//		.get(
								//				'http://localhost:8080/angularjsprove/rest/emps').success(function(data) {
								//			        $scope.progetti = data;
								//

							};

							$scope.getAllItems = function() {
								console.log('getAllItems');
								var i = {
									item : [ {
										id : "id1",
										titolo : "titolo1"
									}, {
										id : "id2",
										titolo : "titolo2"
									} ]

								};
								return i;
							};

							$scope.getItems = function(progetto) {
								console.log('getItems ' + progetto);
								console.log('progetto sel ' + progetto);
								if (progetto == 'A') {
									console.log('progetto A');
									$scope.itemsStatici = {
										item : [ {
											id : "id1",
											titolo : "titolo1"
										}, {
											id : "id2",
											titolo : "titolo2"
										} ]
									};
								} else if (progetto == 'B') {
									console.log('progetto sel B');
									$scope.itemsStatici = {
										item : [ {
											id : "id3",
											titolo : "titolo3"
										}, {
											id : "id4",
											titolo : "titolo4"
										} ]

									};
								}
								;

							};

							$scope.showTableItems = function() {

								if (angular.isUndefined($scope.itemsStatici)
										|| $scope.itemsStatici.item.length == 0) {
									return false;
								} else {
									return true;
								}

							};

							$scope.progettiStatici = {
								progetto : [ {
									id : "Product #1",
									titolo : "A",
									items : [ {
										titolo : 'item a'
									}, {
										titolo : 'item b'
									}, {
										titolo : 'item c'
									} ]

								}, {
									id : "Product #2",
									titolo : "B",
									items : [ {
										titolo : 'item b'
									} ]
								}, {
									id : "Product #3",
									titolo : "C",
									items : [ {
										titolo : 'item c'
									} ]
								}, {
									id : "Product #4",
									titolo : "D",
									items : [ {
										titolo : 'item a'
									} ]
								} ]
							};
							console.log('progetti --> ' + $scope.progetti);

							console.log('progetti ' + $scope.progetti);

							$scope.selectedProgetto = null;

							$scope.selectProgetto = function(progetto) {
								console.log('showerror ' + progetto.titolo);
								$scope.selectedProgetto = progetto;
								$scope.getItems(progetto.titolo);
							}

							$scope.addProgettoPost = function() {
								console.log('addProgettoPost');
								ProgettiService.addProgetto($scope.progetto);

							};

							$scope.getProgettoClass = function(progetto) {
								console
										.log('class ' + $scope.selectedProgetto == progetto ? 'btn-primary'
												: "");
								return $scope.selectedProgetto == progetto ? 'btn-primary'
										: "";
							}

							$scope.deleteProgetto = function() {
								console.log('deleteProgetto');
								ProgettiService.deleteProgetto('2');

							};

							$scope.addItem = function() {

								console.log('datainizio '
										+ $scope.formAddItem.dataInizio);
								$scope.progetti[$scope.progetti
										.indexOf($scope.formAddItem.progetto)].items
										.push({
											titolo : $scope.formAddItem.titolo,
											dataInizio : $scope.formAddItem.dataInizio,
											dataFine : $scope.formAddItem.dataFine,
										//items:{item:{titolo:'item1'},item:{titolo:'item1'}}
										});
								ProgettiService
										.updateProgetto($scope.progetti[$scope.progetti
												.indexOf($scope.formAddItem.progetto)]);

							}

						});

		demoApp
				.run(function($rootScope, $http, ProgettiService) {
					console
							.log('demo app run, qui va fatta la prima chiamata per caricare di dati lato server');
					//$rootScope.progetti = ProgettiService.getAllProgetti();
					$rootScope.progettiOLD = $http.get("resources/data.json")
							.success(
									function(data) {
										console.log('data --> '
												+ angular.toJson(data));
										angular.forEach(data, function(d) {
											console.log(d.titolo);
										});
									});

				});
		/* demoApp
		.factory('ProgettiFactory',function()){
			var progettiFactory=[];

			return {
				addProgetto: function (titolo){
					console.log('addProgetto in Factory');
					},
				removeProgetto: function (titolo){
					console.log('removeProgetto in Factory');
					},
				getProgetti: function(){
					console.log('getProgetti in Factory');
					}	
			}
		
			
			}); */

		demoApp
				.service(
						'ProgettiService',
						function($http) {
							this.getAllProgetti = function() {
								console.log('Get all progetti ');

								//$scope.pro = ProgettiService.getAllProgetti();
								return $http
										.get(
												'http://localhost:8080/angularjsprove/rest/emps')
										.success(function(data) {
											return data;
										});

							};

							this.updateProgetto = function(progetto) {
								console.log('update ' + progetto);

							}

							this.addProgetto = function(progetto) {
								console.log('addProgetto ' + progetto.titolo);

								$http
										.post(
												"http://localhost:8080/angularjsprove/rest/emp/create",
												progetto).success(function() {
											console.log('add proegettooooo');
											//$location.path("/menu");
										});

							};

							this.deleteProgetto = function(id) {
								console.log('deleteProgetto ' + id);

								$http
										.put(
												"http://localhost:8080/angularjsprove/rest/emp/delete/" + 2)
										.success(
												function() {
													console
															.log('delete proegettooooo');
													//$location.path("/menu");
												});

							};

						});