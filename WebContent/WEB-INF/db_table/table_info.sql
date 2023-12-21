create database adventour;
use adventour;

--member 테이블 create문
create table member(m_id varchar(20) not null,
m_pw varchar(20) not null,
m_lastname varchar(20) not null,
m_firstname varchar(20) not null,
m_nickname varchar(10),
m_postcode varchar(50) not null,
m_addr1 varchar(50) not null,
m_addr2 varchar(50) not null,
m_pnum1 varchar(11) not null,
m_pnum2 varchar(11),
m_email varchar(100) not null,
m_birth_y varchar(4),
m_birth_m varchar(2),
m_birth_d varchar(2),
m_gender varchar(1),
m_agree varchar(1),
primary key(m_id));

--qna테이블 create문
create table qna(q_num int AUTO_INCREMENT primary key,
m_id varchar(20) not null,
q_title varchar(30) not null,
q_cntt varchar(250) not null,
q_date DATETIME DEFAULT CURRENT_TIMESTAMP not null,
FOREIGN KEY (m_id) REFERENCES member(m_id) ON DELETE CASCADE);



--확인용 회원가입 insert문
INSERT INTO `adventour`.`member` (`m_id`, `m_pw`, `m_lastname`, `m_firstname`, `m_nickname`, `m_postcode`, `m_addr1`, `m_addr2`, `m_pnum1`, `m_pnum2`, `m_email`, `m_birth_y`, `m_birth_m`, `m_birth_d`, `m_gender`, `m_agree`) VALUES ('qwer', 'qwer12', '김', '요요', '요요쓰', '12345', '사울', '강남구', '01012341234', '01012341234', '1234@naver.com', '2000', '01', '01', 'f', 'y');
INSERT INTO `adventour`.`member` (`m_id`, `m_pw`, `m_lastname`, `m_firstname`, `m_nickname`, `m_postcode`, `m_addr1`, `m_addr2`, `m_pnum1`, `m_pnum2`, `m_email`, `m_birth_y`, `m_birth_m`, `m_birth_d`, `m_gender`, `m_agree`) VALUES ('asdf', 'asdf12', '김', '야야', '야야쓰', '12345', '경기도', '성남시', '01023452345', '01023452345', '2345@naver.com', '2001', '02', '02', 'f', 'y');
INSERT INTO `adventour`.`member` (`m_id`, `m_pw`, `m_lastname`, `m_firstname`, `m_nickname`, `m_postcode`, `m_addr1`, `m_addr2`, `m_pnum1`, `m_pnum2`, `m_email`, `m_birth_y`, `m_birth_m`, `m_birth_d`, `m_gender`, `m_agree`) VALUES ('zxcv', 'zxcv12', '김', '여여', '여여쓰', '12345', '서울', '서초구', '01034563456', '01034563456', '3456@naver.com', '2002', '03', '03', 'f', 'y');
INSERT INTO `adventour`.`member` (`m_id`, `m_pw`, `m_lastname`, `m_firstname`, `m_nickname`, `m_postcode`, `m_addr1`, `m_addr2`, `m_pnum1`, `m_pnum2`, `m_email`, `m_birth_y`, `m_birth_m`, `m_birth_d`, `m_gender`, `m_agree`) VALUES ('wert', 'wert12', '김', '아아', '아아쓰', '12345', '경기도', '광주시', '01045674567', '01045674567', '4567@naver.com', '2003', '04', '04', 'f', 'y');
INSERT INTO `adventour`.`member` (`m_id`, `m_pw`, `m_lastname`, `m_firstname`, `m_nickname`, `m_postcode`, `m_addr1`, `m_addr2`, `m_pnum1`, `m_pnum2`, `m_email`, `m_birth_y`, `m_birth_m`, `m_birth_d`, `m_gender`, `m_agree`) VALUES ('sdfg', 'sdfg12', '김', '어어', '어어쓰', '12345', '서울', '강북구', '01056785678', '01056785678', '5678@naver.com', '2004', '05', '05', 'f', 'y');

