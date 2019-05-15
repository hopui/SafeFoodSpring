<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />
<link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />
	
<title>나의 섭취 달력</title>

<link rel='stylesheet' href='https://unpkg.com/bootstrap/dist/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua" rel="stylesheet">

<style>
[v-cloak]::before {
	content: '로딩중...'
}

[v-cloak]>* {
	display: none;
}

body {
	font-family: 'Jua', sans-serif;
	font-weight: 200;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	font-size: 1.125em;
	line-height: 1.3;
}

.b-calendar {
	display: flex;
	align-items: center;
	margin: 2.5em 0;
}

.b-calendar__information {
	background-color: #ffede3;
	border-radius: 1.2rem 0 0 1.2rem;
	height: 100%;
}

.b-calendar__information .today {
	flex-direction: column;
	padding-top: 3em;
}

.b-calendar__information .today .weekDay {
	font-size: 1.2em;
	font-weight: 100;
	padding-bottom: 0.5em;
}

.b-calendar__information .today .day {
	font-size: 5.5em;
	font-weight: 600;
	line-height: 1;
}

.b-calendar__information .today .month {
	font-size: 2em;
	font-weight: 200;
	line-height: 1;
}

.b-calendar__calendar {
	min-height: 40rem;
}

.b-calendar__header {
	margin-bottom: 2rem;
}

.b-calendar__header .month {
	font-size: 1.25em;
	font-weight: 200;
	text-transform: capitalize;
}

.b-calendar__header .year {
	font-size: 1.5em;
	font-weight: 600;
	margin-bottom: 1rem;
}

.b-calendar__header .arrow {
	background: transparent;
	border: 1px solid rgba(0, 0, 0, 0.1);
	border-radius: 50%;
	color: #000;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 2.5rem;
	width: 2.5rem;
}

.b-calendar__header .arrow:hover {
	cursor: pointer;
}

.b-calendar__header .arrow-left i {
	-webkit-transform: translateX(-10%);
	transform: translateX(-10%);
}

.b-calendar__header .arrow-right i {
	-webkit-transform: translateX(10%);
	transform: translateX(10%);
}

.b-calendar__weekdays {
	display: flex;
	margin-bottom: 1.25rem;
	text-align: center;
}

.b-calendar__weekdays .weekday {
	width: calc(100%/ 7);
	padding: 0.25rem 0.5rem;
}

.b-calendar__dates {
	display: flex;
	flex-wrap: wrap;
	position: relative;
}

.b-calendar__dates:after {
	content: "";
	position: absolute;
	bottom: 0;
	background-color: #fff;
	height: 1px;
	width: 100%;
	z-index: 1;
}

.b-calendar__dates .date {
	border-right: 1px solid rgba(0, 0, 0, 0.05);
	border-bottom: 1px solid rgba(0, 0, 0, 0.05);
	font-weight: 200;
	min-height: 6.25rem;
	padding: 0.25rem 0.5rem;
	position: relative;
	width: calc(100%/ 7);
}

.b-calendar__dates .date.blank {
	background-color: rgba(0, 0, 0, 0.02);
	color: rgba(0, 0, 0, 0.2);
}

.b-calendar__dates .date.no-border-right {
	border-right: none;
}

.b-calendar__dates .date.today {
	background-color: rgba(0, 123, 255, 0.2);
}

.b-calendar__dates .date .weekday {
	display: none;
}

.b-calendar__dates .date .additional {
	font-size: 0.75em;
	position: absolute;
	bottom: 0.25rem;
	left: 0.5rem;
}

.b-calendar__dates .date .additional .year {
	padding-right: 0.25rem;
	font-size: 0.75em;
}

.b-footer {
	padding: 15px 0;
}

.taken_day {
	/* background-color: #F4B1AE; */
	background-color: rgba(189, 249, 166, 0.25);
}
.taken_img {
	display: flex;
	margin-left: 18px;
}
.taken_list {
	overflow: auto;
    position: absolute;
    top: 260px;
    background-color: white;
    width: 320px;
    height: 314px;
    border-radius: 1.0rem 0 0 1.0rem;
}
th, td{
	text-align: center!important;
}

</style>


<script>
  window.console = window.console || function(t) {};
</script>

<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>

