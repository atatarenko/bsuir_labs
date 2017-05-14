angular.module('app').controller('PieChartModalController', function($mdDialog, labs) {
    var self = this;
    self.colors = ['#27ae60', '#e74c3c'];

    var all = 0;
    var done = 0;

    labs.forEach(function (lab) {
        all++;
        if (lab.state === 'done') {
            done++;
        }
    });
    var left = all - done;

    var doneStr = 'Done (' + (done / all).toFixed(2)*100 + '%)';
    var leftStr = 'Left (' + (left / all).toFixed(2)*100 + '%)';

    self.labels = [doneStr, leftStr];
    self.isEmpty = (all === 0);
    self.data = [done, left];

    self.cancel = function() {
        $mdDialog.cancel();
    };
});