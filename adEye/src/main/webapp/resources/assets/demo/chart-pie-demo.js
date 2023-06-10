// Set new default font family and font color to mimic Bootstrap's default styling
(Chart.defaults.global.defaultFontFamily = "Metropolis"),
'-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = "#858796";


const data = {
    labels: [
      'Female',
      'Male'
    ],
    datasets: [{
      label: 'My First Dataset',
      data: [25411, 43348],
      backgroundColor: [
        'rgb(255, 128, 122)',
        'rgb(54, 162, 235)'
      ],
      hoverOffset: 4
    }]
  };
// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
    type: "pie",
    data: data,
    options: {
        maintainAspectRatio: false,
        tooltips: {
            backgroundColor: "rgb(255,255,255)",
            bodyFontColor: "#858796",
            borderColor: "#dddfeb",
            borderWidth: 1,
            displayColors: false,
            caretPadding: 0
        },
        legend: {
            display: false
        },
    }
});
