/**
 * 
 */
let vi = new Vue({
	el:"#container",
	data(){
		return {
			boards:[], // Board 객체들
			maxPage:0,
			checked:[], // check된 게시글들
			searchMode:"질문제목",
			searchValue:""
		};
	},
	mounted(){
		this.reload();
	},
	methods:{
		reload(){
			axios.get("http://localhost:9090/api/page")
			.then(response => {
				this.boards = response.data.data;
				this.maxPage = Math.ceil(response.data.maxPage/10);
				console.log(this.maxPage);
			}).catch(error => {
				console.log(error);
			});
		},
		goToPage(i){
			axios.get("http://localhost:9090/api/page/"+i)
			.then(response => {
				this.boards = response.data.data;
			}).catch(error => {
				console.log(error);
			});
		},
		goToDetail(num){
			location.href="readDetail/"+num;
		},
		deleteChecked(){
			console.log(this.checked);
			for(let check of this.checked){
				axios.delete("http://localhost:9090/api/delete/" + check)
				.then(response => {
					this.checked = null;
					console.log(this.checked);
				}).catch(error => {
					console.log(error);
				}).finally(()=> ( this.reload() ));
			}
		},
		//검색기능
		search() {
			let searchMode = "";
			if(this.searchMode === '질문제목')
				searchMode = "title";
			else if(this.searchMode === '글쓴이')
				searchMode = "name";
			else
				searchMode = "content";
			
			axios.get("http://localhost:9090/api/search/" + searchMode + "/" + this.searchValue)
			.then(response => {
				this.boards = response.data.data;
				this.maxPage = Math.ceil(response.data.maxPage/10);
				console.log(this.maxPage);
			}).catch(error => {
				console.log(error);
			});
		}
	}
});