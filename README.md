# spring-mvc-board2-2020-12-29-

2020년 12 월 29일 오후 12:26분 기준

1) 게시판 답변기능추가

2) 총 기능
*게시글 작성
*게시글 수정
*게시글 삭제
*게시글 전체 목록 읽어오기
*해당게시글에 대한 답변 
*게시물 신고기능 









		==> !필독! <==
				마이바티스 사용시 pom.xml 에 JDBC 라이브러리 , MYbatis 라이브러리
				XML에 임포트 해줘야함 
				servlet-context.xml에 
				1) JDBC 연결을 위한 초기 xml세팅
				2) mybatis 사용을 위한 초기 xml 세팅
				3)* class path ==> 현재 사용하고있는 package 경로를 써줘야함
				4)안써주면 parsing 이 안된다 (xml Parsing X)
				5)mapper Xml ==> 중요
				<mapper namespace="com.javalecture.practice.CDAO.CDAO"> </mapper> 선언해주어야함
				사용하던 사용안하던
				이거를 안써주면 [09. 8. 28   19:14:57:806 KST] 0000000a TreeBuilder   W   ODCF0002E: 예외: 너무 일찍 파일 끝에 도달했습니다..
				ClassCastException: class java.lang.Integer cannot be cast to class com.javalec.java.DTO.DTO (java.lang.Integer is in module java.base of 					  loader 'bootstrap'; com.javalec.java.DTO.DTO is in unnamed module of loader org.apache.catalina.loader.WebappClassLoader @447b657f)
				==> mapper XML 에 resultType 을 잘못써준 경우 이런 classcastException error가 난다.
				org.xml.sax.SAXParseException: 너무 일찍 파일 끝에 도달했습니다.
   					 at org.apache.xerces.util.ErrorHandlerWrapper.createSAXParseException(Unknown Source)
   					 at org.apache.xerces.util.ErrorHandlerWrapper.fatalError(Unknown Source)
				이런 종류의 에러가 발생 ==> Xml Parsing 문제 
				xml 파싱이 안되는 케이스
				1) incoding error
				2) route error	
				3) xml Mapper path error
        4) binding error ==> mapper xml 에 binding 오류 문제 , mapper xml 에 빠진 부분이 있거나 문제가 생겼을때 나는 오류이다.
