new moment.locale('ko', {
    weekdays: 		["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
    weekdaysShort: 	["일", "월", "화", "수", "목", "금", "토"],
    months: 		"1월_2월_3월_4월_5월_6월_7월_8월_9월_10월_11월_12월".split("_"),
    monthsShort: 	"1월_2월_3월_4월_5월_6월_7월_8월_9월_10월_11월_12월".split("_")
});
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
        showDetail: false,
        selectedInfo: [],
        deleteList: [],
        updateList: []
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
                    takenFoods: [],
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
                    takenFoods: [],
                    weekDay: weekDay,
                    moment: moment(formattedCurrentYear + formattedCurrentMonth + formattedDay)
                };
            }
            window.CP.exitedLoop(1);
            
            // 섭취한 적이 있는 날짜는 체크해준다.
            let d = moment();
            for(let info of this.takenInfos) {
				d = new moment(info.takenTime);
				let idx = d.get("date")+2;
				dateList[idx].isTakenDay = true; // 섭취했음을 알려준다.
				dateList[idx].takenFoods.push({name: info.etc, quantity: info.quantity, foodCode: info.foodCode}); 
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
                        takenFoods: [],
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
            return (this.selectedDate.format("YYYYMMDD") === this.today.format("YYYYMMDD"));
        }
    },

    methods: {
    	//해당 유저의 섭취정보를 가져옵니다.
    	loadTakenFoods() {
    		let url = "http://"+this.hostname+":8080/"+contextRoot+"/session/takenfoods?";
    		let param = "year="+this.dateContext.format("YYYY")+"&month="+this.dateContext.format('M');

    		axios.get(url+param)
			.then(response => {
				this.takenInfos = [];
				this.takenInfos = response.data.list;
				
				// 선택 정보를 갱신한다.
				let selectedDate = this.selectedDate.format("DD");	
	            console.log("선택한 날짜: ", selectedDate);
	            for(let info of this.takenInfos) {
	            	// 2. db에서 가져온 먹은 정보들 안의 날짜는 unix 타임이다. 
	            	let takenDate = moment();
	            	takenDate = moment(info.takenTime).format("DD"); // 유닉스 타임을 모멘트로 바꾼다.
	            	console.log("섭취한 식품에 있는 날짜: ", takenDate);
	            	if(selectedDate == takenDate) {								
	            		console.log(takenDate,"에 먹은 음식이 있습니다. ", info);
	            		this.selectedInfo.push(info);           		
	            	}
	            }
			}).catch(error => {
				console.log(error);
			});
    	},
    	deleteChecked() {
    		let url = "http://"+this.hostname+":8080/"+contextRoot+"/session/takenfoods/delete/";
    		// db에서 삭제
    		for(let i = 0; i < this.deleteList.length; i++){
    			console.log("moment: ", this.selectedDate, ", format: ", this.selectedDate.format("YYYY-MM-DD"));
				axios.delete(url + this.deleteList[i] +"/"+ this.selectedDate.format("YYYY-MM-DD"))
				.then(response => {
					console.log(response);
					if(i == this.deleteList.length-1) {
						this.deleteList=[];
						// 1. 원래 있던 선택정보를 갱신한다.
			            this.selectedInfo = [];
			    		// 2. 갱신 된 섭취정보를 가져온다.
			    		this.loadTakenFoods();
					}
				}).catch(error => {
					console.log(error);
				});
			}
    		console.log("갱신된 선택 정보: ", this.selectedInfo);
    	},
    	// 선택된 정보들을 업데이트 한다.
    	modifyQuantities() {
    		let url = "http://"+this.hostname+":8080/"+contextRoot+"/session/takenfoods/update?";
    		for(let i = 0; i < this.selectedInfo.length; i++){
				let params = "quantity="+this.selectedInfo[i].quantity+"&foodCode="+this.selectedInfo[i].foodCode+"&takenTime="+this.selectedInfo[i].takenTime;
    			axios.get(url + params)
				.then(response => {
					console.log(response);
					if(i == this.selectedInfo.length-1) {
			    		// 1. 갱신 된 섭취정보를 가져온다.
			    		this.deleteList=[];
			            this.selectedInfo = [];
			    		this.loadTakenFoods();
			    		alert("수정 완료!");
					}
				}).catch(error => {
					console.log(error);
				});
			}
    	},
        addMonth: function () {
            this.dateContext = this.nextMonth;
            this.loadTakenFoods();
            this.showDetail = false;
        },
        subtractMonth: function () {
            this.dateContext = this.previousMonth;
            this.loadTakenFoods();
            this.showDetail = false;
        },
        // 달력에서 칸을 선택할 때 발생하는 이벤트
        setSelectedDate: function (moment, isTakenDay) {
			console.log("클릭한 날짜의 moment: ",moment,"섭취한 건지: ", isTakenDay);
        	if(!isTakenDay) {
				this.showDetail = false;
				return;
			}
        	// 현재 날짜를 저장하고 디테일 뷰를 보여준다.
            this.selectedDate = moment;
            this.showDetail = true;
            
            // 선택한 날의 섭취 정보를 얻어와 출력할 준비를 한다.
         	// 1. 원래 있던 선택정보를 갱신한다.
            this.selectedInfo = [];
            // 2. 갱신 된 섭취정보를 가져온다.
        	this.loadTakenFoods();
        },
        goToday: function () {
            this.selectedDate = this.today;
            this.dateContext = this.today;
            this.setSelectedDate(this.selectedDate);
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