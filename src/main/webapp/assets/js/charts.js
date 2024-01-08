// web component
class HelloWorld extends HTMLElement {

    constructor() {
        super();

    }
    changeArray(array, labels) {
        const inputArray = JSON.parse(array)
        var nonZeroCount = 0;

        for (var i = 0; i < inputArray.length; i++) {
            if (inputArray[i] !== 0) {
                nonZeroCount += inputArray[i];
            }
        }

        if (nonZeroCount > 0) {
            var percentage = (nonZeroCount / inputArray.length) * 100;

            // Change values different than 0 to represent the percentage
            for (var i = 0; i < inputArray.length; i++) {
                if (inputArray[i] !== 0) {
                    inputArray[i] = (inputArray[i]/nonZeroCount)*100;
                }
            }
            var nonZeroValues = inputArray.filter((value) => value !== 0);
            var nonZeroBodyParts = labels.filter((_, index) => inputArray[index] !== 0);
            // Print the modified array
            return {nonZeroValues, nonZeroBodyParts}
        } else {
            console.log("No values different than 0 found in the array.");
        }
    }
    convertData() {
        const data = [];
        const jsonString = this.getAttribute("data").replace(/(\d{4}-\d{2}-\d{2})/g, '"$1"');
        const arrayOfArrays = JSON.parse(jsonString);

        return arrayOfArrays
    }
    createChart() {
        //const data = this.convertData()
        let cardColor, headingColor, axisColor, shadeColor, borderColor;

        cardColor = config.colors.white;
        headingColor = config.colors.headingColor;
        axisColor = config.colors.axisColor;
        borderColor = config.colors.borderColor;
        console.log(this.convertData())
        const incomeChartConfig = {
            series: [
                {
                    data: this.convertData()
                }
            ],
            chart: {
                height: 215,
                width: 700,
                parentHeightOffset: 0,
                parentWidthOffset: 0,
                toolbar: {
                    show: false
                },
                type: 'area'
            },
            dataLabels: {
                enabled: false
            },
            stroke: {
                width: 2,
                curve: 'smooth'
            },
            legend: {
                show: false
            },
            markers: {
                size: 6,
                colors: 'transparent',
                strokeColors: 'transparent',
                strokeWidth: 4,
                discrete: [
                    {
                        fillColor: config.colors.white,
                        seriesIndex: 0,
                        dataPointIndex: 7,
                        strokeColor: config.colors.primary,
                        strokeWidth: 2,
                        size: 6,
                        radius: 8
                    }
                ],
                hover: {
                    size: 7
                }
            },
            colors: [config.colors.primary],
            fill: {
                type: 'gradient',
                gradient: {
                    shade: shadeColor,
                    shadeIntensity: 0.6,
                    opacityFrom: 0.5,
                    opacityTo: 0.25,
                    stops: [0, 95, 100]
                }
            },
            grid: {
                borderColor: borderColor,
                strokeDashArray: 3,
                padding: {
                    top: -20,
                    bottom: -8,
                    left: -10,
                    right: 8
                }
            },
            xaxis: {
                type: 'datetime',
                axisBorder: {
                    show: false
                },
                axisTicks: {
                    show: false
                },
                labels: {
                    show: true,
                    style: {
                        fontSize: '13px',
                        colors: axisColor
                    }
                }
            },
            yaxis: {
                labels: {
                    show: false
                },
                min: 0,
                max: 20,
                tickAmount: 4
            }
        };
        return incomeChartConfig
    }
    createChart2() {
        let cardColor, headingColor, axisColor, shadeColor, borderColor;

        cardColor = config.colors.white;
        headingColor = config.colors.headingColor;
        axisColor = config.colors.axisColor;
        borderColor = config.colors.borderColor;
        const data = this.changeArray(this.getAttribute("data1"), ["Abdomen", "Back", "Chest", "Head", "Neck", "Hips"])
        const orderChartConfig = {
            chart: {
                height: 145,
                width: 125,
                type: 'donut'
            },
            labels: data.nonZeroBodyParts,
            series: data.nonZeroValues,
            colors: [config.colors.primary, config.colors.secondary, config.colors.info, config.colors.success],
            stroke: {
                width: 5,
                colors: cardColor
            },
            dataLabels: {
                enabled: false,
                formatter: function (val, opt) {
                    return parseInt(val) + '%';
                }
            },
            legend: {
                show: false
            },
            grid: {
                padding: {
                    top: 0,
                    bottom: 0,
                    right: 15
                }
            },
            plotOptions: {
                pie: {
                    donut: {
                        size: '75%',
                        labels: {
                            show: true,
                            value: {
                                fontSize: '1.5rem',
                                fontFamily: 'Public Sans',
                                color: headingColor,
                                offsetY: -15,
                                formatter: function (val) {
                                    return parseInt(val) + '%';
                                }
                            },
                            name: {
                                offsetY: 20,
                                fontFamily: 'Public Sans'
                            },
                            total: {
                                show: true,
                                fontSize: '0.75rem',
                                color: axisColor,
                                label: 'Location',
                            }
                        }
                    }
                }
            }
        };
        const data1 = this.changeArray(this.getAttribute("data2"), ["Cramps", "Tender breasts", "Headache", "Acne", "Fatigue", "Bloating", "Craving"])
        const orderChartConfig1 = {
            chart: {
                height: 145,
                width: 125,
                type: 'donut'
            },
            labels: data1.nonZeroBodyParts,
            series: data1.nonZeroValues,
            colors: [config.colors.primary, config.colors.secondary, config.colors.info, config.colors.success],
            stroke: {
                width: 5,
                colors: cardColor
            },
            dataLabels: {
                enabled: false,
                formatter: function (val, opt) {
                    return parseInt(val) + '%';
                }
            },
            legend: {
                show: false
            },
            grid: {
                padding: {
                    top: 0,
                    bottom: 0,
                    right: 15
                }
            },
            plotOptions: {
                pie: {
                    donut: {
                        size: '75%',
                        labels: {
                            show: true,
                            value: {
                                fontSize: '1.5rem',
                                fontFamily: 'Public Sans',
                                color: headingColor,
                                offsetY: -15,
                                formatter: function (val) {
                                    return parseInt(val) + '%';
                                }
                            },
                            name: {
                                offsetY: 20,
                                fontFamily: 'Public Sans'
                            },
                            total: {
                                show: true,
                                fontSize: '0.75rem',
                                color: axisColor,
                                label: 'Symptoms',
                            }
                        }
                    }
                }
            }
        };
        const data2 = this.changeArray(this.getAttribute("data3"), ["Lack of sleep", "Sitting", "Standing", "Stress", "Walking", "Exercise", "Urination"])
        const orderChartConfig2 = {
            chart: {
                height: 145,
                width: 125,
                type: 'donut'
            },
            labels: data2.nonZeroBodyParts,
            series: data2.nonZeroValues,
            colors: [config.colors.primary, config.colors.secondary, config.colors.info, config.colors.success],
            stroke: {
                width: 5,
                colors: cardColor
            },
            dataLabels: {
                enabled: false,
                formatter: function (val, opt) {
                    return parseInt(val) + '%';
                }
            },
            legend: {
                show: false
            },
            grid: {
                padding: {
                    top: 0,
                    bottom: 0,
                    right: 15
                }
            },
            plotOptions: {
                pie: {
                    donut: {
                        size: '75%',
                        labels: {
                            show: true,
                            value: {
                                fontSize: '1.5rem',
                                fontFamily: 'Public Sans',
                                color: headingColor,
                                offsetY: -15,
                                formatter: function (val) {
                                    return parseInt(val) + '%';
                                }
                            },
                            name: {
                                offsetY: 20,
                                fontFamily: 'Public Sans'
                            },
                            total: {
                                show: true,
                                fontSize: '0.75rem',
                                color: axisColor,
                                label: 'Pain worse',
                            }
                        }
                    }
                }
            }
        };
        const data3 = this.changeArray(this.getAttribute("data3"), ["Anxious", "Depressed", "Dizzy", "Vomiting", "Diarrhea"])
        const orderChartConfig3 = {
            chart: {
                height: 145,
                width: 125,
                type: 'donut'
            },
            labels: data3.nonZeroBodyParts,
            series: data3.nonZeroValues,
            colors: [config.colors.primary, config.colors.secondary, config.colors.info, config.colors.success],
            stroke: {
                width: 5,
                colors: cardColor
            },
            dataLabels: {
                enabled: false,
                formatter: function (val, opt) {
                    return parseInt(val) + '%';
                }
            },
            legend: {
                show: false
            },
            grid: {
                padding: {
                    top: 0,
                    bottom: 0,
                    right: 15
                }
            },
            plotOptions: {
                pie: {
                    donut: {
                        size: '75%',
                        labels: {
                            show: true,
                            value: {
                                fontSize: '1.5rem',
                                fontFamily: 'Public Sans',
                                color: headingColor,
                                offsetY: -15,
                                formatter: function (val) {
                                    return parseInt(val) + '%';
                                }
                            },
                            name: {
                                offsetY: 20,
                                fontFamily: 'Public Sans'
                            },
                            total: {
                                show: true,
                                fontSize: '0.75rem',
                                color: axisColor,
                                label: 'Feelings',
                            }
                        }
                    }
                }
            }
        };
        return {orderChartConfig, orderChartConfig1, orderChartConfig2, orderChartConfig3}

    }
    createChart3() {
        let cardColor, headingColor, axisColor, shadeColor, borderColor;

        cardColor = config.colors.white;
        headingColor = config.colors.headingColor;
        axisColor = config.colors.axisColor;
        borderColor = config.colors.borderColor;
        var modifiedArray = JSON.parse(this.getAttribute("data5").replace(/(\w+)/g, '"$1"').replace(/'/g, '"'));
        const growthChartOptions = {
            series: [modifiedArray[1]],
            labels: [modifiedArray[0]],
            chart: {
                height: 240,
                type: 'radialBar'
            },
            plotOptions: {
                radialBar: {
                    size: 150,
                    offsetY: 10,
                    startAngle: -150,
                    endAngle: 150,
                    hollow: {
                        size: '55%'
                    },
                    track: {
                        background: cardColor,
                        strokeWidth: '100%'
                    },
                    dataLabels: {
                        name: {
                            offsetY: 15,
                            color: headingColor,
                            fontSize: '15px',
                            fontWeight: '600',
                            fontFamily: 'Public Sans'
                        },
                        value: {
                            offsetY: -25,
                            color: headingColor,
                            fontSize: '22px',
                            fontWeight: '500',
                            fontFamily: 'Public Sans'
                        }
                    }
                }
            },
            colors: [config.colors.primary],
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'dark',
                    shadeIntensity: 0.5,
                    gradientToColors: [config.colors.primary],
                    inverseColors: true,
                    opacityFrom: 1,
                    opacityTo: 0.6,
                    stops: [30, 70, 100]
                }
            },
            stroke: {
                dashArray: 5
            },
            grid: {
                padding: {
                    top: -35,
                    bottom: -10
                }
            },
            states: {
                hover: {
                    filter: {
                        type: 'none'
                    }
                },
                active: {
                    filter: {
                        type: 'none'
                    }
                }
            }
        };
        return growthChartOptions
    }
    // connect component
    connectedCallback() {
        //console.log(this.getAttribute("data"))

        //console.log(arrayOfArrays);
        const ctx = document.querySelector("#incomeChart");
        const incomeChart = new ApexCharts(ctx, this.createChart());
        incomeChart.render()
        const chartOrderStatistics = document.querySelectorAll('.orderStatisticsChart')
        const {orderChartConfig, orderChartConfig1, orderChartConfig2, orderChartConfig3} = this.createChart2()
        const statisticsChart = new ApexCharts(chartOrderStatistics[0], orderChartConfig)
        statisticsChart.render()
        const statisticsChart1 = new ApexCharts(chartOrderStatistics[1], orderChartConfig1)
        statisticsChart1.render()
        const statisticsChart2 = new ApexCharts(chartOrderStatistics[2], orderChartConfig2)
        statisticsChart2.render()
        const statisticsChart3 = new ApexCharts(chartOrderStatistics[3], orderChartConfig3)
        statisticsChart3.render()
        const growthChartEl = document.querySelector('#growthChart')
        const growthChart = new ApexCharts(growthChartEl, this.createChart3());
        growthChart.render();
    }

}

// register component
customElements.define( 'dash-chart', HelloWorld );