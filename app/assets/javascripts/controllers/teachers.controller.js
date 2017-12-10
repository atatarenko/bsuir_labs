angular.module('app').controller('TeachersController', function($state, $mdDialog, Teacher) {
  var self = this;

  self.teachers = [];

  self.deleteTeacher = function(teacher) {
    var confirm = $mdDialog.confirm()
      .title('Would you like to delete the teacher?')
      .ok('Yes!')
      .cancel('No');

    $mdDialog.show(confirm).finally(function () {
      Teacher.delete(teacher).$promise.finally(refresh);
    });
  };

  self.editTeacher = function(teacher) {
    openModal(teacher);
  };

  self.addTeacher = function() {
    openModal();
  };

  self.isEmpty = function () {
    return (self.teachers.length === 0);
  };

  refresh();

  function refresh() {
    Teacher.query().$promise.then(function (result) {
      self.teachers = result;
    });
  }

  function openModal(term) {
    // $mdDialog.show({
    //   controller: 'TermModalController as self',
    //   templateUrl: 'term_modal.html',
    //   parent: angular.element(document.body),
    //   clickOutsideToClose: true,
    //   locals: { term: angular.copy(term) }
    // }).finally(refresh);
  }
});
