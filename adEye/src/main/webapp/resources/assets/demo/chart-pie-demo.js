// Set new default font family and font color to mimic Bootstrap's default styling
(Chart.defaults.global.defaultFontFamily = "Metropolis"),
'-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = "#858796";


// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = null;
function pieChart(){

	const data = {
	    labels: [
	      '광고주목 인구 : '+ dashboardData.female_interest_cnt +' 명 / 총 인구',
	      '광고주목 인구 : '+ dashboardData.male_interest_cnt +' 명 / 총 인구'
	    ],
	    datasets: [{
	      label: 'My First Dataset',
	      data: [dashboardData.female_total_cnt, dashboardData.male_total_cnt],
	      backgroundColor: [
	        'rgb(255, 128, 122)',
	        'rgb(54, 162, 235)'
	      ],
	      hoverOffset: 4
	    }]
	  };
	
	
	myPieChart = new Chart(ctx, {
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
	            caretPadding: 0,
	            callbacks: {
			        label: function(tooltipItem, data) {
			         	 var label = data.labels[tooltipItem.index];
			         	 var value = data.datasets[0].data[tooltipItem.index];
			         	 return label + ' : ' + value + ' 명';
			        }
	      		}
	        },
	        legend: {
	            display: false
	        }
	    }
	});
}

function rePieChart(){

	myPieChart.data.labels = [
	      '광고주목 인구 : '+ dashboardData.female_interest_cnt +' 명 / 총 인구',
	      '광고주목 인구 : '+ dashboardData.male_interest_cnt +' 명 / 총 인구'
	    ];
	myPieChart.data.datasets[0].data = [dashboardData.female_total_cnt, dashboardData.male_total_cnt];
	myPieChart.update();
}

