var demoApp = angular
				.module('demoApp', [ 'customFilters' ])
				.controller(
						'personController',

						function($scope, $http, ProgettiService,ProgettiFactory) {

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



							$scope.getProgetti = function() {
								console.log('getProgetti');
								//$scope.pro = ProgettiService.getAllProgetti();
								// $http
								//		.get(
								//				'http://localhost:8080/angularjsprove/rest/emps').success(function(data) {
								//			        $scope.progetti = data;
								//

							};



							$scope.getItems = function(progetto) {
								console.log('getItems ' + progetto);
								console.log('progetto sel ' + progetto);

                                ProgettiFactory.getItems(progetto).success(function (it) {
                                    console.log('getItems success ' + angular.toJson(it));
                                    $scope.showAlert=true;;
                                    $scope.alertMessage='Item caricati correttamente';
                                    $scope.itemsStaticidb = it;
                                    console.log('getItems to json ' + $scope.itemsStaticidb);
                                })
                                    .error(function (error) {
                                        console.log('getItems error');
                                        $scope.status = 'Unable to load customer data: ' + error.message;
                                        $scope.showAlert=true;;
                                        $scope.alertMessage='Errore caricamento Item ' + error.message;
                                    });



							};

							$scope.showTableItems = function() {

								if (angular.isUndefined($scope.itemsStatici)
										|| $scope.itemsStatici.length == 0) {
									return false;
								} else {
									return true;
								}

							};



                            $scope.progettiStatici = {};



                            $scope.getAllProgetti = function(){

                                ProgettiFactory.getProgetti().success(function (pr) {
                                    console.log('getProgetti success ' + angular.toJson(pr));
                                    $scope.showAlert=true;;
                                    $scope.alertMessage='Progetti caricati correttamente';
                                    $scope.progettiStatici = pr;
                                })
                                    .error(function (error) {
                                        console.log('getProgetti error');
                                        $scope.status = 'Unable to load customer data: ' + error.message;
                                        $scope.showAlert=true;;
                                        $scope.alertMessage='Errore caricamento Progetti ' + error.message;
                                    });




                            }

                            $scope.getAllProgetti();

							console.log('progetti --> ' + $scope.progetti);

							console.log('progetti ' + $scope.progetti);

							$scope.selectedProgetto = null;

							$scope.selectProgetto = function(progetto) {
								console.log('showerror ' + progetto.titolo + ' progetto id ' + progetto.id );
								$scope.selectedProgetto = progetto;
								$scope.getItems(progetto.id);
								$scope.currentProgetto=progetto.id;
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

								ProgettiFactory.addItem($scope.formAddItem.titolo,$scope.currentProgetto);

							}

						}).factory('ProgettiFactory',['$http',function($http){

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
                return $http
                    .get(
                    'http://localhost:8085/angularjsprove/rest/emps');
            },

            getItems: function(idProgetto){
                console.log('getItems in Factory');
                return $http
                    .get(
                    'http://localhost:8085/angularjsprove/rest/items/'+ idProgetto);
            },
            
            addItem: function(titolo,idProgetto){
            	console.log('addItems in Factory ' +  titolo + ' ' + idProgetto);
            	 return $http
                 .post(
                 'http://localhost:8085/angularjsprove/rest/item/add/'+ idProgetto);
            	
            }
        }


    }]);

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