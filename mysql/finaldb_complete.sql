CREATE DATABASE  IF NOT EXISTS `finaldb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `finaldb`;
-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: localhost    Database: finaldb
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `certifytemp`
--

DROP TABLE IF EXISTS `certifytemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certifytemp` (
  `userEmail` varchar(50) DEFAULT NULL,
  `certifyNum` varchar(20) DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certifytemp`
--

LOCK TABLES `certifytemp` WRITE;
/*!40000 ALTER TABLE `certifytemp` DISABLE KEYS */;
/*!40000 ALTER TABLE `certifytemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `noteId` int NOT NULL,
  `userId` varchar(50) NOT NULL,
  `pageViewState` varchar(50) DEFAULT 'POST',
  `comment` text,
  `commentLike` int DEFAULT '0',
  `commentCreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `commentUpdatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commentId`),
  KEY `userId` (`userId`),
  KEY `noteId` (`noteId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`noteId`) REFERENCES `note` (`noteId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentlike`
--

DROP TABLE IF EXISTS `commentlike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commentlike` (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(50) NOT NULL,
  KEY `commentId` (`commentId`),
  KEY `userId` (`userId`),
  CONSTRAINT `commentlike_ibfk_1` FOREIGN KEY (`commentId`) REFERENCES `comment` (`commentId`) ON DELETE CASCADE,
  CONSTRAINT `commentlike_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentlike`
--

LOCK TABLES `commentlike` WRITE;
/*!40000 ALTER TABLE `commentlike` DISABLE KEYS */;
/*!40000 ALTER TABLE `commentlike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `courseId` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) NOT NULL,
  `exhbnId` int NOT NULL,
  `courseTitle` varchar(50) DEFAULT NULL,
  `courseTag` varchar(1000) DEFAULT NULL,
  `courseView` int DEFAULT '1',
  `courseLike` int DEFAULT '0',
  `courseComment` int DEFAULT '0',
  `courseState` varchar(50) DEFAULT 'POST',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `placeNames` varchar(2000) DEFAULT NULL,
  `categoryNames` varchar(2000) DEFAULT NULL,
  `phones` varchar(2000) DEFAULT NULL,
  `addressNames` varchar(2000) DEFAULT NULL,
  `roadAddressNames` varchar(2000) DEFAULT NULL,
  `postionX` varchar(2000) DEFAULT NULL,
  `positionY` varchar(2000) DEFAULT NULL,
  `placeUrls` varchar(2000) DEFAULT NULL,
  `placeMemos` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`courseId`),
  UNIQUE KEY `courseId` (`courseId`),
  KEY `FK_course_userId` (`userId`),
  KEY `FK_course_exhbnId` (`exhbnId`),
  CONSTRAINT `FK_course_exhbnId` FOREIGN KEY (`exhbnId`) REFERENCES `exhbn` (`exhbnId`),
  CONSTRAINT `FK_course_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseComment`
--

DROP TABLE IF EXISTS `courseComment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courseComment` (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `courseId` int NOT NULL,
  `userId` varchar(50) NOT NULL,
  `pageViewState` varchar(50) DEFAULT 'POST',
  `comment` text,
  `commentLike` int DEFAULT '0',
  `commentCreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `commentUpdatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commentId`),
  KEY `FK_courseComment_corseId` (`courseId`),
  KEY `FK_courseComment_userId` (`userId`),
  CONSTRAINT `FK_courseComment_corseId` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`),
  CONSTRAINT `FK_courseComment_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseComment`
--

LOCK TABLES `courseComment` WRITE;
/*!40000 ALTER TABLE `courseComment` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseComment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courselike`
--

DROP TABLE IF EXISTS `courselike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courselike` (
  `courseId` int NOT NULL,
  `userId` varchar(20) NOT NULL,
  KEY `FK_courselike_courseId` (`courseId`),
  KEY `FK_courselike_userId` (`userId`),
  CONSTRAINT `FK_courselike_courseId` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`),
  CONSTRAINT `FK_courselike_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courselike`
--

LOCK TABLES `courselike` WRITE;
/*!40000 ALTER TABLE `courselike` DISABLE KEYS */;
/*!40000 ALTER TABLE `courselike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhbn`
--

DROP TABLE IF EXISTS `exhbn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exhbn` (
  `exhbnId` int NOT NULL,
  `exhbnTitle` varchar(100) DEFAULT '',
  `exhbnImgUrl` varchar(100) DEFAULT '',
  `exhbnUrl` varchar(200) DEFAULT '',
  `exhbnPlaceUrl` varchar(100) DEFAULT '',
  `exhbnArea` varchar(50) DEFAULT '',
  `exhbnPlace` varchar(100) DEFAULT '',
  `exhbnPlaceAddr` varchar(100) DEFAULT '',
  `exhbnStartDate` datetime DEFAULT NULL,
  `exhbnEndDate` datetime DEFAULT NULL,
  `exhbnPrice` text,
  `exhbnPrice1` int DEFAULT '0',
  `exhbnContent` text,
  `exhbnPhone` text,
  `exhbnWriter` varchar(100) DEFAULT '',
  `exhbnHostOrganizer` varchar(100) DEFAULT '',
  `exhbnNum` varchar(100) DEFAULT '',
  `gpsX` double DEFAULT '0',
  `gpsY` double DEFAULT '0',
  `exhbnView` int DEFAULT '0',
  `exhbnLike` int DEFAULT '0',
  `exhbnScrap` int DEFAULT '0',
  `viewState` varchar(50) DEFAULT 'WAIT',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`exhbnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhbn`
--

LOCK TABLES `exhbn` WRITE;
/*!40000 ALTER TABLE `exhbn` DISABLE KEYS */;
INSERT INTO `exhbn` VALUES (166147,'모두 몇 마리일까요?','http://www.culture.go.kr/upload/rdf/21/03/rdf_2021033110325407198.jpg','https://booking.naver.com/booking/6/bizes/337055/items/3414658?area=ple','http://nabynara.com/','경기','파주나비나라박물관','경기도 파주시 광인사길 161 파주나비나라박물관','2020-10-17 00:00:00','2022-06-30 00:00:00','6,000원',6000,'','031-955-3727','','','',126.686912358871,37.7148520478068,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:13:00'),(170893,'국립중앙도서관 「실감서재」','http://www.culture.go.kr/upload/rdf/21/09/rdf_2021092715383338725.jpg','https://www.nl.go.kr/NL/contents/N41801000000.do','https://www.nl.go.kr/NL/contents/N41801000000.do','서울','실감서재','서울특별시 서초구 반포대로 201 국립중앙도서관 디지털도서관 지하 3층 실감서재','2021-03-23 00:00:00','2022-12-31 00:00:00','무료',0,'','02-3456-6169','','','',127.00322294340722,37.49742196534692,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:13:00'),(185859,'S프로젝트_Connected Tunnel','http://www.culture.go.kr/upload/rdf/22/05/show_2022053019251874498.JPG','http://soma.kspo.or.kr','https://soma.kspo.or.kr/main','서울','소마미술관 2관','서울특별시 송파구 위례성대로 51 소마미술관 2관','2021-12-21 00:00:00','2022-12-31 00:00:00','무료',0,'','02-425-1077','','','',127.118184522722,37.5168648654617,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:13:00'),(201265,'[박노수미술관] 개관 8주년 기념전시 화가의 비망록','http://www.culture.go.kr/upload/rdf/22/01/show_202201051102749984.jpg','https://www.jfac.or.kr/site/main/program/perf_exhi_list_view?pgIdx=1669','https://www.jfac.or.kr/site/main/content/parkns01','서울','종로구립 박노수미술관','서울특별시 종로구 옥인1길 34 종로구립 박노수미술관','2021-10-12 00:00:00','2022-08-28 00:00:00','어른 3,000원    청소년 1,800원    어린이 1,200원',3000,'','02-2418-4171','','','',126.96678911202187,37.5813162146987,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:13:00'),(203580,'[현대어린이책미술관] 3회 《언-프린티드 아이디어》','http://www.culture.go.kr/upload/rdf/22/02/show_2022020910585659969.jpg','https://www.hmoka.org/exhibitions/past/view.do?st_cd=480&seq=86','https://www.hmoka.org/main/index.do','경기','현대어린이책미술관','경기 성남시 분당구 판교역로146번길 20 5층','2022-02-24 00:00:00','2022-06-26 00:00:00','6,000(성인, 아동 동일)',6000,'','031-5170-3700','','','',127.11208137802176,37.39278813783549,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:22:33'),(204681,'훈민정음, 천년의 문자 계획','http://www.culture.go.kr/upload/rdf/22/02/show_2022022813252555773.jpg','https://www.hangeul.go.kr/traceHangeul/traceHangeul1List.do?curr_menu_cd=0103010100','http://www.hangeul.go.kr/','서울','국립한글박물관','서울특별시 용산구 서빙고로 139 국립한글박물관','2022-01-21 00:00:00','2022-12-31 00:00:00','무료',0,'','02-2124-6200','','','',126.98047524583309,37.52106275914414,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:13:00'),(205080,'[아세안문화원] 기획전시 &lt;차와 커피의 시간&gt; ','http://www.culture.go.kr/upload/rdf/22/03/\'','https://ach.or.kr/ach/main.do','https://ach.or.kr/user/main','부산','아세안문화원','부산 해운대구 좌동로 162 아세안문화원','2022-03-11 00:00:00','2022-06-19 00:00:00','무료',0,'','051-775-2000','','','',129.182045700507,35.1751358860254,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:13:00'),(205263,'[소마미술관] 드로잉나우(Drawing Now) 전시 안내','http://www.culture.go.kr/upload/rdf/22/03/show_2022031014412318604.jpg','https://soma.kspo.or.kr/dspy/display/195#','https://soma.kspo.or.kr','서울','소마미술관 1관','서울특별시 송파구 올림픽로 424 소마미술관 1관','2022-03-11 00:00:00','2022-07-24 00:00:00','개인: 성인3,000원, 청소년2,000원, 어린이1,000원 | 단체: 성인1,500원, 청소년1,000원, 어린이500원',3000,'','02-425-1077','','','',127.115517876627,37.5203396980951,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:13:00'),(206135,'스포츠아트 전시기획 공모 당선전_ 몸∞맘 : 몸과 맘의 뫼비우스','http://www.culture.go.kr/upload/rdf/22/03/show_2022032117315995681.jpg','https://soma.kspo.or.kr/dspy/display/196','https://soma.kspo.or.kr/main','서울','소마미술관 2관','서울특별시 송파구 위례성대로 51 소마미술관 2관','2022-04-01 00:00:00','2022-08-07 00:00:00','개인: 성인3,000원, 청소년2,000원, 어린이1,000원 | 단체: 성인1,500원, 청소년1,000원, 어린이500원',3000,'','02-425-1077','','','',127.118184522722,37.5168648654617,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:13:00'),(206743,'[아트센터 화이트블럭] 당림 이종무 개인전 : 산에서 산산이 ','http://www.culture.go.kr/upload/rdf/22/03/show_202203281645486798.jpg','https://whiteblock.org/%EC%A0%84%EC%8B%9C/view/3084784','https://whiteblock.org/','경기','아트센터 화이트블럭','경기 파주시 탄현면 헤이리마을길 72 아트센터 화이트블럭','2022-04-07 00:00:00','2022-07-03 00:00:00','3,000원 (카페 이용 시 무료)',3000,'','031-992-4400','','','',126.69939974903895,37.78888535046657,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:24:10'),(209436,'[아트뮤제 전시] 꽃피우는 시간_안기호 展','http://www.culture.go.kr/upload/rdf/22/04/show_2022042913563735414.jpg','https://www.artmusee.com/sc/exhibition_view.php?seq=294','https://www.artmusee.com/','경기','아트뮤제갤러리 롯데백화점 일산점','경기 고양시 일산동구 중앙로 1283 롯데백화점 일산점 1층 다락별장 아트뮤제갤러리','2022-04-29 00:00:00','2022-06-02 00:00:00','무료',0,'','031-909-3187, 02-543-6151 ','','','',126.77211662822754,37.660471015973805,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:13:00'),(209437,'FUTURE FOOD · 혀가 느끼는 고민 展','http://www.culture.go.kr/upload/rdf/22/04/show_2022042914264341038.jpg','https://booking.naver.com/booking/12/bizes/688944','https://www.celineparkgallery.com/','서울','셀린박갤러리','서울시 종로구 평창동 442-7, Metaphor 32(아엘시즌)','2022-05-18 00:00:00','2022-12-31 00:00:00','일반 10,000원｜학생 8,000원',10000,'','아이러브아트센터 070-5222-3778','','','',126.97595649647921,37.61649988297008,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 15:08:51'),(209448,'생생한 채로, 정지된 사과_극사실주의 화가 민경숙 展','http://www.culture.go.kr/upload/rdf/22/04/show_2022042913523824926.jpg','https://www.artmusee.com/sc/exhibition_view.php?seq=295','https://www.artmusee.com/','경기','아트뮤제갤러리 롯데백화점 일산점','경기 고양시 일산동구 중앙로 1283 롯데백화점 일산점 1층 다락별장 아트뮤제갤러리','2022-04-29 00:00:00','2022-06-02 00:00:00','무료',0,'','031-909-3187, 02-543-6151 ','','','',126.77211662822754,37.660471015973805,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:13:00'),(209723,'Snoopy, Beyond the Space - 부산','http://www.culture.go.kr/upload/rdf/22/05/show_2022050315282970734.jpg','https://www.sangsangmadang.com/display/detail/2054','https://www.sangsangmadang.com/display/displayInfo/BS','부산','케이티엔지 상상마당 부산 갤러리','부산 부산진구 서면로 39 4F, 5F 갤러리','2022-05-05 00:00:00','2022-09-11 00:00:00','성인: 15,000원 / 아동 및 청소년: 12,000원',15000,'','070-8893-0892~4','','','',129.0572925197292,35.1542676148924,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:13:00'),(210015,'《장-미셸 오토니엘-정원과 정원》','http://www.culture.go.kr/upload/rdf/22/05/show_2022050913333912328.jpg','https://sema.seoul.go.kr/kr/whatson/exhibition/detail?exNo=1039603','http://sema.seoul.go.kr/','서울','서울시립미술관','서울특별시 중구 덕수궁길 61 서울시립미술관 서소문본관','2022-06-16 00:00:00','2022-08-07 00:00:00','무료',0,'','02-2124-8940','','','',126.97376336838333,37.564138249101916,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:13:00'),(210149,'새로운 날','http://www.culture.go.kr/upload/rdf/22/05/show_202205101516753749.jpg','https://www.artspace-isaek.com/%EB%B3%B5%EC%A0%9C-2022-05-19-05-25-%EB%B9%A8%EA%B0%84%EC%9B%90%ED%94%BC%EC%8A%A4%EB%A5%BC-%EC%9E%85%EC%9D%80-%EC%95%84%EC%9D%B4','https://www.artspace-isaek.com/','서울','아트스페이스 이색','서울특별시 종로구 율곡로 49-4 아트스페이스 이색','2022-05-26 00:00:00','2022-06-01 00:00:00','무료',0,'','010-8425-8082','','','',126.98457012723082,37.57651082234784,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:33:16'),(210404,'밤 ,','http://www.culture.go.kr/upload/rdf/22/05/show_20220516944182715.gif','http://www.underdogmuseum.com/32','http://www.underdogmuseum.com','서울','미디어 아트 갤러리 언더독뮤지엄','서울특별시 마포구 양화로12길 8-7 지하1층','2022-05-04 00:00:00','2022-06-15 00:00:00','일반 10,000원 그 외 나이, 자격별 권종',10000,'','02-336-0423','','','',126.91796480476273,37.551647369620305,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:13:00'),(210589,'we:view','http://www.culture.go.kr/upload/rdf/22/05/show_2022051622124777638.jpg','http://www.urbanpluto.com/?p=3225','http://www.urbanpluto.com','서울','어반플루토','서울특별시 영등포구 양평로22나길 3-2 어반플루토','2022-05-30 00:00:00','2022-06-01 00:00:00','무료관람',0,'','02-2633-1343','','','',126.89400275559309,37.538822844729516,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:13:00'),(210593,'선명한 하루','http://www.culture.go.kr/upload/rdf/22/05/show_2022051816472550636.jpg','https://eightclub.imweb.me/','http://www.sfactory.kr/ ','서울','에스팩토리','서울특별시 성동구 연무장15길 11 에스팩토리','2022-06-03 00:00:00','2022-06-09 00:00:00','무료',0,'','010-8425-8082','','','',127.05889679246407,37.54281787520723,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:13:00'),(210600,'월전우화: 월전 장우성의 영모화','http://www.culture.go.kr/upload/rdf/22/05/show_2022051911102336032.png','http://www.iwoljeon.org/exhibition/display.php?sp=view&display_idx=95','http://www.iwoljeon.org/','경기','이천시립월전미술관','경기도 이천시 경충대로2709번길 185 이천시립월전미술관','2022-04-07 00:00:00','2022-07-03 00:00:00','성인 2,000원  청소년 1,000원  어린이 600원(5.13-5.22 박물관미술관주간 무료입장, 문화가 있는 날 무료입장)',2000,'','031-637-0032','','','',127.42442323601418,37.279469528114404,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:35:26'),(210761,'의자로 읽는 디자인','http://www.culture.go.kr/upload/rdf/22/05/show_2022051913394167978.png','https://me2.kr/qdb2y','http://library.kcdf.kr/libeka_web2/','서울','KCDF 아카이브 센터','서울특별시 종로구 인사동11길 8 KCDF 아카이브 센터','2022-05-20 00:00:00','2022-06-03 00:00:00','무료',0,'','02-733-9042','','','',126.9841150077854,37.57400824946774,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:13:00'),(210863,'함께 만드는 음악의 전시','http://www.culture.go.kr/upload/rdf/22/05/show_2022052013311992109.JPG','https://njp.ggcf.kr/%ed%95%a8%ea%bb%98-%eb%a7%8c%eb%93%9c%eb%8a%94-%ec%9d%8c%ec%95%85%ec%9d%98-%ec%a0%84%ec%8b%9c/','http://njp.ggcf.kr/','경기','백남준아트센터','경기도 용인시 기흥구 백남준로 10 백남준아트센터','2022-04-01 00:00:00','2022-06-19 00:00:00','무료',0,'','031-201-8548','','','',127.11037318643987,37.26927634736376,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:13:00'),(210868,'히토 슈타이얼 - 데이터의 바다','http://www.culture.go.kr/upload/rdf/22/05/show_2022052014123049815.JPG','https://www.mmca.go.kr/exhibitions/exhibitionsDetail.do?exhFlag=1&exhId=202202140001485#','http://www.mmca.go.kr/','서울','국립현대미술관 서울관','서울특별시 종로구 삼청로 30 국립현대미술관 서울관','2022-04-29 00:00:00','2022-09-18 00:00:00','4,000원',4000,'',' 02-3701-9500','','','',126.98010361777375,37.578627490528596,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:13:00'),(210962,'서울시립미술관 《그리드 아일랜드 Grid Island》','http://www.culture.go.kr/upload/rdf/22/05/show_2022052310405589617.jpg','https://sema.seoul.go.kr/kr/whatson/exhibition/detail?exNo=1039819','http://sema.seoul.go.kr/','서울','서울시립미술관','서울특별시 중구 덕수궁길 61 서울시립미술관 서소문본관','2022-05-26 00:00:00','2022-08-15 00:00:00','무료',0,'','02-308-1071','','','',126.97376336838333,37.564138249101916,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:13:00'),(210981,'부산문화재단 F1963 기획전시 &lt;FANtasy come true&gt;','http://www.culture.go.kr/upload/rdf/22/05/show_202205231627116769.jpg','http://www.f1963.org/ko/?c=art&s=2&syear=2022&gp=1&gbn=viewok&ix=276','http://www.f1963.org/ko/','부산','F1963','부산광역시 수영구 구락로123번길 20 석천홀','2022-05-13 00:00:00','2022-06-12 00:00:00','무료',0,'','부산문화재단 문화공간팀 051-754-0431','','','',129.1149095156985,35.17695289939205,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:36:39'),(211100,'digital voyage ','http://www.culture.go.kr/upload/rdf/22/05/show_202205271445000131.jpg','','https://www.seoulmetro.co.kr:444/kr/rent.do?menuIdx=394#;','서울','서울메트로미술관','서울특별시 종로구 사직로 지하 130 3호선 경복궁역','2022-05-27 00:00:00','2022-06-01 00:00:00','무료',0,'','1577-1234','','','',126.97305739004673,37.57586004016984,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:13:00'),(211179,'골목 -남겨진 기억','http://www.culture.go.kr/upload/rdf/22/05/show_2022052611223490346.jpg','https://www.incheon.go.kr/museum/MU060103/2090005','https://www.incheon.go.kr/museum/index','인천','인천시립박물관','인천광역시 연수구 청량로160번길 26 인천시립박물관','2022-05-31 00:00:00','2022-08-14 00:00:00','무료',0,'','032-440-6737','','','',0,0,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:13:00'),(211205,'섬유미술작가 고승현 초대전 《스산》','http://www.culture.go.kr/upload/rdf/22/05/show_2022052715335979240.jpg','https://shas21.creatorlink.net/forum/view/672487','http://shas21.creatorlink.net/','충남','서해미술관','충남 서산시 부석면 무학로 152-13 서해미술관','2022-06-05 00:00:00','2022-06-18 00:00:00','무료',0,'','서해미술관 관장 정태궁 010-4412-8486','','','',126.37746675819173,36.63886710785817,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 15:02:02'),(211349,'운중낙원 -Paradise in Clouds','http://www.culture.go.kr/upload/rdf/22/05/show_2022052811102556550.jpg','http://hedwig-gallery.edenstore.co.kr/','http://hedwig-gallery.edenstore.co.kr/','경기','헤드비갤러리 Hedwig gallery','경기 성남시 분당구 운중로146번길 13 1층 헤드비갤러리','2022-05-25 00:00:00','2022-06-21 00:00:00','무료',0,'','031-629-9998','','','',127.08010908831922,37.390642655724804,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:13:00'),(211403,'제25회 인천예술고 학생미술작품전 - 경계를 넘어서','http://www.culture.go.kr/upload/rdf/22/05/show_2022053011244629739.jpg','https://www.ilec.go.kr/performance/exhibit_reserve.asp?page=v&idx=485','https://www.ilec.go.kr/','인천','인천광역시교육청평생학습관','인천광역시 연수구 경원대로 73 인천광역시교육청평생학습관','2022-06-08 00:00:00','2022-06-16 00:00:00','무료',0,'','032-899-1516','','','',126.67208557141,37.3983025881861,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:13:00'),(211541,'그레이박스 이후: 수집에서 전시까지','http://www.culture.go.kr/upload/rdf/22/06/show_2022062925978897.PNG','https://www.busan.go.kr/moca/exhibition01/1525727','https://www.busan.go.kr/moca/index','부산','부산현대미술관','부산광역시 사하구 낙동남로 1191 부산 현대미술관','2022-04-15 00:00:00','2022-07-17 00:00:00','무료 (유튜브 공연)',0,'','051 - 220-7400~1','','','',128.9427422591895,35.10921642590141,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:13:00'),(211643,'한복, 보자기를 품다','http://www.culture.go.kr/upload/rdf/22/06/show_2022060211101537832.jpg','https://www.kcdf.or.kr/web/cop/exhibit/selectExhibit.do?applyNum=8501','https://www.kcdf.or.kr/web/content.do?proFn=kcdf_gallery','서울','KCDF갤러리','서울특별시 종로구 인사동11길 8 KCDF갤러리','2022-06-01 00:00:00','2022-06-06 00:00:00','무료',0,'','02-732-9382','','','',126.98411783877808,37.574003744874666,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:20:52'),(211647,'디지털 공명(Digital Resonance)','http://www.culture.go.kr/upload/rdf/22/06/show_2022060214451179556.jpg','https://artmuse.gwangju.go.kr/pj/pjExhibit.php?pageID=artmuse0209000000&action=view&exhiCd=010&exhiTp=N&lang=KOR&eSeq=751','http://artmuse.gwangju.go.kr/','광주','광주시립미술관','광주광역시 북구 하서로 52 광주시립미술관','2022-03-30 00:00:00','2022-06-29 00:00:00','무료 (유튜브 공연)',0,'','062.613.7100','','','',126.88569893884143,35.18341644370536,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:13:00'),(211664,'700년의 시간여행-신안 도자기를 찾아서','http://www.culture.go.kr/upload/rdf/22/06/show_202206022172287898.jpg','https://gwangju.museum.go.kr/prog/expHall/kor/exp/sub02_06/list.do','http://gwangju.museum.go.kr/','광주','국립광주박물관','광주광역시 북구 하서로 110 국립광주박물관','2022-01-01 00:00:00','2022-12-31 00:00:00','무료 (유튜브 공연)',0,'','062-570-7805','','','',126.88308334728757,35.18907896386975,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:12:19'),(211665,'따로 또 같이','http://www.culture.go.kr/upload/rdf/22/06/show_2022060223531295837.jpg','http://www.urbanpluto.com/?p=3234','http://www.urbanpluto.com','서울','어반플루토','서울특별시 영등포구 양평로22나길 3-2 어반플루토','2022-06-15 00:00:00','2022-06-19 00:00:00','무료관람',0,'','02-2633-1343','','','',126.89400275559309,37.538822844729516,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:12:19'),(211756,'여름: 락 - 와유산수 동양화 展','http://www.culture.go.kr/upload/rdf/22/06/show_202206041861337861.jpg','https://blog.naver.com/gongganbom/222735950190','https://blog.naver.com/gongganbom','대구','갤러리 봄(대구)','대구 북구 학정로 551-50 갤러리 봄 2층','2022-05-16 00:00:00','2022-07-01 00:00:00','무료',0,'','01072848275','','','',128.56485903289402,35.954480343890516,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 15:02:02'),(211997,'장생포 &#39;사라지는 경계&#39; 박진영 개인전','http://www.culture.go.kr/upload/rdf/22/06/show_2022060818335393237.jpg','','https://www.ulsannamgu.go.kr/sinhwa/mainPage.do','울산','울산 신화 예술인촌 갤러리','울산 남구 여천로80번길 15 울산 신화 예술인촌 1층 갤러리','2022-06-11 00:00:00','2022-06-19 00:00:00','무료',0,'','052-709-3033','','','',129.3419813664329,35.52312705386585,0,0,0,'DELETE','2022-08-10 12:51:24','2022-08-10 15:02:02'),(211999,'2022 ACC FOCUS 《아쿠아 천국》','http://www.culture.go.kr/upload/rdf/22/06/show_2022060820592352408.jpg','https://www.acc.go.kr/main/exhibition.do?PID=0202&action=Read&bnkey=EM_0000004904','https://www.acc.go.kr/guide/Map/view','광주','국립아시아문화전당 문화창조원','광주광역시 동구 문화전당로 38 문화창조원','2022-06-09 00:00:00','2022-09-12 00:00:00','무료',0,'','1899-5566','','','',126.92002336164622,35.14801833019346,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:12:19'),(212102,'《점, 곁에서 말하는 점들 Dots, speaking nearby dots》','http://www.culture.go.kr/upload/rdf/22/06/show_2022060916372343213.png','https://booking.naver.com/booking/12/bizes/315390/items/4468572?preview=1 ','http://www.spacec.co.kr/','서울','코리아나미술관','서울특별시 강남구 언주로 827 코리아나미술관','2022-06-13 00:00:00','2022-06-30 00:00:00','2,000원',2000,'','02-547-9177','','','',127.03276412436121,37.524123237468025,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:12:19'),(212190,'INSERT COIN','http://www.culture.go.kr/upload/rdf/22/06/show_20220610049969457.jpg','http://www.urbanpluto.com/?p=3241','http://www.urbanpluto.com','서울','어반플루토','서울특별시 영등포구 양평로22나길 3-2 어반플루토','2022-06-22 00:00:00','2022-06-26 00:00:00','무료관람',0,'','02-2633-1343','','','',126.89400275559309,37.538822844729516,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:12:19'),(212201,'ART TOKEN in 2022 코리아 아트페어','http://www.culture.go.kr/upload/rdf/22/06/show_2022061011232484505.png','http://www.koreaart21.com/news/articleView.html?idxno=1252','http://www.coex.co.kr/','서울','코엑스 홀','서울특별시 강남구 영동대로 513 코엑스 홀','2022-06-15 00:00:00','2022-06-18 00:00:00','10000원',10000,'','02-396-8744','','','',127.05886183310699,37.51273344406397,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:12:19'),(212202,'물성의 이해','http://www.culture.go.kr/upload/rdf/22/06/show_2022061017522843267.jpg','https://www.kcdf.or.kr/web/cop/exhibit/selectExhibit.do?applyNum=8502','https://www.kcdf.or.kr/web/content.do?proFn=kcdf_gallery','서울','KCDF갤러리','서울특별시 종로구 인사동11길 8 KCDF갤러리','2022-06-08 00:00:00','2022-06-13 00:00:00','무료',0,'','02-732-9936','','','',126.98411783877808,37.574003744874666,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:20:52'),(212321,'심해(心海)','http://www.culture.go.kr/upload/rdf/22/06/show_2022061218273360050.jpg','https://www.instagram.com/8club_official/','http://www.gallerylamer.com/about-us/','서울','갤러리 라메르','서울특별시 종로구 인사동5길 26 갤러리 라메르','2022-07-06 00:00:00','2022-07-11 00:00:00','무료',0,'','010-8425-8082','','','',126.98493601130363,37.57255325030841,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:12:19'),(212343,'공간','http://www.culture.go.kr/upload/rdf/22/06/show_2022061317255393874.png','https://www.instagram.com/leffica_official/','https://www.instagram.com/_d.kunst/','서울','디쿤스트','서울특별시 용산구 한강대로10길 13 디쿤스트','2022-06-20 00:00:00','2022-06-26 00:00:00','무료',0,'','010-8425-8082','','','',126.96424092920257,37.52398721830173,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:12:19'),(212458,'있다, 잊다, 잇다','http://www.culture.go.kr/upload/rdf/22/06/show_2022061514175064516.jpg','https://www.kcdf.or.kr/web/cop/exhibit/selectExhibit.do?applyNum=8505','https://www.kcdf.or.kr/web/content.do?proFn=kcdf_gallery','서울','KCDF갤러리','서울특별시 종로구 인사동11길 8 KCDF갤러리','2022-06-15 00:00:00','2022-06-20 00:00:00','무료',0,'','02-732-9382','','','',126.98411783877808,37.574003744874666,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:20:52'),(212459,'시대와 공간을 잇다','http://www.culture.go.kr/upload/rdf/22/06/show_2022061514213635952.jpg','https://www.seoul284.org/program/view/category/319/state/4/menu/330?thisPage=1&idx=174','https://www.seoul284.org/','서울','문화역서울284','서울특별시 중구 통일로 1 문화역서울284','2022-06-16 00:00:00','2022-07-03 00:00:00','무료',0,'','02-3407-3505','','','',126.97158200040279,37.555893622397875,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 15:02:02'),(212461,'의암 손병희 순국 100주기 추모 특별전 &lt;3·1운동을 이끈 민족지도자 의암 손병희&gt;','http://www.culture.go.kr/upload/rdf/22/06/show_2022061413532044244.jpg','http://mhmh.or.kr/exhibition/special-exhibition','http://mhmh.or.kr/','서울','근현대사기념관','서울특별시 강북구 4.19로 114 근현대사기념관','2022-06-09 00:00:00','2022-09-30 00:00:00','무료입장',0,'','02-903-7580','','','',127.00282133723923,37.643437282288545,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:12:19'),(212545,'그림도시 The Last Scene: See You Again','http://www.culture.go.kr/upload/rdf/22/06/show_202206151425611209.png','https://www.grimdosi.com/','https://www.seoul284.org/','서울','문화역서울284','서울특별시 중구 통일로 1 문화역서울284','2022-06-17 00:00:00','2022-06-19 00:00:00','6000원',6000,'','02-790-9322','','','',126.97158200040279,37.555893622397875,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:12:19'),(212562,'&lt;용도의 쓸모&gt; 1장','http://www.culture.go.kr/upload/rdf/22/06/show_202206151922841844.jpg','','http://www.c-enter.kr/','서울','을지예술센터','서울특별시 중구 창경궁로5다길 18 3층','2022-06-18 00:00:00','2022-07-07 00:00:00','무료',0,'','02-6956-3501','','','',126.99658160314661,37.56773608903644,0,0,0,'DELETE','2022-08-10 12:51:24','2022-08-10 14:31:22'),(212763,'福을 담다','http://www.culture.go.kr/upload/rdf/22/06/show_202206171653885526.jpg','https://booking.naver.com/booking/12/bizes/315390/items/4466422','http://www.spacec.co.kr/museum/museum1','서울','코리아나화장박물관','서울특별시 강남구 언주로 827 코리아나화장박물관','2022-06-16 00:00:00','2022-09-30 00:00:00','성인 3,000원 / 학생 2,000원 / 65세 이상, 7세 이하, 장애인 무료 (기간 한정 할인 진행)',3000,'','02-547-9177','','','',127.03280652294131,37.52406916555441,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:12:19'),(212882,'2022 울산국제아트페어','http://www.culture.go.kr/upload/rdf/22/06/show_202206202030498406.jpg','https://booking.naver.com/booking/5/bizes/700244','http://ueco.or.kr','울산','울산전시컨벤션센터','울산 울주군 삼남읍 울산역로 255 울산전시컨벤션센터 (UECO)','2022-06-30 00:00:00','2022-07-03 00:00:00','일반 : 15,000원 / VIP 티켓 : 150,000원 / 청소년 (19세 이하) : 10,000원 / 울산 시민 : 10,000원',15000,'','울산국제아트페어 사무국 052-716-1107','','','',129.1316448035213,35.55561247206765,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:12:19'),(212965,'[Tom Sachs] Boombox Retrospective','http://www.culture.go.kr/upload/rdf/22/06/show_202206211819499815.png','https://hybeinsight.com/','https://hybeinsight.com/','서울','HYBE INSIGHT','서울특별시 용산구 한강대로 42 지하 1,2층 HYBE INSIGHT','2022-06-22 00:00:00','2022-09-11 00:00:00','입장권 22,000원, 입장권+포토티켓 25,000원',22000,'','insight_contact@hybeinsight.com','','','',126.96419541622363,37.52453681595855,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:12:19'),(212966,'kdk 개인전 《g》','http://www.culture.go.kr/upload/rdf/22/06/show_202206211992746383.jpg','','http://www.doosangallery.com/','서울','두산갤러리','서울특별시 종로구 종로33길 15 두산아트센터 1층','2022-06-15 00:00:00','2022-07-20 00:00:00','무료',0,'','02-708-5050','','','',127.00118857756357,37.57164420037769,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 14:12:19'),(213041,'푸른 구름의 나라_고려복식 고증 일러스트전','http://www.culture.go.kr/upload/rdf/22/06/show_202206221016251883.jpg','https://www.kcdf.or.kr/web/cop/exhibit/selectExhibit.do?applyNum=8507','https://www.kcdf.or.kr/web/content.do?proFn=kcdf_gallery','서울','KCDF갤러리','서울특별시 종로구 인사동11길 8 KCDF갤러리','2022-06-22 00:00:00','2022-06-28 00:00:00','무료',0,'','02-732-9382','','','',126.98411783877808,37.574003744874666,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:20:52'),(213121,'20주년 기념 독립운동가를 위한 현충재','http://www.culture.go.kr/upload/rdf/22/06/show_202206231243091592.jpg','http://www.inmuseum.or.kr/kor/museum/notice_view.php?m_code=MUSEUM1542071281&idx=272','http://www.inmuseum.or.kr/kor/museum/index.php?m_code=MUSEUM1542071281','인천','범패박물관','인천광역시 미추홀구 경인로70번길 11-13 범패박물관','2022-06-11 00:00:00','2022-06-30 00:00:00','단체문의',0,'','032-884-8904','','','',126.65122611175751,37.46481788011584,0,0,0,'WAIT','2022-08-10 12:51:24','2022-08-10 15:02:02'),(213243,'12m 아래, 종(種)들의 스펙터클','http://www.culture.go.kr/upload/rdf/22/06/show_2022062418282208469.jpg','https://booking.naver.com/booking/12/bizes/315390/items/4486820?preview=1','http://www.spacec.co.kr/','서울','코리아나미술관','서울특별시 강남구 언주로 827 코리아나미술관','2022-07-08 00:00:00','2022-07-23 00:00:00','10,000원',10000,'','02-547-9177','','','',127.03276412436121,37.524123237468025,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:12:19'),(213434,'송암미술관 2022년 체험특별전 &#39; 문자 + 더하기 그림&#39;','http://www.culture.go.kr/upload/rdf/22/06/show_2022062812391583009.jpg','https://www.incheon.go.kr/museum/MU020221/2091394','http://songam.incheon.go.kr/index.do','인천','송암미술관','인천광역시 미추홀구 비류대로55번길 68 송암미술관','2022-06-28 00:00:00','2022-11-27 00:00:00','무료',0,'','032-440-6777','','','',126.64225739986657,37.43441354349972,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 15:02:02'),(213754,'[현대어린이책미술관] 네모난 오아시스','http://www.culture.go.kr/upload/rdf/22/06/show_2022063010314763218.jpg','https://www.hmoka.org/exhibitions/current/list.do?st_cd=480','https://www.hmoka.org/main/index.do','경기','현대어린이책미술관','경기 성남시 분당구 판교역로146번길 20 5층','2022-07-14 00:00:00','2022-11-20 00:00:00','6,000(성인, 아동 동일)',6000,'','031-5170-3700','','','',127.11208137802176,37.39278813783549,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:22:58'),(213756,'신촌문화발전소 기획전시 &lt;시선의 움직임&gt;','http://www.culture.go.kr/upload/rdf/22/06/show_202206301141236803.jpg','https://www.scas.or.kr/kr/program/program_view.php?idx=138','https://www.scas.or.kr/','서울','신촌문화발전소','서울특별시 서대문구 연세로2나길 57 신촌문화발전소','2022-06-28 00:00:00','2022-08-05 00:00:00','무료',0,'','02-330-4393','','','',126.939753537,37.5579611736,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 15:02:02'),(213781,'신비로운 12가지 이야기','http://www.culture.go.kr/upload/rdf/22/06/show_2022063014311958155.PNG','https://booking.naver.com/booking/5/bizes/607906?area=bnr','http://www.xn--o70bt1cn3s2seb6c.com/','서울','문화복합몰 안녕인사동','서울특별시 종로구 인사동길 49','2021-12-10 00:00:00','2022-07-25 00:00:00','성인 20,000원 / 어린이 13,000원',20000,'','070-4035-0344','','','',126.98355173006792,37.57446542717116,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:12:19'),(213876,'[아트센터 화이트블럭] 아아! 동양화 : 열린 문','http://www.culture.go.kr/upload/rdf/22/07/show_2022070111471896483.jpg','https://whiteblock.org/%EC%A0%84%EC%8B%9C/view/3270975','https://whiteblock.org/','경기','아트센터 화이트블럭','경기 파주시 탄현면 헤이리마을길 72 아트센터 화이트블럭','2022-07-07 00:00:00','2022-09-25 00:00:00','3,000원 (카페 이용 시 무료)',3000,'','031-992-4400','','','',126.69939974903895,37.78888535046657,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:24:10'),(213877,'박영훈, 이지송 2인전 《BLACK INTO LIGHT》','http://www.culture.go.kr/upload/rdf/22/07/show_2022070115205174366.jpg','http://www.bundoart.com/exhibition/black-into-ligh/?back=ago','http://www.bundoart.com','대구','갤러리분도','대구 중구 동덕로 36-15 3층','2022-07-04 00:00:00','2022-07-23 00:00:00','무료',0,'','053-426-5615','','','',128.6057726340866,35.85882484328734,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 15:02:02'),(213970,'Warmly, 따스하게','http://www.culture.go.kr/upload/rdf/22/07/show_2022070510323004911.jpg','http://www.bokartcenter.co.kr/gallery_view.php?b_index=210','http://www.bokartcenter.co.kr','세종','비오케이아트센터','세종특별자치시 국책연구원3로 12 비오케이 아트센터 6층','2022-06-28 00:00:00','2022-07-17 00:00:00','무료관람',0,'','044-868-3962','','','',127.30326998956302,36.492355992753936,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 15:02:02'),(214159,'제24회 한국현대도예가회전','http://www.culture.go.kr/upload/rdf/22/07/show_2022070610445616179.jpg','https://www.kcdf.or.kr/web/cop/exhibit/selectExhibit.do?applyNum=8513','https://www.kcdf.or.kr/web/content.do?proFn=kcdf_gallery','서울','KCDF갤러리','서울특별시 종로구 인사동11길 8 KCDF갤러리','2022-07-06 00:00:00','2022-07-12 00:00:00','무료',0,'','02-732-9382','','','',126.98411783877808,37.574003744874666,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:20:52'),(214160,'코리안 프렌치 아트 커넥션','http://www.culture.go.kr/upload/rdf/22/07/show_2022070610485180335.png','https://www.seoul284.org/program/view/category/319/state/4/menu/330?thisPage=1&idx=182','https://www.seoul284.org/','서울','문화역서울284','서울특별시 중구 통일로 1 문화역서울284','2022-07-06 00:00:00','2022-07-08 00:00:00','무료',0,'','0507-1372-6380','','','',126.97158200040279,37.555893622397875,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 15:02:02'),(214181,'이명지 사진전 The sea','http://www.culture.go.kr/upload/rdf/22/07/show_2022070613521018285.jpg','https://www.ilec.go.kr/performance/exhibit_reserve.asp?page=v&idx=487','https://www.ilec.go.kr/','인천','인천광역시교육청평생학습관','인천광역시 연수구 경원대로 73 인천광역시교육청평생학습관','2022-07-13 00:00:00','2022-07-21 00:00:00','무료',0,'','032)899-1516','','','',126.67208557141,37.3983025881861,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:12:19'),(214182,'캘리, 인천에서 꽃피다 - KCCA 캘리 축제','http://www.culture.go.kr/upload/rdf/22/07/show_2022070613552208674.jpg','https://www.ilec.go.kr/performance/exhibit_reserve.asp?page=v&idx=486','https://www.ilec.go.kr/','인천','인천광역시교육청평생학습관','인천광역시 연수구 경원대로 73 인천광역시교육청평생학습관','2022-07-13 00:00:00','2022-07-21 00:00:00','무료',0,'','032)899-1516','','','',126.67208557141,37.3983025881861,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:12:19'),(214844,'서울시립 남서울미술관 제12회 서울미디어시티비엔날레 사전프로그램 《정거장》','http://www.culture.go.kr/upload/rdf/22/07/show_2022071217132075473.png','https://sema.seoul.go.kr/kr/whatson/series/detail?exNo=1062993&acadmyEeNo=0&evtNo=0&glolangType=KOR','https://sema.seoul.go.kr/kr/visit/namseoul','서울','서울시립미술관 남서울생활미술관','서울특별시 관악구 남부순환로 2076(남현동)','2022-07-21 00:00:00','2022-10-03 00:00:00','무료',0,'','02-2124-8975','','','',0,0,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 15:02:02'),(215048,'요리조리 MOKA Garden','http://www.culture.go.kr/upload/rdf/22/07/show_2022071411402126915.png','https://www.hmoka.org/exhibitions/current/view.do?st_cd=780&seq=109','http://www.hmoka.org','경기','MOKA가든','경기 남양주시 다산순환로 50 현대프리미엄아울렛 SPACE 1, A관 3F','2022-07-14 00:00:00','2022-10-30 00:00:00','무료',0,'','031-8078-2900','','','',127.15242127944973,37.61625523326071,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:12:19'),(215092,'도전! 어린이 건축가','http://www.culture.go.kr/upload/rdf/22/07/show_2022071418485865199.PNG','https://gcm.ggcf.kr/exhibitions/11','http://gcm.ggcf.kr/','경기','경기도어린이박물관','경기도 용인시 기흥구 상갈로 6 경기도어린이박물관','2022-01-01 00:00:00','2022-12-31 00:00:00','무료',0,'','031-270-8600','','','',127.1096573598879,37.2673983419378,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 14:12:19'),(215093,'원더풀랜드','http://www.culture.go.kr/upload/rdf/22/07/show_2022071418215968828.jpg','https://goyangcm.or.kr/about/exhibition.asp','http://www.goyangcm.or.kr/Main/','경기','고양 어린이박물관','경기 고양시 덕양구 화중로 26 고양어린이박물관','2021-08-17 00:00:00','2022-12-31 00:00:00','단체문의',0,'','031-839-0300','','','',126.83094408232536,37.629477073898244,0,0,0,'WAIT','2022-08-10 12:51:23','2022-08-10 13:53:46'),(215199,'도시탐험자 展','http://www.culture.go.kr/upload/rdf/22/07/show_202207150445037253.jpg','http://blog.naver.com/gongganbom/222735950190','https://blog.naver.com/gongganbom','대구','갤러리 봄(대구)','대구 북구 학정로 551-50 갤러리 봄 2층','2022-07-12 00:00:00','2022-08-27 00:00:00','무료',0,'','010.7284.8275','','','',128.56485903289402,35.954480343890516,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 15:02:02'),(215263,'CHRONO OBJECT the 2nd','http://www.culture.go.kr/upload/rdf/22/07/show_202207151471147938.jpg','https://www.kcdf.or.kr/web/cop/exhibit/selectExhibit.do?applyNum=8517','https://www.kcdf.or.kr/web/content.do?proFn=kcdf_gallery','서울','KCDF갤러리','서울특별시 종로구 인사동11길 8 KCDF갤러리','2022-07-20 00:00:00','2022-08-01 00:00:00','무료',0,'','02-732-9936','','','',126.98411783877808,37.574003744874666,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:20:52'),(215264,'나의 잠 My Sleep','http://www.culture.go.kr/upload/rdf/22/07/show_2022071514113984049.jpg','https://www.seoul284.org/program/view/category/319/state/3/menu/329?thisPage=1&idx=181&searchField=all&searchText=','https://www.seoul284.org/','서울','문화역서울284','서울특별시 중구 통일로 1 문화역서울284','2022-07-20 00:00:00','2022-09-12 00:00:00','무료',0,'','02-3407-3566','','','',126.97158200040279,37.555893622397875,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:12:19'),(215283,'서울시립미술관 《춤추는 낱말》','http://www.culture.go.kr/upload/rdf/22/07/show_2022071515502389049.jpg','','http://sema.seoul.go.kr/','서울','서울시립미술관','서울특별시 중구 덕수궁길 61 서울시립미술관 서소문본관','2022-09-01 00:00:00','2022-11-20 00:00:00','무료',0,'','02-2124-8932','','','',126.97376336838333,37.564138249101916,0,0,0,'WAIT','2022-08-10 12:51:26','2022-08-10 14:12:19'),(215379,'동서양을 교차하는 그림전','http://www.culture.go.kr/upload/rdf/22/07/show_2022071811342186876.png','','http://traditional-art.co.kr/main/index.html','경남','김해한림박물관','경상남도 김해시 한림면 김해대로 1029-20 김해한림박물관','2022-07-01 00:00:00','2022-09-11 00:00:00','단체문의',0,'','055)345-1016   /   055)345-1216','','','',128.79459574840402,35.294589371710984,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 13:53:46'),(215393,'번아웃증후군','http://www.culture.go.kr/upload/rdf/22/07/show_2022071816261910020.jpg','http://galleryraon.com/?page_id=2472#upcoming','http://galleryraon.com/','서울','갤러리라온','서울특별시 종로구 자하문로41길 4 갤러리라온','2022-08-04 00:00:00','2022-08-10 00:00:00','무료',0,'','010-8425-8082','','','',126.96229200948497,37.59762507853639,0,0,0,'WAIT','2022-08-10 12:51:26','2022-08-10 14:12:19'),(215402,'*c-lab 6.0 프로젝트 X 박관우 &lt;클럽 리얼리티&gt;','http://www.culture.go.kr/upload/rdf/22/07/show_2022071814552019267.jpg','https://booking.naver.com/booking/12/bizes/315390/items/4519188?preview=1 ','http://www.spacec.co.kr/','서울','코리아나미술관','서울특별시 강남구 언주로 827 코리아나미술관','2022-07-29 00:00:00','2022-07-31 00:00:00','2,000원',2000,'','스페이스 씨 02-547-9177 / clab.coreanamuseumofart@gmail.com','','','',127.03276412436121,37.524123237468025,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:12:19'),(215484,'아트스페이스카고 개관 레퍼토리 전시《이주 Migrate》','http://www.culture.go.kr/upload/rdf/22/07/show_20220719025506661.jpg','https://www.artspacecargo.com','http://www.artspacecargo.com','인천','아트스페이스카고','인천광역시 중구 흰바위로 35 1층','2022-07-19 00:00:00','2022-08-12 00:00:00','무료',0,'','032-751-2019','','','',126.48881829564723,37.49274358393201,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:12:19'),(215590,'프랑스 일러스트 원화전 클로에 페라르노의 오케스트라를 찾아라','http://www.culture.go.kr/upload/rdf/22/07/show_2022072010193392447.jpg','https://www.sejongpac.or.kr/portal/performance/performance/view.do?performIdx=33385&menuNo=200004','http://www.dfac.or.kr/main/main.asp','서울','북서울 꿈의숲아트센터','서울특별시 강북구 월계로 173 북서울 꿈의숲아트센터','2022-07-12 00:00:00','2022-10-10 00:00:00','성인·어린이(24개월~만64세) : 개인 7,000원, 단체 5,000원 / 65세 이상 : 3,500원 / 국가유공자(동반 1인), 무료 : 장애인 1-6급(1-3급은 동반 1인), 24개월 미만(단체 제외)',7000,'','02-399-1000','','','',127.03853560819006,37.62148751317226,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:12:19'),(215602,'옵티컬 루미너스(Optical Luminous)','http://www.culture.go.kr/upload/rdf/22/07/show_2022072015325952612.jpg','https://www.kcdf.or.kr/web/cop/exhibit/selectExhibit.do?applyNum=8518','https://www.kcdf.or.kr/web/content.do?proFn=kcdf_gallery','서울','KCDF갤러리','서울특별시 종로구 인사동11길 8 KCDF갤러리','2022-07-20 00:00:00','2022-07-25 00:00:00','무료',0,'','02-732-9382','','','',126.98411783877808,37.574003744874666,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:20:52'),(215603,'두드리다(국가무형문화재 3人 공개행사)','http://www.culture.go.kr/upload/rdf/22/07/show_2022072015353272487.jpg','https://www.kcdf.or.kr/web/cop/exhibit/selectExhibit.do?applyNum=8516','https://www.kcdf.or.kr/web/content.do?proFn=kcdf_gallery','서울','KCDF갤러리','서울특별시 종로구 인사동11길 8 KCDF갤러리','2022-07-20 00:00:00','2022-07-25 00:00:00','무료',0,'','02-732-9382','','','',126.98411783877808,37.574003744874666,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:20:52'),(215665,'물 , Floating Ego','http://www.culture.go.kr/upload/rdf/22/07/show_2022072021254382519.png','http://www.underdogmuseum.com/32','http://www.underdogmuseum.com','서울','미디어 아트 갤러리 언더독뮤지엄','서울특별시 마포구 양화로12길 8-7 지하1층','2022-07-08 00:00:00','2022-09-11 00:00:00','일반 10,000원 그 외 나이, 자격별 권종',10000,'','02-336-0423','','','',126.91796480476273,37.551647369620305,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:12:19'),(216140,'2022 시각예술지원사업 &lt;한 평의 작업실&gt;','http://www.culture.go.kr/upload/rdf/22/07/show_2022072523475455648.jpg','','https://nowonarts.kr/html/cultureeducation/culturalfacility.php','서울','경춘선숲길 갤러리','서울특별시 노원구 화랑로 612 경춘선숲길 갤러리','2022-07-19 00:00:00','2022-08-07 00:00:00','무료',0,'','02-2289-3490~3491 / 02-2289-3440','','','',127.09362451879112,37.624731751393455,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:12:19'),(216226,'이승호 : 어둡지 않은 야경을 담다','http://www.culture.go.kr/upload/rdf/22/07/show_2022072621143398033.png','https://galleryjiha.com/exhibitions/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&bmode=view&idx=12412628&t=board','http://galleryjiha.com/','서울','갤러리 지하','서울특별시 마포구 서강로11길 15 지하','2022-07-26 00:00:00','2022-08-01 00:00:00','무료',0,'','010-2970-8976','','','',126.93267494968443,37.55347218419314,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:12:19'),(216442,'[소마미술관] 드로잉 박스 2022','http://www.culture.go.kr/upload/rdf/22/07/show_2022072814395781923.png','https://soma.kspo.or.kr/dspy/display/197','https://soma.kspo.or.kr','서울','소마미술관 1관','서울특별시 송파구 올림픽로 424 소마미술관 1관','2022-08-05 00:00:00','2022-08-21 00:00:00','무료 관람',0,'','02-425-1077','','','',127.115517876627,37.5203396980951,0,0,0,'WAIT','2022-08-10 12:51:26','2022-08-10 14:12:19'),(216490,'아름다운 규방공예','http://www.culture.go.kr/upload/rdf/22/07/show_2022072911343390675.jpg','https://www.kcdf.or.kr/web/cop/exhibit/selectExhibit.do?applyNum=8096','https://www.kcdf.or.kr/web/content.do?proFn=kcdf_gallery','서울','KCDF갤러리','서울특별시 종로구 인사동11길 8 KCDF갤러리','2022-07-27 00:00:00','2022-08-01 00:00:00','무료',0,'','02-732-9382','','','',126.98411783877808,37.574003744874666,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:20:52'),(216491,'NEWFACE','http://www.culture.go.kr/upload/rdf/22/07/show_202207291136567812.jpg','https://www.kcdf.or.kr/web/cop/exhibit/selectExhibit.do?applyNum=8519','https://www.kcdf.or.kr/web/content.do?proFn=kcdf_gallery','서울','KCDF갤러리','서울특별시 종로구 인사동11길 8 KCDF갤러리','2022-07-27 00:00:00','2022-08-01 00:00:00','무료',0,'','02-732-9382','','','',126.98411783877808,37.574003744874666,0,0,0,'WAIT','2022-08-10 12:51:25','2022-08-10 14:20:52'),(216616,'두산 큐레이터 워크샵 기획전 《칼립소 Καλυψ》','http://www.culture.go.kr/upload/rdf/22/07/show_2022072915575555171.jpg','','http://www.doosangallery.com/','서울','두산갤러리','서울특별시 종로구 종로33길 15 두산아트센터 1층','2022-08-03 00:00:00','2022-08-31 00:00:00','무료',0,'','02-708-5050','','','',127.00118857756357,37.57164420037769,0,0,0,'DELETE','2022-08-10 12:51:26','2022-08-10 15:08:51'),(216702,'끝없는 이야기 An Endless Story','http://www.culture.go.kr/upload/rdf/22/07/show_2022073017522019786.png','http://hedwig-gallery.edenstore.co.kr/bbs/board.php?bo_table=exhib3&wr_id=15','http://hedwig-gallery.edenstore.co.kr/','경기','헤드비갤러리 Hedwig gallery','경기 성남시 분당구 운중로146번길 13 1층 헤드비갤러리','2022-08-09 00:00:00','2022-09-08 00:00:00','무료',0,'','031-629-9998','','','',127.08010908831922,37.390642655724804,0,0,0,'WAIT','2022-08-10 12:51:26','2022-08-10 14:12:19'),(216825,'마을교육 공동체 전시- 우리 동네 하천 이야기','http://www.culture.go.kr/upload/rdf/22/08/show_20220821051231344.jpg','https://www.ilec.go.kr/performance/exhibit_reserve.asp?page=v&idx=488','https://www.ilec.go.kr/','인천','인천광역시교육청평생학습관','인천광역시 연수구 경원대로 73 인천광역시교육청평생학습관','2022-08-09 00:00:00','2022-08-18 00:00:00','무료',0,'','032)899-1516','','','',126.67208557141,37.3983025881861,0,0,0,'WAIT','2022-08-10 12:51:26','2022-08-10 14:12:19'),(216826,'인천서예연구회, 서예술, 그 옛 법과 새로움 비교','http://www.culture.go.kr/upload/rdf/22/08/show_202208021041926509.jpg','https://www.ilec.go.kr/performance/exhibit_reserve.asp?page=v&idx=490','https://www.ilec.go.kr/','인천','인천광역시교육청평생학습관','인천광역시 연수구 경원대로 73 인천광역시교육청평생학습관','2022-08-24 00:00:00','2022-08-31 00:00:00','무료',0,'','032)899-1516','','','',126.67208557141,37.3983025881861,0,0,0,'WAIT','2022-08-10 12:51:26','2022-08-10 14:12:19'),(216921,'정운자, 물로 쓴 시','http://www.culture.go.kr/upload/rdf/22/08/show_202208021023272306.jpg','https://www.ilec.go.kr/performance/exhibit_reserve.asp?page=v&idx=489','https://www.ilec.go.kr/','인천','인천광역시교육청평생학습관','인천광역시 연수구 경원대로 73 인천광역시교육청평생학습관','2022-08-09 00:00:00','2022-08-18 00:00:00','무료',0,'','032)899-1516','','','',126.67208557141,37.3983025881861,0,0,0,'WAIT','2022-08-10 12:51:26','2022-08-10 14:12:19'),(217034,'제17회 전국 장애인 도예 공모전','http://www.culture.go.kr/upload/rdf/22/08/show_2022080310472720863.png','https://www.kcdf.or.kr/web/cop/exhibit/selectExhibit.do?applyNum=8523','https://www.kcdf.or.kr/web/content.do?proFn=kcdf_gallery','서울','KCDF갤러리','서울특별시 종로구 인사동11길 8 KCDF갤러리','2022-08-03 00:00:00','2022-08-08 00:00:00','무료',0,'','02-732-9382','','','',126.98411783877808,37.574003744874666,0,0,0,'WAIT','2022-08-10 12:51:26','2022-08-10 14:20:52'),(217035,'( )t part2','http://www.culture.go.kr/upload/rdf/22/08/show_202208031049858827.jpg','https://www.kcdf.or.kr/web/cop/exhibit/selectExhibit.do?applyNum=8524','https://www.kcdf.or.kr/web/content.do?proFn=kcdf_gallery','서울','KCDF갤러리','서울특별시 종로구 인사동11길 8 KCDF갤러리','2022-08-03 00:00:00','2022-08-08 00:00:00','무료',0,'','02-732-9382','','','',126.98411783877808,37.574003744874666,0,0,0,'WAIT','2022-08-10 12:51:26','2022-08-10 14:20:52'),(217300,'Multi Complex Culture Co. Owell Pop-up Store & Exhibition','http://www.culture.go.kr/upload/rdf/22/08/show_2022080417124481965.jpg','https://galleryjiha.com/exhibitions/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&bmode=view&idx=12517441&t=board','http://galleryjiha.com/','서울','갤러리 지하','서울특별시 마포구 서강로11길 15 지하','2022-08-05 00:00:00','2022-08-09 00:00:00','-',0,'','010-2970-8976','','','',126.93267494968443,37.55347218419314,0,0,0,'WAIT','2022-08-10 12:51:26','2022-08-10 13:53:46'),(217601,'2022 Sea&Museum  바다와 미술관','http://www.culture.go.kr/upload/rdf/22/08/show_2022080616374174423.jpg','http://lkh-artmuseum.com','http://www.lkh-artmuseum.com/default/','광주','이강하 미술관','광주광역시 남구 3·1만세운동길 6 이강하 미술관','2022-08-09 00:00:00','2022-10-30 00:00:00','무료',0,'','062.674.8515','','','',126.91562051289922,35.13688577785184,0,0,0,'WAIT','2022-08-10 12:51:26','2022-08-10 14:12:19'),(217842,'My Muse','http://www.culture.go.kr/upload/rdf/22/08/show_202208091224709541.jpg','http://www.urbanpluto.com/?p=3275','http://www.urbanpluto.com','서울','어반플루토','서울특별시 영등포구 양평로22나길 3-2 어반플루토','2022-08-30 00:00:00','2022-09-04 00:00:00','무료관람',0,'','02-2633-1343','','','',126.89400275559309,37.538822844729516,0,0,0,'WAIT','2022-08-10 12:51:26','2022-08-10 14:12:19');
/*!40000 ALTER TABLE `exhbn` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `FK_note_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notelike`
--

DROP TABLE IF EXISTS `notelike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notelike` (
  `noteId` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(50) NOT NULL,
  KEY `noteId` (`noteId`),
  KEY `userId` (`userId`),
  CONSTRAINT `notelike_ibfk_1` FOREIGN KEY (`noteId`) REFERENCES `note` (`noteId`) ON DELETE CASCADE,
  CONSTRAINT `notelike_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notelike`
--

LOCK TABLES `notelike` WRITE;
/*!40000 ALTER TABLE `notelike` DISABLE KEYS */;
/*!40000 ALTER TABLE `notelike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewcomment`
--

DROP TABLE IF EXISTS `reviewcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewcomment` (
  `reviewCommentId` int NOT NULL AUTO_INCREMENT,
  `reviewNoteId` int NOT NULL,
  `userId` varchar(50) NOT NULL,
  `reviewPageViewState` varchar(50) DEFAULT 'POST',
  `reviewComment` text,
  `reviewCommentLike` int DEFAULT '0',
  `reviewCommentCreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `reviewCommentUpdatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reviewCommentId`),
  KEY `userId` (`userId`),
  KEY `reviewNoteId` (`reviewNoteId`),
  CONSTRAINT `FK_reviewComment_reviewNote` FOREIGN KEY (`reviewNoteId`) REFERENCES `reviewnote` (`reviewNoteId`) ON DELETE CASCADE,
  CONSTRAINT `FK_reviewComment_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewcomment`
--

LOCK TABLES `reviewcomment` WRITE;
/*!40000 ALTER TABLE `reviewcomment` DISABLE KEYS */;
INSERT INTO `reviewcomment` VALUES (1,1,'user','POST','유용한 정보네요',0,'2022-09-02 04:49:38','2022-09-02 04:49:38');
/*!40000 ALTER TABLE `reviewcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewnote`
--

DROP TABLE IF EXISTS `reviewnote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewnote` (
  `reviewNoteId` int NOT NULL AUTO_INCREMENT,
  `reviewNoteTitle` varchar(150) DEFAULT NULL,
  `reviewNote` longtext,
  `reviewNoteLike` int DEFAULT '0',
  `reviewNoteCommentNum` int DEFAULT '0',
  `reviewNoteCreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `reviewPageViewState` varchar(50) DEFAULT 'POST',
  `courseId` int DEFAULT NULL,
  `userId` varchar(20) NOT NULL,
  `exhbnId` int DEFAULT NULL,
  PRIMARY KEY (`reviewNoteId`),
  KEY `courseId` (`courseId`),
  KEY `userId` (`userId`),
  KEY `exhbnId` (`exhbnId`),
  CONSTRAINT `FK_reviewNote_course` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`) ON DELETE CASCADE,
  CONSTRAINT `FK_reviewNote_exhbn` FOREIGN KEY (`exhbnId`) REFERENCES `exhbn` (`exhbnId`),
  CONSTRAINT `FK_reviewNote_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewnote`
--

LOCK TABLES `reviewnote` WRITE;
/*!40000 ALTER TABLE `reviewnote` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviewnote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` varchar(20) NOT NULL,
  `userPw` varchar(100) NOT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `userEmail` varchar(50) NOT NULL,
  `userNickname` varchar(50) DEFAULT NULL,
  `userGender` varchar(1) NOT NULL,
  `userBirth` date NOT NULL,
  `userRoll` varchar(10) DEFAULT 'USER',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userState` varchar(50) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('sangjong','$2a$10$aDVD6uxBlmaY2g0TBTR0MORVNp4Rg5I9a0iDpAdLNij86wdABhdry','최상종','user@enaver.com','csj1026','M','1996-10-26','USER','2022-08-18 14:45:50','2022-08-18 14:45:50','1'),('user','$2a$10$aDVD6uxBlmaY2g0TBTR0MORVNp4Rg5I9a0iDpAdLNij86wdABhdry','테스트','user@gmail.com','테스트계정','M','2000-10-22','USER','2022-08-14 14:45:50','2022-08-14 14:45:50','1'),('user2','$2a$10$aDVD6uxBlmaY2g0TBTR0MORVNp4Rg5I9a0iDpAdLNij86wdABhdry','테스트2','user@kakao.com','테스트계정2','F','1998-05-02','USER','2022-08-15 14:45:50','2022-08-16 14:45:50','1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-16  9:39:40
