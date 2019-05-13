
	 	var maincomp = Vue.component("maincomp", {
			template:"#main-temp",
			data(){
				return {
					numOfRows:0,
					foods:[],
					pageNo:0,
					totalCount:0,
					pageSelector:[],
					nowPages:0,
					methodurl:''
				}
			},
			mounted(){
				this.methodurl = methodurl;
				this.loadData(1);
			},
			methods:{
				loadData(num){
					var userURL = "http://localhost:8080/SafeFood_Web_Spring_GJ_BYG_LSH";				
					var url = userURL + "/AjaxRequest.jsp?getUrl=";
					url += encodeURIComponent(this.methodurl+num);
					
					axios
					.get(url)
					.then(response => {
										this.foods = response.data.list;
										this.numOfRows = response.data.numOfRows;
										this.pageNo = response.data.pageNo;
										this.totalCount = response.data.totalCount;	
										
										for(let i=1; i<Math.round(this.totalCount/this.numOfRows); i++)
											this.pageSelector.push(i);
					})
					.catch(error =>{
						console.log(error)
						this.errored= true;
					})
					// 함수에서의 this는 window, arrow 함수에서는 vue
					.finally(() => {this.loading = false})
				},
				checkAller(aller){
					if(allergy.length > 0){
						let users = allergy.split(",");
						for(let al of users){
							if(aller.indexOf(al) > -1){
								return true;	
							}
						}
					}
					return false;
				},
				nextPage(num){
					if(this.nowPages+num >-1 &&
							this.nowPages+num <=Math.round(this.totalCount/this.numOfRows)){
						this.nowPages+=num
					}
				}
			}
		}) 
		
		var tablecomp =  Vue.component("tablecomp", {
			template:"#table-temp",
			data(){
				return {
					foods:[],
					foodSection:[],
					pageSelector:[],
					nowPages:0,
					totalCount:500
				}
			},
			mounted(){
				this.loadData(1);
				for(let i=1; i<=this.totalCount; i++)
					this.pageSelector.push(i);
			},
			methods:{
				loadData(first){
					if(!sort){
						axios
						.get("/SafeFood_Web_Spring_GJ_BYG_LSH/food/"+(first-1))
						.then(response => {
							this.foodSection = response.data.list;
						})
						.catch(error =>{
							console.log(error)
							this.errored= true;
						})
						// 함수에서의 this는 window, arrow 함수에서는 vue
						.finally(() => {this.loading = false})
					}else{
						axios
						.get("/SafeFood_Web_Spring_GJ_BYG_LSH/search/"+sort+"/"+searchtext+"/"+(first-1))
						.then(response => {
							this.foods = response.data.list;
							for(let i=0; i<20; i++ ){
								if(this.foods.length ==i)
									break;
								this.foodSection.push(this.foods[i]);
							}
							this.totalCount = Math.round(this.foods.length/20);
						})
						.catch(error =>{
							console.log(error)
							this.errored= true;
						})
						// 함수에서의 this는 window, arrow 함수에서는 vue
						.finally(() => {this.loading = false})
					}
				},
				nextPage(num){
					if(this.nowPages+num >-1 &&
							(this.nowPages+num)*10 <=this.totalCount){
						this.nowPages+=num
					}
				},
				getPage(num){
					if(this.foods.length>0){
						this.foodSection=[];
						for(let i=(num-1)*20; i<(num-1)*20+20; i++ ){
							if(this.foods.length ==i)
								break;
							this.foodSection.push(this.foods[i]);
						}
					}else
						this.loadData(num);
				}
			}
		}) 
	 	
	 	 let vi = new Vue({
				el:"#app",
				data: {
					  currentview: '',
				      allviews:['maincomp','tablecomp'],
				   },
				   components: {
					   maincomp: maincomp,
					   tablecomp: tablecomp,
				     },
				   mounted(){
					   this.currentview = current;
				   },
				   methods:{
					   getOptions(){
						   if(current==='maincomp')
							   return [{name: "prdlstNm", value: "제품명"},{name: "prdlstReportNo", value:"품목보고번호"}];
						   else
							   return [{name: "name", value: "제품명"},
								   {name: "food_group", value:"제품군"},
								   {name: "maker", value:"가공업체명"}];
					   }
				   }
			}
		)