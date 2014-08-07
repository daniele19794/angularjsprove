var showcase = angular
		.module('demoApp', [ 'customFilters', 'ProgettoFactory' ])
		.controller(
				'personController',

				function($scope, $http, $location, ProgettiFactory) {

					$scope.showAlert = false;
					$scope.alertMessage = '';
					$scope.infoMessage = '';

					$scope.showInfoMessage = function(info) {
						$scope.infoMessage = info;
						$scope.showInfo = true;
					}

					$scope.hideMessage = function(info) {
						$scope.showInfo = false;
						$scope.showAlert = false;
					}

					$scope.formAddProgetto = {};
					$scope.formAddProgetto.titolo = "";

					$scope.formAddItem = {};
					$scope.formAddItem.titolo = "";
					$scope.formAddItem.progetto = "";

					// Gestione Paginazione

					$scope.selectedPage = 1;
					$scope.pageSize = 2;
					$scope.selectPage = function(newPage) {
						$scope.selectedPage = newPage;
					}

					$scope.getPageClass = function(page) {
						return $scope.selectedPage == page ? 'btn-primary' : '';
					}

					$scope.showError = function() {
						console.log('showerror');
					}

					$scope.deleteProgetto = function(row) {
						console.info(row);
						$scope.progetti.splice(row, 1);
					}

					$scope.currentProgetto = function() {
						// console.info('provaaaa' + row);
						// $scope.formAddItem.progetto = row;
					}

					$scope.addProgetto = function(titolo) {
						var progetto = {
							"titolo" : $scope.formAddProgetto.titolo
						};

						ProgettiFactory
								.addProgetto(progetto)
								.success(
										function(pr) {
											$scope
													.showInfoMessage('Progetto Aggiunto  correttamente');

											$scope.getAllProgetti();
										})
								.error(
										function(error) {
											console.log('Progetto add error');
											$scope
													.showInfoMessage('Errore creazione progetto ');
										});

					};

					$scope.deleteItem = function(item) {
						console.info('delete item' + item.titolo);
						ProgettiFactory
								.deleteItem(item)
								.success(
										function(pr) {
											// console.log('delete success ' +
											// angular.toJson(pr));
											$scope
													.showInfoMessage('Item cancellata correttamente');

											// $scope.progettiStatici = pr;

											$scope
													.getItems($scope.selectedProgetto.id);
										})
								.error(
										function(error) {
											console.log('delete item error');
											$scope
													.showInfoMessage('Item non cancellata correttamente');
										});

					};

					$scope.getItems = function(progetto) {

						console.log('progettto ' + progetto);
						ProgettiFactory
								.getItems(progetto)
								.success(
										function(it) {
											$scope
													.showInfoMessage('Item caricati correttamente');

											$scope.itemsStaticidb = it;
										})
								.error(
										function(error) {
											$scope.status = 'Unable to load customer data: '
													+ error.message;
											$scope.showAlert = true;
											;
											$scope.alertMessage = 'Errore caricamento Item '
													+ error.message;
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
					$scope.getAllProgetti = function() {

						ProgettiFactory
								.getProgetti()
								.success(
										function(pr) {
											$scope
													.showInfoMessage('Progetti caricati correttamente');
											$scope.progettiStatici = pr;

											$scope.selectedProgetto = pr[0];
											$scope
													.getItems($scope.selectedProgetto.id);
										})
								.error(
										function(error) {
											console.log('getProgetti error');
											$scope.status = 'Unable to load customer data: '
													+ error.message;
											$scope.showAlert = true;
											;
											$scope.alertMessage = 'Errore caricamento Progetti '
													+ error.message;
										});

					}
					$scope.getAllProgetti();

					$scope.selectedProgetto = null;

					$scope.selectProgetto = function(progetto) {
						console.log('progetto ' + progetto.id);
						$scope.selectedProgetto = progetto;
						$scope.getItems(progetto.id);
					}

					$scope.addProgettoPost = function() {
						console.log('addProgettoPost');
						ProgettiService.addProgetto($scope.progetto);

					};

					$scope.getProgettoClass = function(progetto) {

						return $scope.selectedProgetto == progetto ? 'btn-primary'
								: "";
					}

					$scope.isActive = function(viewLocation) {
						var active = (viewLocation === $location.path());
						return active;
					};

					$scope.deleteProgetto = function() {
						console.log('deleteProgetto');
						ProgettiService.deleteProgetto('2')

					};

					$scope.clearFormItemsFields = function() {
						$scope.formAddItem.titolo = "";
						$scope.formAddItem.progetto = "";

					}

					$scope.addItem = function() {

						ProgettiFactory
								.addItem($scope.formAddItem.titolo,
										$scope.selectedProgetto)
								.success(
										function(data) {
											console.log('alee '
													+ $scope.selectedProgetto);
											$scope
													.getItems($scope.selectedProgetto.id);
											$scope
													.showInfoMessage('Item Aggiunta Correttamente');
											$scope.clearFormItemsFields();
										})
								.error(
										function(error) {
											$scope
													.showInfoMessage('Errore Aggiunta Correttamente');
											console.log('nooo');
										});

					}

					$scope.sayHello = function() {
						console.log('ciaooo');
					}

					$scope.today = function() {
						$scope.dt = new Date();
					};
					$scope.today();

					$scope.clear = function() {
						$scope.dt = null;
					};

					// Disable weekend selection
					$scope.disabled = function(date, mode) {
						return (mode === 'day' && (date.getDay() === 0 || date
								.getDay() === 6));
					};

					$scope.toggleMin = function() {
						$scope.minDate = $scope.minDate ? null : new Date();
					};
					$scope.toggleMin();

					$scope.open = function($event) {
						console.log('open event');
						$event.preventDefault();
						$event.stopPropagation();

						$scope.opened = true;
					};

					$scope.dateOptions = {
						formatYear : 'yy',
						startingDay : 1
					};

					$scope.initDate = new Date('2016-15-20');
					$scope.formats = [ 'dd-MMMM-yyyy', 'yyyy/MM/dd',
							'dd.MM.yyyy', 'shortDate' ];
					$scope.format = $scope.formats[0];

				});
