CREATE DATABASE project_md4;
USE project_md4;

-- bang student
CREATE TABLE student (
    studentId varchar(4) PRIMARY KEY NOT NULL ,
    studentName varchar(100) NOT NULL ,
    birthday DATE NOT NULL ,
    gender BIT not null,
    address text,
    phoneNumber varchar(45) UNIQUE,
    check(gender = 1 or gender = 0)
);

-- bang subject
CREATE TABLE subject (
    subjectId varchar(4) PRIMARY KEY NOT NULL ,
    subjectName VARCHAR(45) NOT NULL ,
    priority INT(11) NOT NULL
);

-- bang mark
CREATE TABLE mark (
    subjectId VARCHAR(4) NOT NULL ,
    studentId VARCHAR(4) NOT NULL ,
    point FLOAT(11)
);

-- them khoa ngoai cho bang mark
ALTER TABLE mark
ADD CONSTRAINT fk_subject FOREIGN KEY (subjectId)
REFERENCES subject(subjectId);
ALTER TABLE mark
ADD CONSTRAINT fk_student FOREIGN KEY (studentId)
REFERENCES student(studentId);

-- them du lieu vao bang student
INSERT INTO student(studentId, studentName, birthday, gender, address, phoneNumber)
VALUES ('S001', 'Nguyễn Thế Anh', '1999-1-11',1,'Hà Nội','0984678082'),
       ('S002', 'Đặng Bảo Trâm', '1998-12-22',0,'Lào Cai','094982654'),
       ('S003', 'Trần Hà Phương', '2000-5-5',0,'Nghệ An','094765363'),
       ('S004', 'Đỗ Tiến Mạnh', '1999-3-26',1,'Hà Nội','093665353'),
       ('S005', 'Phạm Duy Nhất', '1998-10-4',1,'Tuyên Quang','0984678999'),
       ('S006', 'Mai Văn Thái', '2002-6-22',1,'Nam Đinh','0984555082'),
       ('S007', 'Giang Gia Hân', '1996-11-10',0,'Phú Thọ','0984448082'),
       ('S008', 'Nguyễn Ngọc Bảo My', '1999-1-22',0,'Hà Nam','0984672222'),
       ('S009', 'Nguyễn Tiến Đạt', '1998-8-7',1,'Tuyên Quang','0984678888'),
       ('S010', 'Nguyễn Thiều Quang', '2000-9-18',1,'Hà Nội','0984676666');


-- Hiển thị dữ liệu bảng student
SELECT studentId as 'Mã sinh viên',studentName as 'Tên sinh viên',birthday 'Ngày sinh', address as 'Quê quán', phoneNumber as 'Số điện thoại',
       case gender when 1 then 'Nam' when 0 then 'Nữ'  end AS 'Giới tính'
from student;

-- them du lieu vao bang subject
INSERT INTO subject(subjectId, subjectName, priority)
VALUES ('MH01', 'Toán',2),
       ('MH02', 'Vật Lý',2),
       ('MH03', 'Hoá Học',1),
       ('MH04', 'Ngữ Văn',1),
       ('MH05', 'Tiếng Anh',2);
-- Hiển thị dữ liệu bangr subject
SELECT subjectId as 'Mã Môn Học', subjectName as 'Tên Môn Học', priority as 'Hệ số' FROM subject;

-- them du lieu vao bang mark
INSERT INTO mark ( studentId,subjectId, point)
VALUES ('S001','MH01',8.5),
       ('S001','MH02',7),
       ('S001','MH03',9),
       ('S001','MH04',9),
       ('S001','MH05',5),
       ('S002','MH01',9),
       ('S002','MH02',8),
       ('S002','MH03',6.5),
       ('S002','MH04',8),
       ('S002','MH05',6),
       ('S003','MH01',7.5),
       ('S003','MH02',6.5),
       ('S003','MH03',8),
       ('S003','MH04',7),
       ('S003','MH05',7),
       ('S004','MH01',6),
       ('S004','MH02',7),
       ('S004','MH03',5),
       ('S004','MH04',6.5),
       ('S004','MH05',8),
       ('S005','MH01',5.5),
       ('S005','MH02',8),
       ('S005','MH03',7.5),
       ('S005','MH04',8.5),
       ('S005','MH05',9),
       ('S006','MH01',8),
       ('S006','MH02',10),
       ('S006','MH03',9),
       ('S006','MH04',7.5),
       ('S006','MH05',6.5),
       ('S007','MH01',9.5),
       ('S007','MH02',9),
       ('S007','MH03',6),
       ('S007','MH04',9),
       ('S007','MH05',4),
       ('S008','MH01',10),
       ('S008','MH02',8.5),
       ('S008','MH03',8.5),
       ('S008','MH04',6),
       ('S008','MH05',9.5),
       ('S009','MH01',7.5),
       ('S009','MH02',7),
       ('S009','MH03',9),
       ('S009','MH04',5),
       ('S009','MH05',10),
       ('S010','MH01',6.5),
       ('S010','MH02',8),
       ('S010','MH03',5.5),
       ('S010','MH04',4),
       ('S010','MH05',7);

SELECT * from mark;

/*
2. Cập nhật dữ liệu [10 điểm]:
- Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.
- Sửa tên và hệ số môn học có mã `MH05` thành “NgoạiNgữ” và hệ số là 1.
- Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6,
MH05 : 9).
*/

-- Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.
UPDATE student
SET studentName='Đỗ Đức Mạnh' WHERE studentId='S004';

select * from student where studentId='S004';

-- Sửa tên và hệ số môn học có mã `MH05` thành “NgoạiNgữ” và hệ số là 1
UPDATE subject
SET subjectName='Ngoại Ngữ', priority=1 WHERE subjectId='MH05';