</head>
<body>
<div id="app" v-cloak>
    <b-container>
        <main class="b-calendar">
            <b-row>
                <b-col md="4">
                    <!-- 왼쪽 파란색 정보창 -->
                    <div class="b-calendar__information">
                        <div class="today d-flex justify-content-center align-items-center">
                            <div class="weekDay">{{selectedWeekDay | capitalize}}</div>
                            <div class="day">{{selectedDayAndMonth.day}}</div>
                            <div class="month">{{selectedDayAndMonth.month | capitalize}}</div>
                            <a href="#"
                               id="goTodayLink"
                               @click="goToday"
                               v-show="!todayInCurrentMonthAndYear || !todayIsEqualSelectDate"
                            >Today</a>

                            <b-tooltip target="goTodayLink"
                            		   placement="bottom"
                                       v-show="!todayInCurrentMonthAndYear || !todayIsEqualSelectDate"
                            >오늘 날짜로 돌아가기
                            </b-tooltip>
                            
                            <!-- 섭취 리스트 -->
                            <div class="taken_list" v-if="showDetail" >
                            	<table class="table table-striped table-hover">
                            		<thead>
                 						<col width="10%">
										<col width="50%">
										<col width="20%">
										<col width="20%">
                            			<tr>
                            				<th>#</th><th>이름</th><th>개수</th><th>삭제</th>
                            			</tr>	
                            		</thead>
                            		<tbody>
                            			<tr v-for="(info, index) in selectedInfo" v-model="selectedInfo">
                            				<td><span>{{index+1}}</span></td>
                            				<td>
                            					<span v-bind:id="'foodName'+(index+1)">
                            						{{info.etc.substr(0,6)}}<span v-if="info.etc.length > 6">..</span><!-- 길면 ..을 붙임 -->
                            					</span>
                            					<b-tooltip v-bind:target="'foodName'+(index+1)" placement="bottom" v-if="info.etc.length > 6">
					                            	{{info.etc}}
					                            </b-tooltip>
                            				</td>
                            				<td>
                            					<input type="number" v-model="info.quantity" min=1 style="width:40px;">
                            				</td>
                            				<td>
                            					<input type="checkbox" name="checked" :value="info.foodCode" @click="checkFoodCode(info.foodCode)">
                            				</td>
                            			</tr>
                            		</tbody>
                            	</table>
                            </div>
                            <div class="btnBar" v-show="showDetail">
                            	<input class="btn btn-info" type="button" value="수정" @click="modifyQuantities">
                            	<input class="btn btn-danger" type="button" value="삭제" @click="deleteChecked">
                            </div>
                        </div>
                    </div>

                </b-col>
                <b-col md="8">
                    <div class="b-calendar__calendar">
                        <div class="b-calendar__header">
							<!-- 년도 -->
                            <b-row>
                                <b-col class="year text-right" align-h="end"> 
                                    <span>{{year}}</span>
                                </b-col>
                            </b-row>
							<!-- 달 넘기는 버튼과 툴팁들, 그 사이에 이번 달을 출력 -->
                            <b-row align-v="center">
                                <b-col class="text-left" align-h="start">
                                    <b-button id="subtractMonthBtn" class="arrow arrow-left" variant="light" @click="subtractMonth">
                                        <i class="fa fa-fw fa-chevron-left"></i>
                                    </b-button>
                                    <b-tooltip target="subtractMonthBtn"> 
                                    	{{previousMonthAsString | capitalize}}
                                    </b-tooltip>
                                </b-col>
                                
                                <b-col class="text-center" align-h="center">
                                    <span class="month">{{month}}</span>
                                </b-col>
                                
                                <b-col class="text-right d-flex flex-row-reverse" align-h="end">
                                    <b-button id="addMonthBtn" class="arrow arrow-right" variant="light" @click="addMonth">
                                    	<i class="fa fa-fw fa-chevron-right"></i>
                                    </b-button>
                                    <b-tooltip target="addMonthBtn"> 
                                    	{{nextMonthAsString | capitalize}}
                                    </b-tooltip>
                                </b-col>
                            </b-row>
                        </div>
                        
                        <!-- 월화수목금토일 -->
                        <div class="b-calendar__weekdays">
                            <div class="weekday" v-for="(day, index) in days" :key="index">
                                <strong>{{day}}</strong>
                            </div>
                        </div>

                        <!-- 날짜 박스 -->
						<c:url value="/static/img/takenFood.png" var="takenFoodImgUrl"/>
                        <div class="b-calendar__dates">
                            <div class="date text-right"
                            	 v-for="date in dateList" 
                                 :class="{
			                                'today': date.today,
			                                'blank': date.blank,
			                                'no-border-right': date.key % 7 === 0,
											'taken_day': date.isTakenDay === true 
                             			}"
                                 :key="date.key" 
                                 :data-date="date.date"
                                 @click="setSelectedDate(date.moment, date.isTakenDay)"
                             >
                                <span class="day">{{date.dayNumber}}</span> 
                                <span class="weekday">{{date.weekDay}}</span>
                                <img v-show="date.isTakenDay" src="${takenFoodImgUrl }" class="taken_img">
                                <div class="additional" v-show="date.additional">
                                    <span class="year" v-show="date.additional.year">{{date.additional.year}}</span>
                                    <span class="month" v-show="date.additional.month">{{date.additional.month}}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </b-col>
            </b-row>
        </main>
    </b-container>
</div>
</body>

<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>
<script src='https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js'></script>
<script src='https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js'></script>
<script src='https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<c:url value="/static/script/calendar.js" var="calendarJSUrl"/>
<script id = "rendered-js" src="${calendarJSUrl }">
</script>

<script src="https://static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js"></script>
</html>