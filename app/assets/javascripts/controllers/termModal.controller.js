angular.module('app').controller('TermModalController', function($mdDialog, Term, term) {
    var self = this;

    self.term = term;
    self.updateMode = !!self.term;

    if (self.updateMode) {
        self.title = 'Edit Term';
    } else {
        self.title = 'Add Term'
    }

    self.saveTerm = function() {
        if (self.updateMode){
            Term.update(self.term).$promise.then($mdDialog.hide);
        } else {
            Term.save(self.term).$promise.then($mdDialog.hide);
        }
    };

    self.cancel = function() {
        $mdDialog.cancel();
    };
});