SELECT * FROM subject where subjectId='MH05';

-- Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6 ,MH05 : 9).
UPDATE mark
SET point = case
when subjectId = 'MH01' then 8.5
when subjectId = 'MH02' then 7
when subjectId = 'MH03' then 5.5
when subjectId = 'MH04' then 6
when subjectId = 'MH05' then 9
end
where studentId='S009';

SELECT * from mark where studentId = 'S009';

/*
3. Xoá dữ liệu[10 điểm]:
- Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh
này ở bảng STUDENT.
*/

DELETE from mark where studentId='S010';
SELECT * from mark;

DELETE from student where studentId='S010';
SELECT * from student;

/*
Bài 3: Truy vấn dữ liệu [25 điểm]:
*/

-- 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student . [4 điểm]
SELECT studentId as 'Mã sinh viên',
       studentName as 'Tên sinh viên',
       birthday 'Ngày sinh',
       case gender when 1 then 'Nam' when 0 then 'Nữ'  end AS 'Giới tính',
       address as 'Quê quán',
       phoneNumber as 'Số điện thoại'
from student;

-- 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1. [4 điểm]
SELECT studentName as 'Tên học sinh' ,
       s2.subjectId as 'Mã môn học' ,
       subjectName as 'Tên môn học'
from mark
join student s on mark.studentId = s.studentId
join subject s2 on mark.subjectId = s2.subjectId
WHERE priority =1
group by studentName, s2.subjectId;

-- 3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ
-- năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh. [4 điểm]

SELECT studentId as 'Mã học sinh',
       studentName as 'Ten học sinh',
       TIMESTAMPDIFF(year , birthday,NOW()) as Tuổi ,
       case gender when 1 then 'Nam' when 0 then 'Nữ' end as 'Giới tính',
       address
from student;

-- 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn
-- Toán và sắp xếp theo điểm giảm dần. [4 điểm]
SELECT studentName as 'Tên học sinh',
       subjectName as 'Tên môn học',
       point as Điểm
from mark
join student s on mark.studentId = s.studentId
join subject s2 on mark.subjectId = s2.subjectId
where mark.subjectId = 'MH01'
order by point DESC ;

-- 5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).
SELECT  case
WHEN gender = 0 then 'Nam'
WHEN gender = 1 then 'Nữ'
end as 'Giới tính',
    COUNT(*) as 'Số lượng' from student
GROUP BY gender;

-- 6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm
-- để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. [5 điểm]

SELECT student.studentId as 'Mã học sinh',
       studentName as 'Tên học sinh',
       SUM(m.point) as 'Tổng điểm',
       AVG(m.point) as 'Điểm trung bình'
FROM student
join mark m on student.studentId = m.studentId
group by student.studentId, studentName
order by student.studentId;

/*
Bài 4: Tạo View, Index, Procedure [20 điểm]:
*/
-- 1. Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học
-- sinh, giới tính , quê quán . [3 điểm]
CREATE VIEW STUDENT_VIEW
    as
SELECT studentId as 'Mã học sinh',
       studentName as 'Tên học sinh',
       case gender when 1 then 'Nam' when 0 then 'Nữ' end as 'Giới tính',
       address AS 'Quê quán'
FROM student;

-- 2. Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh,
-- điểm trung bình các môn học . [3 điểm]
CREATE VIEW AVERAGE_MARK_VIEW
AS
SELECT student.studentId as 'Mã học sinh',
       studentName as 'Tên học sinh',
       AVG(point) as 'Điểm trung bình'
FROM student
JOIN mark m on student.studentId = m.studentId
GROUP BY student.studentId, studentName;


-- 3. Đánh Index cho trường `phoneNumber` của bảng STUDENT. [2 điểm]
CREATE INDEX idx_phoneNumber
ON student(phoneNumber);

/*
4. Tạo các PROCEDURE sau:
*/

-- Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả
-- thông tin học sinh đó. [4 điểm]
delimiter //
CREATE PROCEDURE PROC_INSERTSTUDENT(newId VARCHAR(4) , newName VARCHAR(100), newBirthday DATE,newGender BIT, newAddress TEXT, newPhone VARCHAR(45))

BEGIN
    INSERT INTO student(studentId, studentName, birthday, gender, address, phoneNumber)
        VALUES (newId,newName,newBirthday,newGender,newAddress,newPhone);
END;
// delimiter ;
DROP PROCEDURE PROC_INSERTSTUDENT;
call PROC_INSERTSTUDENT('S111','Nguyễn Sỹ Hoàng', '1998-02-27', 1, 'Hà Nội', '0987654321');
SELECT * from student;
DELETE from student where studentId='S111';

-- - Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.
delimiter //
CREATE PROCEDURE PROC_UPDATESUBJECT(id VARCHAR(4), name VARCHAR(45))
BEGIN
    UPDATE subject
        SET subjectName = name WHERE subjectId=id;
END;
// delimiter ;
DROP PROCEDURE PROC_UPDATESUBJECT;

call PROC_UPDATESUBJECT('MH01','Toán học');
select * from subject;

-- Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học
-- sinh và trả về số bản ghi đã xóa. [4 điểm]

delimiter //
CREATE PROCEDURE PROC_DELETEMARK(IN id VARCHAR(4), OUT count int )
BEGIN
    DECLARE count_delete int default 0 ;
   DELETE from mark where subjectId=id;
   SELECT COUNT(*) into count_delete from mark
       WHERE id = studentId;
    IF (count_delete > 0 ) then DELETE FROM mark WHERE studentId= id  ;
    END IF ;

    SET count = count_delete;
END;
// delimiter ;
DROP PROCEDURE PROC_DELETEMARK;


CALL PROC_DELETEMARK('S009',@count);
SELECT * from mark;
SELECT @count as 'Số dòng đã xoá';