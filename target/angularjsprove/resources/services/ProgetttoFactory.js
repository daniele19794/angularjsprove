
angular.module("ProgettoFactory", []).factory('ProgettiFactory',['$http',function($http){

        var progettiFactory=[];

        return {
            addProgetto: function (progetto){
                console.log('addProgetto in Factory ' + progetto);
           	 
           	 return $http.post('http://localhost:8085/angularjsprove/rest/progetto/add', progetto);
               
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
                console.log('getItems in Factory ' + idProgetto);
                return $http
                    .get(
                    'http://localhost:8085/angularjsprove/rest/items/'+ idProgetto);
            },
            
            addItem: function(titolo,progetto){
            	console.log('addItems in Factory ' +  titolo + ' ' + progetto);
            	
            	var item = {"id":null,"titolo":titolo, "dataInizio":null,"dataFine":null,"idProgetto":progetto.id};            	 
            	return $http.post('http://localhost:8085/angularjsprove/rest/item/add', item)
                 
            	
            },
            
            deleteItem: function(item){
            	console.log('delete item ' + item.id);
            	 return $http.put('http://localhost:8085/angularjsprove/rest/item/delete/'+ item.id)
                 
            	
            }
        }


    }]);