----호텔 정보 h_hotel 테이블 create문

CREATE TABLE `h_hotel` (
  `country_eng` varchar(30) NOT NULL,
  `country_ko` varchar(30) NOT NULL,
  `city_eng` varchar(30) NOT NULL,
  `city_ko` varchar(30) NOT NULL,
  `h_name_eng` varchar(50) NOT NULL,
  `h_name_ko` varchar(50) NOT NULL,
  `h_grade` varchar(1) NOT NULL,
  `h_addr` varchar(150) NOT NULL,
  `h_lat` varchar(11) NOT NULL,
  `h_lon` varchar(11) NOT NULL,
  `h_pho` varchar(150) NOT NULL,
  `h_breakfast` varchar(1) NOT NULL,
  `h_pool` varchar(1) NOT NULL,
  `h_rooftop` varchar(1) NOT NULL,
  `h_tel` varchar(15) NOT NULL,
  PRIMARY KEY (`h_name_eng`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--------h_hotel 컬럼 추가------
ALTER TABLE `adventour`.`h_hotel` 
ADD COLUMN `h_pho1` VARCHAR(150) NOT NULL AFTER `h_tel`,
ADD COLUMN `h_pho2` VARCHAR(150) NOT NULL AFTER `h_pho1`,
ADD COLUMN `h_pho3` VARCHAR(150) NOT NULL AFTER `h_pho2`,
ADD COLUMN `h_pho4` VARCHAR(150) NOT NULL AFTER `h_pho3`,
ADD COLUMN `h_pho5` VARCHAR(150) NOT NULL AFTER `h_pho4`,
ADD COLUMN `h_pho6` VARCHAR(150) NOT NULL AFTER `h_pho5`;
---------h_hotel 사진 추가 -------
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_atolon1.PNG', `h_pho2` = 'h_atolon2.PNG', `h_pho3` = 'h_atolon3.PNG', `h_pho4` = 'h_atolon4.PNG', `h_pho5` = 'h_atolon5.PNG', `h_pho6` = 'h_atolon6.PNG' WHERE (`h_name_eng` = 'atolon park hotel');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_eurostars1.PNG', `h_pho2` = 'h_eurostars2.PNG', `h_pho3` = 'h_eurostars3.PNG', `h_pho4` = 'h_eurostars4.PNG', `h_pho5` = 'h_eurostars5.PNG', `h_pho6` = 'h_eurostars6.PNG' WHERE (`h_name_eng` = 'eurostars madrid tower');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_harddays1.PNG', `h_pho2` = 'h_harddays.2PNG', `h_pho3` = 'h_harddays3.PNG', `h_pho4` = 'h_harddays4.PNG', `h_pho5` = 'h_harddays5.PNG', `h_pho6` = 'h_harddays6.PNG' WHERE (`h_name_eng` = 'hard days night  hotel');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_hilton1.PNG', `h_pho2` = 'h_hilton2.PNG', `h_pho3` = 'h_hilton3.PNG', `h_pho4` = 'h_hilton4.PNG', `h_pho5` = 'h_hilton5.PNG', `h_pho6` = 'h_hilton6.PNG' WHERE (`h_name_eng` = 'hilton garden inn sevilla');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_pont1.PNG', `h_pho2` = 'h_pont2.PNG', `h_pho3` = 'h_pont3.PNG', `h_pho4` = 'h_pont4.PNG', `h_pho5` = 'h_pont5.PNG', `h_pho6` = 'h_pont6.PNG' WHERE (`h_name_eng` = 'hotel au petit pont');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_sants1.PNG', `h_pho2` = 'h_sants2.PNG', `h_pho3` = 'h_sants3.PNG', `h_pho4` = 'h_sants4.PNG', `h_pho5` = 'h_sants5.PNG', `h_pho6` = 'h_sants6.PNG' WHERE (`h_name_eng` = 'hotel barcelo sants');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_universal1.PNG', `h_pho2` = 'h_universal2.PNG', `h_pho3` = 'h_universal3.PNG', `h_pho4` = 'h_universal4.PNG', `h_pho5` = 'h_universal5.PNG', `h_pho6` = 'h_universal6.PNG' WHERE (`h_name_eng` = 'hotel barcelona universal');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_hotel berna1.PNG', `h_pho2` = 'h_hotel berna2.PNG', `h_pho3` = 'h_hotel berna3.PNG', `h_pho4` = 'h_hotel berna4.PNG', `h_pho5` = 'h_hotel berna5.PNG', `h_pho6` = 'h_hotel berna6.PNG' WHERE (`h_name_eng` = 'hotel berna');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_boston1.PNG', `h_pho2` = 'h_boston2.PNG', `h_pho3` = 'h_boston3.PNG', `h_pho4` = 'h_boston4.PNG', `h_pho5` = 'h_boston5.PNG', `h_pho6` = 'h_boston6.PNG' WHERE (`h_name_eng` = 'hotel boston');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_celio1.PNG', `h_pho2` = 'h_celio2.PNG', `h_pho3` = 'h_celio3.PNG', `h_pho4` = 'h_celio4.PNG', `h_pho5` = 'h_celio5.PNG', `h_pho6` = 'h_celio6.PNG' WHERE (`h_name_eng` = 'hotel celio roma');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_ NH collection1.PNG', `h_pho2` = 'h_ NH collection2.PNG', `h_pho3` = 'h_ NH collection3.PNG', `h_pho4` = 'h_ NH collection4.PNG', `h_pho5` = 'h_ NH collection5.PNG', `h_pho6` = 'h_ NH collection6.PNG' WHERE (`h_name_eng` = 'hotel NH collection sevilla');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_novotelmonte1.PNG', `h_pho2` = 'h_novotelmonte2.PNG', `h_pho3` = 'h_novotelmonte3.PNG', `h_pho4` = 'h_novotelmonte4.PNG', `h_pho5` = 'h_novotelmonte5.PNG', `h_pho6` = 'h_novotelmonte6.PNG' WHERE (`h_name_eng` = 'hotel novotel monte carlo');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_olympia1.PNG', `h_pho2` = 'h_olympia2.PNG', `h_pho3` = 'h_olympia3.PNG', `h_pho4` = 'h_olympia4.PNG', `h_pho5` = 'h_olympia5.PNG', `h_pho6` = 'h_olympia6.PNG' WHERE (`h_name_eng` = 'hotel olympia');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_rialto1.PNG', `h_pho2` = 'h_rialto2.PNG', `h_pho3` = 'h_rialto3.PNG', `h_pho4` = 'h_rialto4.PNG', `h_pho5` = 'h_rialto5.PNG', `h_pho6` = 'h_rialto6.PNG' WHERE (`h_name_eng` = 'hotel rialto');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_santo1.PNG', `h_pho2` = 'h_santo2.PNG', `h_pho3` = 'h_santo3.PNG', `h_pho4` = 'h_santo4.PNG', `h_pho5` = 'h_santo5.PNG', `h_pho6` = 'h_santo6.PNG' WHERE (`h_name_eng` = 'hotel santo domingo madrid');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_imperial1.PNG', `h_pho2` = 'h_imperial2.PNG', `h_pho3` = 'h_imperial3.PNG', `h_pho4` = 'h_imperial4.PNG', `h_pho5` = 'h_imperial5.PNG', `h_pho6` = 'h_imperial6.PNG' WHERE (`h_name_eng` = 'imperial rooms');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_novotel_eden1.PNG', `h_pho2` = 'h_novotel_eden2.PNG', `h_pho3` = 'h_novotel_eden3.PNG', `h_pho4` = 'h_novotel_eden4.PNG', `h_pho5` = 'h_novotel_eden5.PNG', `h_pho6` = 'h_novotel_eden6.PNG' WHERE (`h_name_eng` = 'novotel edinburgh center');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_novotelparis1.PNG', `h_pho2` = 'h_novotelparis2.PNG', `h_pho3` = 'h_novotelparis3.PNG', `h_pho4` = 'h_novotelparis4.PNG', `h_pho5` = 'h_novotelparis5.PNG', `h_pho6` = 'h_novotelparis6.PNG' WHERE (`h_name_eng` = 'novotel paris centre tour ');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_parkplaza1.PNG', `h_pho2` = 'h_parkplaza2.PNG', `h_pho3` = 'h_parkplaza3.PNG', `h_pho4` = 'h_parkplaza4.PNG', `h_pho5` = 'h_parkplaza5.PNG', `h_pho6` = 'h_parkplaza6.PNG' WHERE (`h_name_eng` = 'parkplaza hotel');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_smart hotel.1PNG', `h_pho2` = 'h_smart hotel2.PNG', `h_pho3` = 'h_smart hotel3.PNG', `h_pho4` = 'h_smart hotel4.PNG', `h_pho5` = 'h_smart hotel5.PNG', `h_pho6` = 'h_smart hotel6.PNG' WHERE (`h_name_eng` = 'smart hotel holiday');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_masion1.PNG', `h_pho2` = 'h_masion2.PNG', `h_pho3` = 'h_masion3.PNG', `h_pho4` = 'h_masion4.PNG', `h_pho5` = 'h_masion5.PNG', `h_pho6` = 'h_masion6.PNG' WHERE (`h_name_eng` = 'the originals boutique, hotel maison montmartre');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_thetower1.PNG', `h_pho2` = 'h_thetower2.PNG', `h_pho3` = 'h_thetower3.PNG', `h_pho4` = 'h_thetower4.PNG', `h_pho5` = 'h_thetower5.PNG', `h_pho6` = 'h_thetower6.PNG' WHERE (`h_name_eng` = 'the tower hotel');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_thevillage1.PNG', `h_pho2` = 'h_thevillage2.PNG', `h_pho3` = 'h_thevillage3.PNG', `h_pho4` = 'h_thevillage4.PNG', `h_pho5` = 'h_thevillage5.PNG', `h_pho6` = 'h_thevillage6.PNG' WHERE (`h_name_eng` = 'the villiage hotel');
UPDATE `adventour`.`h_hotel` SET `h_pho1` = 'h_titanic1.PNG', `h_pho2` = 'h_titanic2.PNG', `h_pho3` = 'h_titanic3.PNG', `h_pho4` = 'h_titanic4.PNG', `h_pho5` = 'h_titanic5.PNG', `h_pho6` = 'h_titanic6.PNG' WHERE (`h_name_eng` = 'titanic hotel liverpool');


--------호텔 정보 insert문
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('uk', '영국', 'london', '런던', 'parkplaza', '파크플라자', '4', '200 Westminster Bridge Rd', '51.5010106', '-0.1169471', 'h_parkplaza', 'y', 'y', 'y', '0');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('uk', '영국', 'london', '런던', 'the tower', '더 타워', '4', 'St Katharine\'s Way, London E1W 1LD ', '51.5067938', '-0.0739672', 'h_thetower.PNG', 'y', 'y',  'y', '0');
UPDATE `adventour`.`h_hotel` SET `h_pho` = 'h_parkplaza.PNG' WHERE (`h_name_eng` = 'parkplaza');
UPDATE `adventour`.`h_hotel` SET `h_pho` = 'h_thetower.PNG' WHERE (`h_name_eng` = 'the tower');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('uk', '영국', 'liverpool', '리버풀', 'hard days night  hotel', '하드 데이즈 나이트 호텔', '4', 'Central Buildings, N John St, Liverpool L2 6RR ', '53.4060505', '-2.9881734', 'h_harddays.PNG', 'y', 'y', 'y', '+441512361964');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('uk', '영국', 'liverpool', '리버풀', 'titanic hotel liverpool', '타이타닉 호텔 리버풀', '4', 'Stanley Dock, Regent Rd, Liverpool L3 0AN ', '53.4221038', '-2.9985748', 'h_titanic.PNG', 'y', 'y', 'y', '0');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('uk', '영국', 'edinburgh', '에든버러', 'the villiage hotel', '더 빌리지 호텔 에든버러', '4', '140 Crewe Rd S, Edinburgh EH4 2NY', '55.967804', '-3.2345368', 'h_thevillage', 'y', 'y', 'y', '0');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('uk', '영국', 'edinburgh', '에든버러', 'novotel edinburgh center', '노보텔 에든버러 센터', '4', '80 Lauriston Pl, Edinburgh EH3 9DE ', '55.94505', '-3.199782', 'h_novotel_eden.PNG', 'y', 'y', 'y', '+441316563500');
UPDATE `adventour`.`h_hotel` SET `h_name_eng` = 'parkplaza hotel', `h_name_ko` = '파크플라자 호텔' WHERE (`h_name_eng` = 'parkplaza');
UPDATE `adventour`.`h_hotel` SET `h_name_eng` = 'the tower hotel', `h_name_ko` = '더 타워 호텔' WHERE (`h_name_eng` = 'the tower');

INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('italy', '이탈리아', 'rome', '로마', 'imperial rooms', '임페리얼룸스', '3', 'Via di S. Giovanni in Laterano, 10, 00184 Roma RM', '41.8899259', '12.494457', 'h_imperial.PNG', 'y', 'y', 'y', '+390697996832');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('italy', '이탈리아', 'rome', '로마', 'hotel celio roma', '호텔 첼리오 로마', '3', 'Via dei SS. Quattro, 35C, 00184 Roma RM', '41.8890452', '12.4955628', 'h_celio.PNG', 'y', 'y', 'y', '0');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('italy', '이탈리아', 'venice', '베네치아', 'hotel rialto', '호텔 리알토', '3', 'Riva del Ferro, 5149, 30124 Venezia VE', '45.4376634', '12.3361107', 'h_rialto.PNG', 'y', 'y', 'y', '+390415209166');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('italy', '이탈리아', 'venice', '베네치아', 'smart hotel holiday', '스마트 호텔 홀리데이', '4', 'Via dell\'Essiccatoio, 38, 30173 Venezia VE', '45.504727', '12.2708102', 'h_smart hotel.PNG', 'y', 'y', 'y', '+39041611088');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('italy', '이탈리아', 'milano', '밀라노', 'hotel berna', '호텔 베르나', '4', 'Via Napo Torriani, 18, 20124 Milano MI', '45.4827339', '9.2033686', 'h_hotel berna.PNG', 'y', 'y', 'y', '+3902677311');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('italy', '이탈리아', 'milano', '밀라노', 'hotel boston', '호텔 보스턴', '4', 'Via Roberto Lepetit, 7, 20124 Milano MI', '45.4825416', '9.2035671', 'h_boston.PNG', 'y', 'y', 'y', '+39026692636');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('france', '프랑스', 'psris', '파리', 'the originals boutique, hotel maison montmartre', '더 오리지널스 부티끄 호텔  메종 몽마르트', '4', '32 Av. de la Prte de Montmartre, 75018 Paris,', '48.9003969', '2.3360559', 'h_masion.PNG', 'y', 'n', 'n', '+33183755151');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('france', '프랑스', 'psris', '파리', 'novotel paris centre tour ', '노보텔 파리 센터 투어', '4', '61 Quai de Grenelle, 75015 Paris', '48.8498976', '2.2831449', 'h_novotelparis.PNG', 'y', 'y', 'y', '+33140582000');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('france', '프랑스', 'marseille', '마르세유', 'atolon park hotel', '아톨론 파크 호텔', '3', '5 Rue d\'Oslo, 67170 Bernolsheim', '48.7481939', '7.6783141', 'h_atolon.PNG', 'y', 'n', 'n', '+33367290239');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('france', '프랑스', 'marseille', '마르세유', 'hotel au petit pont', '호텔 오 프티 퐁', '3', '1 Quai des Bateliers, 67610 La Wantzenau', '48.6549131', '7.8319186', 'h_pont.PNG', 'y', 'n', 'n', '+33631342093');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('france', '프랑스', 'monaco', '모나코', 'hotel novotel monte carlo', '호텔 노보텔 몬테카를로', '3', '16 Bd Princesse Charlotte, 98000 Monaco', '43.7389167', '7.4217026', 'h_novotelmonte.PNG', 'y', 'y', 'y', '+37799998300');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('france', '프랑스', 'monaco', '모나코', 'hotel olympia', '호텔 올림피아', '3', '17 bis Bd du General Leclerc, 06240 Beausoleil', '43.7431554', '7.4267573', 'h_olympia.PNG', 'y', 'n', 'n', '+33493781270');

INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('spain', '스페인', 'madrid', '마드리드', 'hotel santo domingo madrid', '호텔 산토 도밍고', '4', 'C. de San Bernardo, 1, 28013 Madrid', '40.4206442', '-3.7086409', 'h_santo.PNG', 'y', 'y', 'y', '+34915479800');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('spain', '스페인', 'madrid', '마드리드', 'eurostars madrid tower', '유로스타 마드리드 타워', '5', 'P.º de la Castellana, 259, B, 28046 Madrid', '40.4766616', '-3.6878227', 'h_eurostars.PNG', 'y', 'y', 'y', '+34913342700');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('spain', '스페인', 'barcelona', '바르셀로나', 'hotel barcelo sants', '바르셀로 산츠', '4', 'Pl. dels Països Catalans, s/n, 08014 Barcelona', '41.3790888', '2.1388857', 'h_sants.PNG', 'y', 'y', 'y', '+34935035300');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('spain', '스페인', 'barcelona', '바르셀로나', 'hotel barcelona universal', '바르셀로나 유니버셜 호텔', '4', 'Av. del Paral·lel, 76-80, 08001 Barcelona', '41.3752413', '2.1680881', 'h_universal.PNG', 'y', 'y', 'y', '+34935677447');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('spain', '스페인', 'sevilla', '세비야', 'hotel NH collection sevilla', 'NH 콜렉션 세비야', '4', 'Av. de Diego Martínez Barrio, 8, 41013 Sevilla', '37.3749337', '-5.9763778', 'h_ NH collection.PNG', 'y', 'y', 'y', '+34954548500');
INSERT INTO `adventour`.`h_hotel` (`country_eng`, `country_ko`, `city_eng`, `city_ko`, `h_name_eng`, `h_name_ko`, `h_grade`, `h_addr`, `h_lat`, `h_lon`, `h_pho`, `h_breakfast`, `h_pool`, `h_rooftop`, `h_tel`) VALUES ('spain', '스페인', 'sevilla', '세비야', 'hilton garden inn sevilla', '힐튼 가든 인 세비야', '4', 'Torneo Parque Empresarial, Av Ingeniería, 11, 41015 Sevilla', '37.4274177', '-5.97182', 'h_hilton.PNG', 'y', 'y', 'y', '+34955054054');


--------호텔 룸정보 h_room create문 ----->내용이 너무 많아서 csv 파일로 insert
 CREATE TABLE `h_room` (
  `h_name_eng` varchar(50) NOT NULL,
  `h_roomtype` varchar(10) NOT NULL,
  `h_roompeo` int(11) NOT NULL,
  `h_roomnum` varchar(30) NOT NULL,
  `h_roompri` int(11) NOT NULL,
  `h_room_bed` varchar(10) NOT NULL,
  `h_room_bedc` int(11) NOT NULL,
  `h_room_breakfast` varchar(10) NOT NULL,
  `h_room_cancel` varchar(10) NOT NULL,
  `h_room_window` varchar(10) NOT NULL,
  `h_room_smoke` varchar(10) NOT NULL,
  `h_room_paynow` varchar(10) NOT NULL,
  `h_room_intime` varchar(45) NOT NULL,
  `h_room_outime` varchar(45) NOT NULL,
  PRIMARY KEY (`h_roomnum`),
  KEY `h_name_eng_idx` (`h_name_eng`),
  CONSTRAINT `h_name_eng` FOREIGN KEY (`h_name_eng`) REFERENCES `h_hotel` (`h_name_eng`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-------- 호텔 room 추가----------------
ALTER TABLE `adventour`.`h_room` 
ADD COLUMN `h_roompho` VARCHAR(45) NOT NULL AFTER `h_room_outime`;
    
 ----- 호텔 예약 확인용 테이블 생성 h_reserv create문


CREATE TABLE `adventour`.`h_reserve` (
    `h_tinum` VARCHAR(20) NOT NULL,
    `h_roomnum` VARCHAR(30) NOT NULL,
    `m_id` VARCHAR(20) NOT NULL,
    `h_room_user` INT NOT NULL,
    `h_total_price` INT NOT NULL,
    `h_indate` DATE NOT NULL,
    `h_outdate` DATE NOT NULL,
    PRIMARY KEY (`h_tinum`)
); 

--오류 때문에 fk 따로추가1
ALTER TABLE `adventour`.`h_reserve`
ADD CONSTRAINT `h_roomnum`
  FOREIGN KEY (`h_roomnum`)
  REFERENCES `adventour`.`h_room` (`h_roomnum`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

--오류 때문에 fk 따로추가2
ALTER TABLE `adventour`.`h_reserve` 
CHANGE COLUMN `m_id` `h_m_id` VARCHAR(20) NOT NULL ;
ALTER TABLE `adventour`.`h_reserve` 
ADD CONSTRAINT `h_m_id`
  FOREIGN KEY (`h_m_id`)
  REFERENCES `adventour`.`member` (`m_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


-----------------------------예약 번호 insert--------------------------------------------
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `h_m_id`, `h_room_user`, `h_total_price`, `h_indate`, `h_outdate`) VALUES ('20231001Hpont101', 'pont101', 'qwer', '4', '100000', '2023-10-01', '2023-10-02');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `h_m_id`, `h_room_user`, `h_total_price`, `h_indate`, `h_outdate`) VALUES ('20231003Hpont102', 'pont101', 'qwer', '3', '100000', '2023-10-03', '2023-10-04');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `h_m_id`, `h_room_user`, `h_total_price`, `h_indate`, `h_outdate`) VALUES ('20231005Hpont205', 'pont205', 'qwer', '2', '200000', '2023-10-05', '2023-10-06');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `h_m_id`, `h_room_user`, `h_total_price`, `h_indate`, `h_outdate`) VALUES ('20231001Hatolon209', 'atolon209', 'asdf', '2', '200000', '2023-10-01', '2023-10-02');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `h_m_id`, `h_room_user`, `h_total_price`, `h_indate`, `h_outdate`) VALUES ('20231002Hatolon210', 'atolon209', 'asdf', '2', '200000', '2023-10-02', '2023-10-03');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `h_m_id`, `h_room_user`, `h_total_price`, `h_indate`, `h_outdate`) VALUES ('20231001H novotel m106', ' novotel m106', 'zxcv', '2', '100000', '2023-10-01', '2023-10-02');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `h_m_id`, `h_room_user`, `h_total_price`, `h_indate`, `h_outdate`) VALUES ('20231001Holympia210', 'olympia210', 'asdf', '2', '200000', '2023-10-01', '2023-10-02');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `h_m_id`, `h_room_user`, `h_total_price`, `h_indate`, `h_outdate`) VALUES ('20231001Hmaison207', 'maison207', 'qwer', '2', '200000', '2023-10-01', '2023-10-02');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `h_m_id`, `h_room_user`, `h_total_price`, `h_indate`, `h_outdate`) VALUES ('20231001Hberna205', 'berna205', 'wert', '2', '200000', '2023-10-01', '2023-10-02');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `h_m_id`, `h_room_user`, `h_total_price`, `h_indate`, `h_outdate`) VALUES ('20231001Hboston107', 'boston107', 'sdfg', '2', '130000', '2023-10-01', '2023-10-02');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `h_m_id`, `h_room_user`, `h_total_price`, `h_indate`, `h_outdate`) VALUES ('20231001Htitanic210', 'titanic210', 'sdfg', '2', '200000', '2023-10-01', '2023-10-02');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `h_m_id`, `h_room_user`, `h_total_price`, `h_indate`, `h_outdate`) VALUES ('20231001Hvilliage105', 'villiage105', 'qwer', '2', '130000', '2023-10-01', '2023-10-02');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `h_m_id`, `h_room_user`, `h_total_price`, `h_indate`, `h_outdate`) VALUES ('20231001Hparkplaza203', 'parkplaza203', 'asdf', '2', '200000', '2023-10-01', '2023-10-02');
INSERT INTO `adventour`.`h_reserve` (`h_tinum`, `h_roomnum`, `h_m_id`, `h_room_user`, `h_total_price`, `h_indate`, `h_outdate`) VALUES ('20231001Hhard207', 'hard207', 'zxcv', '2', '200000', '2023-10-01', '2023-10-02');


-----------연습용 호텔 투어 패키지 creatre문
 CREATE TABLE `adventour`.`packages` (
      `h_name_eng` VARCHAR(50) NOT NULL,
       `tour_id` VARCHAR(50) NOT NULL,
       `p_name_eng` VARCHAR(50) NOT NULL,
       `p_name_ko` VARCHAR(50) NOT NULL,
       `p_price` INT NOT NULL,
       `p_title1` VARCHAR(20) NOT NULL,
       `p_title2` VARCHAR(20) NOT NULL,
       `p_pho` VARCHAR(100) NOT NULL,
       PRIMARY KEY (`p_name_eng`));

INSERT INTO `adventour`.`packages` (`h_name_eng`, `tour_id`, `p_name_eng`, `p_name_ko`, `p_price`, `p_title1`, `p_title2`, `p_pho`) VALUES ('parkplaza hotel', 'bridge tour', 'london hotel + bridge tour ', '런던 호텔 + 브릿지 투어', '349000', '조명이 가득한 브릿지투어와', '편안한 호텔을 함께 즐겨보세요.', 'pack1.jpeg');
INSERT INTO `adventour`.`packages` (`h_name_eng`, `tour_id`, `p_name_eng`, `p_name_ko`, `p_price`, `p_title1`, `p_title2`, `p_pho`) VALUES ('hotel celio roma', 'santelia tour', 'roma hotel + santelia tour', '로마 호텔 + 산텔리아 성당투어', '499000', '로마의 향기가 가득한 투어와', '편안한 호텔을 함께 즐겨보세요.', 'pack2.jpeg');
INSERT INTO `adventour`.`packages` (`h_name_eng`, `tour_id`, `p_name_eng`, `p_name_ko`, `p_price`, `p_title1`, `p_title2`, `p_pho`) VALUES ('novotel paris centre tour ', 'photo tour', 'paris hotel + photo tour', '파리호텔 + 에펠탑 포토 투어', '449000', '야경 맛집 에펠탑에서 인생샷과 ', '편안한 호텔을 함께 즐겨보세요.', 'pack3.jpeg');
INSERT INTO `adventour`.`packages` (`h_name_eng`, `tour_id`, `p_name_eng`, `p_name_ko`, `p_price`, `p_title1`, `p_title2`, `p_pho`) VALUES ('hotel celio roma', 'buckingham tour', 'roma hotel + buckingham tour', '로마 호텔 + 버킹엄 투어', '349000', '뷰맛집 ! 버킹엄 광장과', '편안한 호텔을 함께 즐겨보세요.', 'pack4.jpeg');



