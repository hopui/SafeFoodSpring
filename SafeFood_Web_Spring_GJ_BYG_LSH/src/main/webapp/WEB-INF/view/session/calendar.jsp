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
	min-height: 5.75rem;
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
	margin-right: 9px;
}
.taken_list {
	position: absolute;
    top: 260px;
    background-color: white;
    width: 270px;
    height: 370px;
    border-radius: 1.0rem 0 0 1.0rem;
}
th, td{
	text-align: center!important;
}
@media ( max-width : 768px) {
	.b-calendar__information {
		min-height: auto;
		padding-top: 2rem;
		padding-bottom: 2rem;
		border-radius: 2.5rem 2.5rem 0 0;
	}
	.b-calendar__information .today {
		padding-top: 0;
	}
}

@media ( max-width : 480px) {
	.b-calendar__weekdays {
		display: none;
	}
	.b-calendar__dates .date {
		width: 100%;
		text-align: left !important;
		border: none;
		border-bottom: 1px solid rgba(0, 0, 0, 0.05);
		display: flex;
	}
	.b-calendar__dates .date.blank {
		display: none;
	}
	.b-calendar__dates .date .weekday {
		display: block;
		margin-left: 0.25rem;
	}
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
                            <div class="taken_list" v-show="!todayInCurrentMonthAndYear || !todayIsEqualSelectDate">
                            	<table class="table table-striped table-hover">
                            		<thead>
                            			<tr>
                            				<th>#</th><th>이름</th><th>개수</th><th>삭제</th>
                            			</tr>	
                            		</thead>
                            		<tbody>
                            			<tr>
                            				<td>1</td>
                            				<td>케이크</td>
                            				<td>
                            					<input type="number" value="2" style="width:40px;">
                            				</td>
                            				<td>
                            					<input type="checkbox">
                            				</td>
                            			</tr>
                            			<tr>
                            				<td>1</td>
                            				<td>케이크</td>
                            				<td>
                            					<input type="number" value="2" style="width:40px;">
                            				</td>
                            				<td>
                            					<input type="checkbox">
                            				</td>
                            			</tr>
                            			<tr>
                            				<td>1</td>
                            				<td>케이크</td>
                            				<td>
                            					<input type="number" value="2" style="width:40px;">
                            				</td>
                            				<td>
                            					<input type="checkbox">
                            				</td>
                            			</tr>
                            			<tr>
                            				<td>1</td>
                            				<td>케이크</td>
                            				<td>
                            					<input type="number" value="2" style="width:40px;">
                            				</td>
                            				<td>
                            					<input type="checkbox">
                            				</td>
                            			</tr>
                            			<tr>
                            				<td>1</td>
                            				<td>케이크</td>
                            				<td>
                            					<input type="number" value="2" style="width:40px;">
                            				</td>
                            				<td>
                            					<input type="checkbox">
                            				</td>
                            			</tr>
                            			<tr>
                            				<td>1</td>
                            				<td>케이크</td>
                            				<td>
                            					<input type="number" value="2" style="width:40px;">
                            				</td>
                            				<td>
                            					<input type="checkbox">
                            				</td>
                            			</tr>
                            		</tbody>
                            	</table>
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
                                 @click="setSelectedDate(date.moment)"
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

<script id = "rendered-js" >
new moment.locale('ko', {
    weekdays: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
    weekdaysShort: ["일", "월", "화", "수", "목", "금", "토"],
    months: "1월_2월_3월_4월_5월_6월_7월_8월_9월_10월_11월_12월".split("_"),
    monthsShort: "1월_2월_3월_4월_5월_6월_7월_8월_9월_10월_11월_12월".split("_")
});
let userEmail = "${loginUser.email }";
let contextRoot = "SafeFood_Web_Spring_GJ_BYG_LSH";
let vi = new Vue({
    el: "#app",
    data: {
    	hostname: "localhost",
        today: moment(),
        dateContext: moment(),
        selectedDate: moment(),
        days: ["월", "화", "수", "목", "금", "토", "일"],
        takenInfos: [],
    },
	mounted() {
    	this.loadTakenFoods();
    },
    computed: {
        year: function () {
            return this.dateContext.format("Y");
        },

        month: function () {
            return this.dateContext.format("MMMM");
        },

        daysInMonth: function () {
            return this.dateContext.daysInMonth();
        },

        currentDate: function () {
            return this.dateContext.get("date");
        },

        firstDayOfMonth: function () {
            let firstDay = moment(this.dateContext).subtract(this.currentDate, "days");
            return firstDay.weekday();
        },

        previousMonth: function () {
            return moment(this.dateContext).subtract(1, "month");
        },
        previousMonthAsString: function () {
            return this.previousMonth.format("MMMM");
        },
        nextMonth: function () {
            return moment(this.dateContext).add(1, "month");
        },
        nextMonthAsString: function () {
            return this.nextMonth.format("MMMM");
        },

        daysInPreviousMonth: function () {
            return this.previousMonth.daysInMonth();
        },
        daysFromPreviousMonth: function () {
            let daysList = [];
            let count = this.daysInPreviousMonth - this.firstDayOfMonth;
            while (count < this.daysInPreviousMonth) {
                if (window.CP.shouldStopExecution(0)) break;
                count++;
                daysList[count] = count;
            }
            window.CP.exitedLoop(0);

            return daysList.filter(function () {
                return true;
            });
        },

        dateList: function () {
            let $this = this;

            let dateList = [];
            let previousMonth = this.previousMonth;
            let nextMonth = this.nextMonth;

            //dates for display
            let formattedCurrentMonth = this.dateContext.format("MM");
            let formattedCurrentYear = this.year;
            let formattedPreviousMonth = previousMonth.format("MM");
            let formattedPreviousYear = previousMonth.format("Y");
            let formattedNextMonth = nextMonth.format("MM");
            let formattedNextYear = nextMonth.format("Y");

            //counters
            let countDayInCurrentMonth = 0;
            let countDayInPreviousMonth = 0;

            //filling in dates from the previous month
            this.daysFromPreviousMonth.forEach(function (dayFromPreviousMonth) {
                countDayInCurrentMonth++;
                countDayInPreviousMonth++;

                let formattedDay = $this.formattingDay(dayFromPreviousMonth);
                let previousMonth = $this.daysFromPreviousMonth.length === countDayInPreviousMonth ? $this.previousMonthAsString : false;
                let previousYear = formattedCurrentYear !== formattedPreviousYear && $this.daysFromPreviousMonth.length === countDayInPreviousMonth ? formattedPreviousYear : false;

                let additional = {
                    month: previousMonth,
                    year: previousYear
                };

                if (!previousMonth && !previousYear) {
                    additional = false;
                }

                dateList[countDayInCurrentMonth] = {
                    key: countDayInCurrentMonth,
                    dayNumber: formattedDay,
                    date: formattedDay + "." + formattedPreviousMonth + "." + formattedPreviousYear,
                    blank: true,
                    today: false,
                    additional: additional,
                    weekDay: false,
                    isTakenDay: false,
                    moment: moment(
                        formattedPreviousYear +
                        formattedPreviousMonth +
                        formattedDay)
                };
            });

            //현재 달의 정보를 채우는 부분
            while (countDayInCurrentMonth < this.firstDayOfMonth + this.daysInMonth) {
                
            	if (window.CP.shouldStopExecution(1)) break;
                countDayInCurrentMonth++; 

                let day = countDayInCurrentMonth - countDayInPreviousMonth; // 달력에 표시될 총 일수
                let weekDay = this.getWeekDay(countDayInCurrentMonth);
                let formattedDay = this.formattingDay(day);

                dateList[countDayInCurrentMonth] = {
                    key: countDayInCurrentMonth,
                    dayNumber: formattedDay,
                    date: formattedDay + "." + formattedCurrentMonth + "." + formattedCurrentYear,
                    blank: false,
                    today: formattedDay === this.initialDate && this.todayInCurrentMonthAndYear,
                    additional: false,
                    isTakenDay: false,
                    weekDay: weekDay,
                    moment: moment(formattedCurrentYear + formattedCurrentMonth + formattedDay)
                };
            }
            window.CP.exitedLoop(1);
            // 섭취한 적이 있는 날짜는 체크해준다.
            for(let info of this.takenInfos) {
				let d = new Date(info.takenTime);
				dateList[d.getDate()+2].isTakenDay = true;
			}

            let daysInNextMonth = 7 - countDayInCurrentMonth % 7;
            let countDayInCurrentMonthSaved = countDayInCurrentMonth;
            let day = 0;

            //filling in dates from the next month
            if (daysInNextMonth < 7) {
                while (countDayInCurrentMonth < countDayInCurrentMonthSaved + daysInNextMonth) {
                    if (window.CP.shouldStopExecution(2)) break;
                    countDayInCurrentMonth++;
                    day++;

                    let formattedDay = this.formattingDay(day);
                    let nextMonth = day === 1 ? this.nextMonthAsString : false;
                    let nextYear =
                        formattedCurrentYear !== formattedNextYear && day === 1 ?
                            formattedNextYear :
                            false;
                    let additional = {
                        month: nextMonth,
                        year: nextYear
                    };


                    if (!nextMonth && !nextYear) {
                        additional = false;
                    }

                    dateList[countDayInCurrentMonth] = {
                        key: countDayInCurrentMonth,
                        dayNumber: formattedDay,
                        date:
                            formattedDay +
                            "." +
                            formattedNextMonth +
                            "." +
                            formattedNextYear,
                        blank: true,
                        today: false,
                        additional: additional,
                        weekDay: false,
                        isTakenDay: false,
                        moment: moment(
                            formattedNextYear +
                            formattedNextMonth +
                            formattedDay)
                    };


                }
                window.CP.exitedLoop(2);
            }

            return dateList.filter(function () {
                return true;
            });
        },

        initialDate: function () {
            return this.formattingDay(this.today.get("date"));
        },
        initialMonth: function () {
            return this.today.format("MMMM");
        },
        initialYear: function () {
            return this.today.format("Y");
        },
        todayInCurrentMonthAndYear: function () {
            return (this.month === this.initialMonth && this.year === this.initialYear);
        },
        selectedDayAndMonth: function () {
            let dayAndMonth = this.selectedDate.format("D MMMM");
            dayAndMonth = dayAndMonth.split(" ");
            dayAndMonth = {
                day: dayAndMonth[0],
                month: dayAndMonth[1]
            };

            return dayAndMonth;
        },
        selectedWeekDay: function () {
            return this.selectedDate.format("dddd");
        },
        todayIsEqualSelectDate: function () {
            return (
                this.selectedDate.format("YYYYMMDD") === this.today.format("YYYYMMDD"));
        }
    },

    methods: {
    	loadTakenFoods() {
    		let emailInfo = userEmail.split(".");
    		let url = "http://"+this.hostname+":8080/"+contextRoot+"/session/takenfoods?";
    		let param = "email="+emailInfo[0]+"&dot="+emailInfo[1]+"&year="+this.dateContext.format("YYYY")+"&month="+this.dateContext.format('M');
    		console.log("url: ",url+param);
    		axios.get(url+param)
			.then(response => {
				this.takenInfos = response.data.list;
			}).catch(error => {
				console.log(error);
			});
    	},
        addMonth: function () {
            this.dateContext = this.nextMonth;
            this.loadTakenFoods();
        },
        subtractMonth: function () {
            this.dateContext = this.previousMonth;
            this.loadTakenFoods();
        },
        setSelectedDate: function (moment) {
            this.selectedDate = moment;
        },
        goToday: function () {
            this.selectedDate = this.today;
            this.dateContext = this.today;
        },
        formattingDay(day) {
            return ("0" + day).slice(-2);
        },
        getWeekDay(day) {
            let index = day;
            if (index > 7) {
                index %= 7;
            }
            index = index === 0 ? 6 : index - 1;
            return this.days[index];
        }
    },

    filters: {
        capitalize: function (value) {
            if (!value) return "";
            value = value.toString();
            return value.charAt(0).toUpperCase() + value.slice(1);
        }
    }
});
</script>

<script src="https://static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js"></script>
</html>