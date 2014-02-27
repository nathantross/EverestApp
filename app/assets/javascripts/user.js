$(function(){

  // Area chart
  $.get("/run.json").done(function(res){

    // an array of hashes with two keys each, a date and a value for distance
    var runData = res.points;
    
    // The length of the goal from its distance in the database
    var max = res.max_val;

    new Morris.Area({
      // ID of the element in which to draw the chart.
      element: 'goalarea',
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

  // Donut
  $.get("/donut.json").done(function(res){
      new Morris.Donut({
        element: 'goaldonut',
        data: [
          {label: "Distance to go", value: res.percent_left},
          {label: "Distance covered", value: res.percent_done}
        ],
        // adds a % sign to the inside of the donut, along with the value
        formatter: function (val, data) { return  val + "%";}
        });
    });
  
    $(".area_chart").click(function(){
      if ($("#goalarea").hasClass("swap") === true) {
        $("#goalarea").toggleClass("swap");
        $("#goaldonut").toggleClass("swap");
      }
    });


  
    $(".donut_chart").click(function(){
      if ($("#goaldonut").hasClass("swap") === true) {
        $("#goaldonut").toggleClass("swap");
        $("#goalarea").toggleClass("swap");
      }
    });
  

});

