angular.module('app').controller('TeacherModalController', function($mdDialog, Teacher, teacher) {
  var self = this;

  self.teacher = teacher;
  self.updateMode = !!self.teacher;

  if (self.updateMode) {
    self.title = 'Edit Teacher';
  } else {
    self.title = 'Add Teacher'
  }

  self.saveTeacher = function() {
    if (self.updateMode){
      Teacher.update(self.teacher).$promise.then($mdDialog.hide);
    } else {
      Teacher.save(self.teacher).$promise.then($mdDialog.hide);
    }
  };

  self.cancel = function() {
    $mdDialog.cancel();
  };
});
