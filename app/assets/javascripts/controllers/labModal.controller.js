angular.module('app').controller('LabModalController', function($mdDialog, Lab, lab, subjectId, termId) {
    var self = this;

    self.termId = termId;
    self.subjectId = subjectId;
    self.lab = lab;
    self.updateMode = !!self.lab;

    if (self.updateMode) {
        self.title = 'Lab';
    } else {
        self.title = 'Add Lab'
    }

    self.saveLab = function() {
        if (self.updateMode){
            Lab.
                update({ termId: self.termId, subjectId: self.subjectId }, self.lab).
                $promise.
                then($mdDialog.hide);
        } else {
            Lab.
                save({ termId: self.termId, subjectId: self.subjectId }, self.lab).
                $promise.
                then($mdDialog.hide);
        }
    };

    self.deleteLab = function () {
        Lab.
            delete({ termId: self.termId, subjectId: self.subjectId }, self.lab).
            $promise.
            then($mdDialog.hide);
    };

    self.cancel = function() {
        $mdDialog.cancel();
    };
});