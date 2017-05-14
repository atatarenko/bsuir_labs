angular.module('app').controller('TermsController', function($state, $mdDialog, Term) {
    var self = this;

    self.terms = [];

    self.showTerm = function (term) {
        $state.go('subjects', { termId: term.id });
    };

    self.deleteTerm = function(term) {
        var confirm = $mdDialog.confirm()
            .title('Would you like to delete whole term?')
            .ok('Yes!')
            .cancel('No');

        $mdDialog.show(confirm).finally(function () {
            Term.delete(term).$promise.finally(refresh);
        });
    };

    self.editTerm = function(term) {
        openModal(term);
    };

    self.addTerm = function() {
        openModal();
    };

    self.isEmpty = function () {
      return (self.terms.length === 0);
    };

    refresh();

    function refresh() {
        Term.query().$promise.then(function (result) {
            self.terms = result;
        });
    }

    function openModal(term) {
        $mdDialog.show({
            controller: 'TermModalController as self',
            templateUrl: 'term_modal.html',
            parent: angular.element(document.body),
            clickOutsideToClose: true,
            locals: { term: angular.copy(term) }
        }).finally(refresh);
    }
});