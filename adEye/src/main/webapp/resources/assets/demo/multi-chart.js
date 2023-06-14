// Set new default font family and font color to mimic Bootstrap's default styling
(Chart.defaults.global.defaultFontFamily = "Metropolis"),
'-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = "#858796";

function number_format(number, decimals, dec_point, thousands_sep) {
    // *     example: number_format(1234.56, 2, ',', ' ');
    // *     return: '1 234,56'
    // number: 형식화할 숫자
    // decimals: 소수 자리수
    // dec_point: 소수점 기호
    // thousands_sep: 천 단위 구분 기호
    number = (number + "").replace(",", "").replace(" ", "");
    var n = !isFinite(+number) ? 0 : +number,
        prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
        sep = typeof thousands_sep === "undefined" ? "," : thousands_sep,
        dec = typeof dec_point === "undefined" ? "." : dec_point,
        s = "",
        toFixedFix = function(n, prec) {
            var k = Math.pow(10, prec);
            return "" + Math.round(n * k) / k;
        };
    // Fix for IE parseFloat(0.55).toFixed(0) = 0;
    s = (prec ? toFixedFix(n, prec) : "" + Math.round(n)).split(".");
    if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if ((s[1] || "").length < prec) {
        s[1] = s[1] || "";
        s[1] += new Array(prec - s[1].length + 1).join("0");
    }
    return s.join(dec);
}

// Combined Chart Example
var ctxCombined = document.getElementById("myCombinedChart");
var myCombinedChart = null;

function multiChart(){
    var keys = dashboardData.oneH_interest.map((value, index) => index + "시")
    myCombinedChart = new Chart(ctxCombined, {
        type: "bar",
        data: {
            labels: keys,
            datasets: [
                {
                    label: "광고 앞 노출 인구",
                    type: "line",
                    lineTension: 0.3,
                    backgroundColor: "rgba(0, 0, 0, 0)",
                    borderColor: "rgba(169, 205, 62, 1)",
                    pointRadius: 3,
                    pointBackgroundColor: "rgba(169, 205, 62, 1)",
                    pointBorderColor: "rgba(169, 205, 62, 1)",
                    pointHoverRadius: 3,
                    pointHoverBackgroundColor: "rgba(169, 205, 62, 1)",
                    pointHoverBorderColor: "rgba(169, 205, 62, 1)",
                    pointHitRadius: 10,
                    pointBorderWidth: 2,
                    data: dashboardData.oneH_interest
                },
                {
                    label: "광고 관심 인구",
                    type: "bar",
                    backgroundColor: "rgba(0, 97, 242, 1)",
                    hoverBackgroundColor: "rgba(0, 97, 242, 0.9)",
                    borderColor: "#4e73df",
                    data: dashboardData.oneH_man_cnt,
                    maxBarThickness: 25
                }
            ]
        },
        options: {
            maintainAspectRatio: false,
            layout: {
                padding: {
                    left: 10,
                    right: 25,
                    top: 25,
                    bottom: 0
                }
            },
            scales: {
                xAxes: [
                    {
                        time: {
                            unit: "month"
                        },
                        gridLines: {
                            display: false,
                            drawBorder: false
                        },
                        ticks: {
                            maxTicksLimit: 6
                        }
                    }
                ],
                yAxes: [
                    {
                        ticks: {
                            min: 0,
                            max: Math.ceil(Math.max(...dashboardData.oneH_man_cnt)),
                            maxTicksLimit: 3,
                            padding: 10,
                            // Include a dollar sign in the ticks
                            callback: function(value, index, values) {
                                return number_format(value);
                            }
                        },
                        gridLines: {
                            color: "rgb(234, 236, 244)",
                            zeroLineColor: "rgb(234, 236, 244)",
                            drawBorder: false,
                            borderDash: [2],
                            zeroLineBorderDash: [2]
                        }
                    }
                ]
            },
            legend: {
                display: false
            },
            tooltips: {
                titleMarginBottom: 10,
                titleFontColor: "#6e707e",
                titleFontSize: 14,
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                borderColor: "#dddfeb",
                borderWidth: 1,
                xPadding: 15
            }
        }
    }
    
    );
}

function reMultiChart(){
	myCombinedChart.options.scales.yAxes[0].ticks.max = Math.ceil(Math.max(...dashboardData.oneH_man_cnt))
	myCombinedChart.data.datasets[0].data = dashboardData.oneH_interest;
	myCombinedChart.data.datasets[1].data = dashboardData.oneH_man_cnt;
	myCombinedChart.update();
}
