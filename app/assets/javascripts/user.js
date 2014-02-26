
// Line chart
$(function(){
  $.get("/users/run.json").done(function(res){

    var runData = res.points;
    var max = res.max_val;

    new Morris.Line({
      // ID of the element in which to draw the chart.
      element: 'goalchart',
      // Chart data records -- each entry in this array corresponds to a point on
      // the chart.
      data: runData,
      // The name of the data record attribute that contains x-values.
      xkey: 'dateTime',
      // A list of names of data record attributes that contain y-values.
      ykeys: ['value'],
      ymax: max,
      // Labels for the ykeys -- will be displayed when you hover over the
      // chart.
      labels: ['Miles towards goal']
    });
  });
});
