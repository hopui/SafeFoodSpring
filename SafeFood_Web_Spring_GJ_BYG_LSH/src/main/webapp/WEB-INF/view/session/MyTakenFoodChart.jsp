<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>디버깅을 위한 식품 섭취 차트</title>
		
		<!-- jQuery, google charts -->
    	<script src="https://code.jquery.com/jquery.min.js"></script>
    	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	</head>

	<!---------------------------------- body ---------------------------------->

	<body>
		<div id="takenChartApp" align="center">
			<h1>나의 섭취 경향</h1>
			<div id="Line_Controls_Chart">
				<!-- 라인 차트 생성 영역 -->
				<div id="lineChartArea" style="padding:0 20px 0 0;">
										
				</div>
				<!-- 컨트롤바 생성할 영역 -->
				<div id="controlsArea" style="padding 0 20px 0 0;">
				
				</div>
			</div>
		</div>
	</body>

	<!---------------------------------- vue ----------------------------------->

	<script src="https://unpkg.com/vue"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
	<script>
	let chartVi = new Vue({
		el:"#takenChartApp",
		data() {
			return {
				contextRoot: "SafeFood_Web_Spring_GJ_BYG_LSH",
				hostname: "localhost",
				foods: []
			}
		},
		mounted() {
			this.loadTakenFoods();
		},
		methods: {
			// 사용자가 섭취한 식품 정보를 가져온다.
			loadTakenFoods() {
	    		let url = "http://"+this.hostname+":8080/"+this.contextRoot+"/session/takenfoods/foodChart";
	    		
	    		axios.get(url)
				.then(response => {
					this.foods = [];
					this.foods = response.data;
					
					// 출력해보기
		            for(let i=0; i < this.foods.length; i++) {
		            	console.log(i," : ",this.foods[i]);
		            }
				}).catch(error => {
					console.log(error);
				});
	    	}
		}
	});
	
	<!--------------------------------- chart ----------------------------------->
	
	var chartDrowFun = {
	
	    chartDrow: function () {
	        var chartData = '';
	
	        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
	        var chartDateformat = 'yyyy년MM월dd일';
	        //라인차트의 라인 수
	        var chartLineCount = 10;
	        //컨트롤러 바 차트의 라인 수
	        var controlLineCount = 10;
	
	
	        function drawDashboard() {
	
	            var data = new google.visualization.DataTable();
	            //그래프에 표시할 컬럼 추가
	            data.addColumn('datetime', '날짜');
	            data.addColumn('number', '탄수화물');
	            data.addColumn('number', '단백질');
	            data.addColumn('number', '지방');
	            data.addColumn('number', '당류');
	            data.addColumn('number', '나트륨');
	            
	            //그래프에 표시할 데이터
	            var dataRow = [];
	
	            //데이터 삽입
	            for (let food of chartVi.foods) { 
					let datetime = food.taken_time;
	            	let carbo = food.carbo;
	            	let protein = food.protein; 
	            	let fat = food.fat;
	            	let sugar = food.sugar;
	            	let natrium = food.natrium;
	            	console.log("\t먹은 날짜: ",new Date(datetime));
	                dataRow = [new Date(datetime), carbo, protein, fat, sugar, natrium];
	                data.addRow(dataRow);
	            }
	
	            var chart = new google.visualization.ChartWrapper({
	                chartType: 'LineChart',
	                containerId: 'lineChartArea', //라인 차트 생성할 영역
	                options: {
	                    isStacked: 'percent',
	                    focusTarget: 'category',
	                    height: 500,
	                    width: '100%',
	                    legend: {position: "top", textStyle: {fontSize: 13}},
	                    pointSize: 5,
	                    tooltip: {textStyle: {fontSize: 12}, showColorCode: true, trigger: 'both'},
	                    hAxis: {
	                        format: chartDateformat, gridlines: {
	                            count: chartLineCount, units: {
	                                years: {format: ['yyyy년']},
	                                months: {format: ['MM월']},
	                                days: {format: ['dd일']},
	                                hours: {format: ['HH시']}
	                            }
	                        }, textStyle: {fontSize: 12}
	                    },
	                    vAxis: {minValue: 100, viewWindow: {min: 0}, gridlines: {count: -1}, textStyle: {fontSize: 12}},
	                    animation: {startup: true, duration: 1000, easing: 'in'},
	                    annotations: {
	                        pattern: chartDateformat,
	                        textStyle: {
	                            fontSize: 15,
	                            bold: true,
	                            italic: true,
	                            color: '#871b47',
	                            auraColor: '#d799ae',
	                            opacity: 0.8,
	                            pattern: chartDateformat
	                        }
	                    }
	                }
	            });
	
	            var control = new google.visualization.ControlWrapper({
	                controlType: 'ChartRangeFilter',
	                containerId: 'controlsArea',  //control bar를 생성할 영역
	                options: {
	                    ui: {
	                        chartType: 'LineChart',
	                        chartOptions: {
	                            chartArea: {'width': '60%', 'height': 80},
	                            hAxis: {
	                                'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize: 12},
	                                gridlines: {
	                                    count: controlLineCount, units: {
	                                        years: {format: ['yyyy년']},
	                                        months: {format: ['MM월']},
	                                        days: {format: ['dd일']},
	                                        hours: {format: ['HH시']}
	                                    }
	                                }
	                            }
	                        }
	                    },
	                    filterColumnIndex: 0
	                }
	            });
	
	            var date_formatter = new google.visualization.DateFormat({pattern: chartDateformat});
	            date_formatter.format(data, 0);
	
	            var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
	            window.addEventListener('resize', function () { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
	            dashboard.bind([control], [chart]);
	            dashboard.draw(data);
	        }
			
	        // 콜백함 수 등록
	        google.charts.setOnLoadCallback(drawDashboard);
	    }
	}
	
	$(document).ready(function () {
	    google.charts.load('current', {'packages': ['line', 'controls']});
	    chartDrowFun.chartDrow();
	});
	</script>
</html>