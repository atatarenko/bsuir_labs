angular.module('app').controller('SubjectModalController', function($mdDialog, Subject, subject, termId) {
    var self = this;

    self.termId = termId;
    self.subject = subject;
    self.updateMode = !!self.subject;

    if (self.updateMode) {
        self.title = 'Edit Subject';
    } else {
        self.title = 'Add Subject'
    }

    self.saveSubject = function() {
        if (self.updateMode){
            Subject.update({ termId: self.termId }, self.subject).$promise.then($mdDialog.hide);
        } else {
            Subject.save({ termId: self.termId }, self.subject).$promise.then($mdDialog.hide);
        }
    };

    self.cancel = function() {
        $mdDialog.cancel();
    };
});