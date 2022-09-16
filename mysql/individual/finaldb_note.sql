-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: finaldb
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `note` (
  `noteId` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(50) NOT NULL,
  `pageViewState` varchar(50) DEFAULT 'POST',
  `category` varchar(50) NOT NULL,
  `noteTitle` varchar(150) DEFAULT NULL,
  `note` longtext,
  `noteLike` int DEFAULT '0',
  `noteCommentNum` int DEFAULT '0',
  `noteCreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `noteUpdatedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`noteId`), 
  KEY `FK_note_userId` (`userId`),
  CONSTRAINT `FK_note_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
	ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
-- INSERT INTO `note` VALUES (1,'user','POST','FREE','a','',0,0,'2022-08-19 15:14:32','2022-08-19 15:14:32'),(2,'user','POST','FREE','aaaaaaaaaa','<p>aaaaaaaaaaaaa</p><p>b</p><p>c</p>',0,0,'2022-08-19 15:16:11','2022-08-19 16:42:04'),(3,'user','POST','FREE','혹시 딥러닝 무료강의 괜찮은곳 있을까요?','<p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\">개념부터해서</p><p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box;\"></p><p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\">간단한 예제 정도 있으면 좋을거 같은데 혹시 있을까요</p><p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box;\"></p><p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\">추천 부탁드리겠습니다.</p>',0,0,'2022-08-19 15:49:00','2022-08-19 15:49:00'),(4,'user','POST','FREE','데스크톱을 판매하고 맥북 에어 m1으로 기변하려고하는데요','<p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\">22년 3월 23일 구매하였고</p><p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\">얼마에 팔아야 괜찮을까요??</p><p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box;\"></p><p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\">웹 백엔드로 맥북 에어 m1 16기가 괜찮겠죠??</p>',0,0,'2022-08-19 15:51:33','2022-08-19 15:51:33'),(5,'user','POST','FREE','보통 외주 단가는 어떻게 산정하나요?','<div style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; background-color: rgb(255, 255, 255);\">4년 전쯤 퇴사했던 회사에서&nbsp;<br style=\"box-sizing: border-box;\"></div><div style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; background-color: rgb(255, 255, 255);\">당시 개발했던 시스템 신규 기능추가 요청이 들어왔다고&nbsp;</div><div style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; background-color: rgb(255, 255, 255);\">임원 한분이 전화가 왔는데</div><div style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box;\"></div><div style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; background-color: rgb(255, 255, 255);\">그 때 백업 없이 1인 개발로 진행했던 프로젝트라 대응이 쉽지 않은지 외주 형식으로 도와줄 수 있겠냐고 물어보시네요</div><div style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box;\"></div><div style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; background-color: rgb(255, 255, 255);\">현재 재직 중이라 시간 상 힘들 것 같다고 말씀드렸는데 주말에라도 가능하신지 물어보셔서</div><div style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; background-color: rgb(255, 255, 255);\"><br style=\"box-sizing: border-box;\"></div><div style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; background-color: rgb(255, 255, 255);\">기억이 가물가물하지만.. 당시 팀장님이랑 전화로 내용 대충 들어봤는데 딱히 어려운 수준은 아닐 것 같은데 보통 외주는 알바처럼 시간당?으로 계산하는건가요?</div>',0,0,'2022-08-19 15:52:18','2022-08-19 15:52:18'),(6,'user','POST','FREE','신입은 회사 소스코드 분석하는걸로도 벅차네요','<p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\">회사에서 넥사크로라는 툴을 사용하고있긴 한데</p><p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\">넥사크로 포함해서 한줄한줄 분석하려고 하니 정말 어렵네요</p><p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\">자주 쓰이는 함수들 따로 빼서 정리하시고 거기서 갖다쓰시고 .. 그거 따라가서 어떻게 만들어졌는지 보고</p><p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\">하다보면 하루 그냥 삭제되네요 .. 조회기능 하나 만들려는데도 굉장히 애먹고있습니다.</p><p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\">화면하나 만들어보라고 해놨는데 이렇게 하루하루 까먹다보니 아닌말로 똥줄타네요 ..&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\">이런것도 물어봐도 되나 싶을정도의 질문도 물어봐야되는걸지</p><p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\">아니면 오래걸려도 하나씩 보는게 좋은건지 그 선을 잘 모르겠네요 ..&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\">뭘 모르는지 몰라서 못물어보겠는건지 ..&nbsp;</p><p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\">저는 이게 왜 이렇게 되는지 이해를 해야 적용해서 제 화면에 갖다 쓸 수 있을것같은데</p><p style=\"box-sizing: border-box; margin-bottom: 10px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-variant-ligatures: normal; font-variant-caps: normal; background-color: rgb(255, 255, 255);\">요령이 부족한가봅니다 ㅠㅠ&nbsp;</p>',0,0,'2022-08-19 16:10:30','2022-08-19 16:10:30'),(7,'user','POST','FREE','abc','<p>abc</p><p>bc</p><p>c</p>',0,0,'2022-08-19 16:33:00','2022-08-19 16:33:00');
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-19 16:49:00
