# 식품 안전 데이터 웹페이지
식품 영양정보 DB, HACCP 인증 식품 포장지 정보 등 공공데이터를 활용한 Spring 웹 프로젝트

## 사용 기술
> 언어 : Java, JavaScript, Mysql, Mybatis, Vue.js
>
> 툴 : Spring Suite Tool, Mysql Workbanch

## 주요기능
> 
> ### 1. HACCP 식품 데이터
> ***
> ![메인페이지](./SafeFood_Web_Spring_GJ_BYG_LSH/캡처/F01_식품명검색.PNG)
> ```
> 식품 안전 정보의 메인페이지. HACCP인증 식품들을 위주로 노출되며 식품명, 보고번호로 검색할 수 있다.
> ```
>
> ![메인페이지](./SafeFood_Web_Spring_GJ_BYG_LSH/캡처/F03_식품별_알레르기_표시.PNG)
> ```
> 회원의 알레르기 주의 식품은 주의 표시가 별도로 표기.
> 상세 페이지에는 상세 식품 정보표를 제공
> ```
>
> ![메인페이지](./SafeFood_Web_Spring_GJ_BYG_LSH/캡처/F15_원재료_국가별_표시및통계.PNG)
> ```
> 상세 페이지 하단에는 원재료 국가별 표시 및 통계표를 제공
> ```
>
> ### 2. 식품 영양정보 DB
> ***
> ![메인페이지](./SafeFood_Web_Spring_GJ_BYG_LSH/캡처/F21_검색기능.png)
> ```
> 식품 영양정보 공공데이터를 활용하여 식품군, 식품명, 가공업체별 리스트를 제공
> ```
>
> ![메인페이지](./SafeFood_Web_Spring_GJ_BYG_LSH/캡처/F04_식품별_영양성분_주의_표시.PNG)
> ```
> 식품 영양정보 공공데이터를 활용하여 식품군, 식품명, 가공업체별 리스트를 제공
> ```
>
> ### 3. 나의 섭취식품 페이지
> ***
> ![메인페이지](./SafeFood_Web_Spring_GJ_BYG_LSH/캡처/F08_섭취식품_데이터관리.PNG)
>
> * 섭취식품 달력 하단의 세가지 탭
>
> ![메인페이지](./SafeFood_Web_Spring_GJ_BYG_LSH/캡처/F09_섭취식품_영양소별통계.PNG)
> ![메인페이지](./SafeFood_Web_Spring_GJ_BYG_LSH/캡처/F12_찜한식품_통계보기.PNG)
> 
> ```
> 회원의 섭취 식품과 찜한 식품을 관리하고 통계를 보여주는 페이지
> Google Chart Api와 Vue를 활용
> ```
>
> ### 4. 공지사항과 로그인 기능
> ***
> ```
> * Spring Boot로 공지사항 Restful Api를 제공하고 그 데이터를 게시판 형식으로 보여주는 페이지.
> * 회원관리와 로그인 구현
> ```
>
> ![메인페이지](./SafeFood_Web_Spring_GJ_BYG_LSH/캡처/F07_공지사항_01.PNG)
> ***
> ![메인페이지](./SafeFood_Web_Spring_GJ_BYG_LSH/캡처/F05_회원관리.PNG)
> ![메인페이지](./SafeFood_Web_Spring_GJ_BYG_LSH/캡처/F06_로그인관리.PNG)
