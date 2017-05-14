angular.module('app').controller('SubjectsController', function($mdDialog, $stateParams, Subject) {
    var self = this;

    self.termId = $stateParams.termId;
    self.subjects = [];

    refresh();

    function refresh() {
        Subject.query({ termId: self.termId }).$promise.then(function (result) {
            self.subjects = result;
        });
    }

    self.sortOptions = function(subject) {

        return {
            accept: function (sourceItemHandleScope, destSortableScope) {
                return sourceItemHandleScope.itemScope.sortableScope.$id === destSortableScope.$id;
            },

            orderChanged: function() {
                for (var i = 0; i < subject.labs.length; i++) {
                    subject.labs[i].rank = i;
                }
                Subject.update({ termId: self.termId }, subject).$promise.finally(refresh);
            }
        }
    };

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

    self.showStatistics = function(subject) {
        if (!!subject) {
            openChartModal(subject.labs);
        } else {
            var labs = [];
            self.subjects.forEach(function (subject) {
                labs = labs.concat(subject.labs);
            });
            openChartModal(labs);
        }
    };

    self.labClasses = {
        todo: 'lab-todo',
        in_progress: 'lab-in-progress',
        resolved: 'lab-resolved',
        done: 'lab-done'
    };

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

    function openChartModal(labs) {
        $mdDialog.show({
            controller: 'PieChartModalController as self',
            templateUrl: 'pie_chart_modal.html',
            parent: angular.element(document.body),
            clickOutsideToClose: true,
            locals: { labs: labs }
        })
    }
});
