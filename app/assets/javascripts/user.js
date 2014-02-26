



// Line chart
$(function(){
  new Morris.Line({
    // ID of the element in which to draw the chart.
    element: 'goalchart',
    // Chart data records -- each entry in this array corresponds to a point on
    // the chart.
    data: [
      { year: '20 Miles', value: 0 },
      { year: '30 Miles', value: 10 },
      { year: '40 Miles', value: 20 },
      { year: '50 Miles', value: 30 },
      { year: '60 Miles', value: 40 }
    ],
    // The name of the data record attribute that contains x-values.
    xkey: 'year',
    // A list of names of data record attributes that contain y-values.
    ykeys: ['value'],
    // Labels for the ykeys -- will be displayed when you hover over the
    // chart.
    labels: ['Value']
  });
});
