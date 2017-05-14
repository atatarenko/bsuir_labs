angular.module('app').controller('SubjectsController', function($mdDialog, $stateParams, Subject, Lab) {
    var self = this;

    self.termId = $stateParams.termId;
    self.subjects = [];

    self.deleteSubject = function(subject) {
        var confirm = $mdDialog.confirm()
            .title('Would you like to delete whole subject?')
            .ok('Yes!')
            .cancel('No');

        $mdDialog.show(confirm).finally(function () {
            Subject.delete({ termId: self.termId }, subject).$promise.finally(refresh);
        });
    };

    self.editSubject = function(subject) {
        openSubjectModal(subject);
    };

    self.addSubject = function() {
        openSubjectModal();
    };

    self.editLab = function(subject, lab) {
        openLabModal(subject, lab);
    };

    self.addLab = function(subject) {
        openLabModal(subject);
    };

    refresh();

    function refresh() {
        Subject.query({ termId: self.termId }).$promise.then(function (result) {
            self.subjects = result;
        });
    }

    function openSubjectModal(subject) {
        $mdDialog.show({
            controller: 'SubjectModalController as self',
            templateUrl: 'subject_modal.html',
            parent: angular.element(document.body),
            clickOutsideToClose: true,
            locals: {
                termId: self.termId,
                subject: angular.copy(subject)
            }
        }).finally(refresh);
    }

    function openLabModal(subject, lab) {
        $mdDialog.show({
            controller: 'LabModalController as self',
            templateUrl: 'lab_modal.html',
            parent: angular.element(document.body),
            clickOutsideToClose: true,
            locals: {
                termId: self.termId,
                subjectId: subject.id,
                lab: angular.copy(lab)
            }
        }).finally(refresh);
    }
});
