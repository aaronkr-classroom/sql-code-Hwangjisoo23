--새로운 사본 테이블 만들어요

CREATE TABLE  과목2
	(과목번호 CHAR(4) NOT NULL PRIMARY KEY, --모든과목 번호는 4자리 제한
	이름 VARCHAR(20) NOT NULL, 
	강의실 CHAR (5) NOT NULL,
	개설학과 VARCHAR(20)  NOT NULL,
	시수 INT NOT NULL
	);


DESC 과목2; --	
SHOW CREATE 

CREATE TABLE 학생2
	(학번 CHAR(4) NOT NULL,
	이름 VARCHAR(20) NOT NULL,
	주소 VARCHAR(50) DEFAULT '미정',
	학년 INT NULL,
	성별 CHAR(1) NOT NULL,
	휴대폰번호 CHAR(13) NULL,
	PRIMARY KEY(학번),
	UNIQUE(휴대폰 번호)
	);


CREATE TABLE 수강2
	(학번 CHAR(6) NOT NULL,
	과목번호 CHAR(4) NOT NULL
	신청날짜 DATE NOT NULL,
	중간성적 INT NULL DEFAULT 0,
	기말성적 INT NULL DEFAULT 0,
	평가학점 CHAR(1) NULL, -- A,B,C,F,P
	PRIMARY KEY (학번) REFERENCES 학생2 (학번),
	FOREIGN KEY (과목번호) REFERENCES 과목2 (과목번호)
	);


INSERT INTO 과목2 SELECT * FROM 과목;
INSERT INTO 수강2 SELECT * FROM 수강;



INSERT INTO 학생2;

TABLE 수강2;
TABLE 학생2;
TABLE 과목2;

ALTER TABLE 학생2
	ADD 등록날짜 DATE NOT NULL DEFAULT '2023-10-15';

ALTER TABLE 학생2
	DROP COLUMN 등록날짜; DATE NOT NULL DEFAULT;

	CREATE TABLE 학생2
		AS SELECT * FROM 학생2;


TABLE 학생3;

DROP TABLE 학생3;

---새로운 manager 계정 만들기
SELECT current_user;

CREATE USER manager WITH PASSWORD '1234'
GRANT ALL PRIVILEGES ON DATEBASE univdb TO manager;

-- 위 드랍다운 화살표 누르고 NEW Connertion 선택
--


--뷰
DROP VIEW IF EXISTS V1_고학년학생;

--manager 계정으로 변경
CREATE VIEW V1_고학년학생(학색이름, 나이, 성, 학년) AS
SELECT 이름, 나이, 성, 학년 FROM 학생2
WHERE 학년 >= 3 AND 학년 >=4; 

CREATE VIEW V2_과목수강현황(과목번호, 강의실, 수강인원수) AS
	SELECT 과목.과목번호, 강의실, COUNT (과목.과목번호)
	FROM 과목 JOIN 수강 ON 과목.과목번호 = 수강.과목번호
	GROUP BY 과목.과목번호;

--SELECT * FROM V3_과목수강현황
CREATE VIEW V3_고학년여학생
	SELECT * FROM V1_고학년학생
	WHERE 성 ='여';

--SELECT * FROM V3_고학년여학생;

--인덱스
CREATE INDEX idx_수강 ON 수강(학번, 과목번호); --오류: 소유자만 가능 있다면 POSTGRES 계정 실행

CREATE UNIQUE INDEX idx_과목 ON 과목(이름 ASC);

CREATE UNIQUE INDEX idx_학생 ON 학생(학번);


SHOW INDEX FROM 학생;--MYSQL 만


	