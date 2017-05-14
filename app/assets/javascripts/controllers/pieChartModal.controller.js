angular.module('app').controller('PieChartModalController', function($mdDialog, labs) {
    var self = this;
    self.colors = ['#2ecc71', '#e74c3c'];

    var all = 0;
    var done = 0;

    labs.forEach(function (lab) {
        all++;
        if (lab.state === 'done') {
            done++;
        }
    });
    var left = all - done;

    console.log(done);
    console.log(left);
    console.log(all);

    var doneStr = 'Done (' + (done / all).toFixed(2)*100 + '%)';
    var leftStr = 'Left (' + (left / all).toFixed(2)*100 + '%)';

    self.labels = [doneStr, leftStr];
    self.data = [done, left];

    self.cancel = function() {
        $mdDialog.cancel();
    };
});