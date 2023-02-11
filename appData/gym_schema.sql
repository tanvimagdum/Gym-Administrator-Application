-- create user dbadmin identified by "12345";

-- grant all on gym_schema.* to "dbadmin";

-- flush privileges;

use gym_schema;

-- ----------------------------------------- MEMBER ---------------------------------------


DROP PROCEDURE IF EXISTS create_member;
DELIMITER //
CREATE PROCEDURE create_member(
    local_mem_name VARCHAR(60),
    local_mem_dob DATE,
    local_mem_phone VARCHAR(30),
    local_mem_height FLOAT,
    local_mem_weight FLOAT,
    local_mem_gymId INT,
    local_mem_trID INT
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_mem_name) OR 
		ISNULL(local_mem_dob) OR
		ISNULL(local_mem_phone) OR 
        ISNULL(local_mem_height) OR 
        ISNULL(local_mem_weight) OR
        ISNULL(local_mem_gymID) OR
        ISNULL(local_mem_trID)) THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_member (member_name, member_dob, member_phone, 
										member_height, member_weight, gym_id, trainer_id)
        VALUES(local_mem_name, local_mem_dob, local_mem_phone,
								local_mem_height, local_mem_weight, local_mem_gymID, local_mem_trID);
	END IF;
END //
DELIMITER ;


-- update member
DROP PROCEDURE IF EXISTS update_member;
DELIMITER //
CREATE PROCEDURE update_member(
	local_mem_id INT,
    local_mem_name VARCHAR(60),
    local_mem_dob DATE,
    local_mem_phone VARCHAR(30),
    local_mem_height FLOAT,
    local_mem_weight FLOAT
)
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    IF(ISNULL(local_mem_id)) THEN
		SELECT 'ID field blank' AS message;
    ELSE
		UPDATE gym_member SET	member_name = local_mem_name, 
								member_dob = local_mem_dob, 
								member_phone = local_mem_phone,
								member_height = local_mem_height, 
								member_weight = local_mem_weight
			WHERE id = local_mem_id;
     END IF;       
END //
DELIMITER ;


-- read member by name
DROP PROCEDURE IF EXISTS read_member_by_name;
DELIMITER //
CREATE PROCEDURE read_member_by_name(
	local_mem_name VARCHAR(60)
) 
BEGIN    
	SELECT m.id, m.member_name, m.member_dob, m.member_phone, m.member_height, g.gym_name, t.trainer_name, m.member_weight
    FROM gym_member m 
    INNER JOIN gym_gym g
    ON m.gym_id = g.id
    INNER JOIN gym_trainer t
    ON m.trainer_id = t.id
    WHERE m.member_name = local_mem_name
    ORDER BY m.member_name;
END //
DELIMITER ;


-- read member by trainer
DROP PROCEDURE IF EXISTS read_member_by_trainer;
DELIMITER //
CREATE PROCEDURE read_member_by_trainer(
	local_tr_name VARCHAR(60)
) 
BEGIN    
	SELECT m.id, m.member_name, m.member_dob, m.member_phone, m.member_height, g.gym_name, t.trainer_name, m.member_weight
    FROM gym_member m
    INNER JOIN gym_gym g
    ON m.gym_id = g.id
    INNER JOIN gym_trainer t
    ON m.trainer_id = t.id
	WHERE t.trainer_name = local_tr_name
    ORDER BY m.member_name;
END //
DELIMITER ;

-- read member by gym
DROP PROCEDURE IF EXISTS read_member_by_gym;
DELIMITER //
CREATE PROCEDURE read_member_by_gym(
	local_gym_name VARCHAR(60)
) 
BEGIN    
	SELECT m.id, m.member_name, m.member_dob, m.member_phone, m.member_height, g.gym_name, t.trainer_name, m.member_weight
    FROM gym_member m 
    INNER JOIN gym_gym g
    ON m.gym_id = g.id
    INNER JOIN gym_trainer t
    ON m.trainer_id = t.id
	WHERE g.gym_name = local_gym_name
    ORDER BY m.member_name;
END //
DELIMITER ;


-- delete member 
DROP PROCEDURE IF EXISTS delete_member;
DELIMITER //
CREATE PROCEDURE delete_member(
	local_mem_id INT
) 
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
	DELETE FROM gym_member WHERE id = local_mem_id;
END //
DELIMITER ;


-- ----------------------------------- TRAINER ------------------------------------------------


-- create trainer
DROP PROCEDURE IF EXISTS create_trainer;
DELIMITER //
CREATE PROCEDURE create_trainer(
    local_tr_name VARCHAR(60),
    local_tr_address VARCHAR(60),
    local_tr_phone VARCHAR(30),
    local_tr_work FLOAT,
    local_tr_gymID INT
)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_tr_name) OR 
        ISNULL(local_tr_address) OR
		ISNULL(local_tr_phone) OR 
        ISNULL(local_tr_work) OR
        ISNULL(local_tr_gymID)) THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_trainer(trainer_name, trainer_address, trainer_phone, trainer_working_hours, gym_id)
        VALUES(local_tr_name, local_tr_address, local_tr_phone, local_tr_work, local_tr_gymID);
	END IF;
END //
DELIMITER ;


-- update trainer
DROP PROCEDURE IF EXISTS update_trainer;
DELIMITER //
CREATE PROCEDURE update_trainer(
	local_tr_id INT,
    local_tr_name VARCHAR(60),
    local_tr_address VARCHAR(60),
    local_tr_phone VARCHAR(30),
    local_tr_work FLOAT
)
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    IF(ISNULL(local_tr_id)) THEN
		SELECT 'ID field blank' AS message;
    ELSE
		UPDATE gym_trainer SET	trainer_name = local_tr_name, 
								trainer_address = local_tr_address, 
								trainer_phone = local_tr_phone, 
								trainer_working_hours = local_tr_work
		WHERE id = local_tr_id;
	END IF;
END //
DELIMITER ;


-- read trainer by name
DROP PROCEDURE IF EXISTS read_trainer_by_name;
DELIMITER //
CREATE PROCEDURE read_trainer_by_name(
	local_tr_name VARCHAR(60)
) 
BEGIN    
	SELECT t.id, t.trainer_name, t.trainer_address, t.trainer_phone, t.trainer_working_hours, g.gym_name
    FROM gym_trainer t 
    INNER JOIN gym_gym g
    ON t.gym_id = g.id
    WHERE trainer_name = local_tr_name
    ORDER BY t.trainer_name;
END //
DELIMITER ;

-- read trainer by gym
DROP PROCEDURE IF EXISTS read_trainer_by_gym;
DELIMITER //
CREATE PROCEDURE read_trainer_by_gym(
	local_gym_name VARCHAR(60)
) 
BEGIN    
	SELECT t.id, t.trainer_name, t.trainer_address, t.trainer_phone, t.trainer_working_hours, g.gym_name
    FROM gym_trainer t 
    INNER JOIN gym_gym g
    ON t.gym_id = g.id
	WHERE g.gym_name = local_gym_name
    ORDER BY t.trainer_name;
END //
DELIMITER ;


-- delete trainer 
DROP PROCEDURE IF EXISTS delete_trainer;
DELIMITER //
CREATE PROCEDURE delete_trainer(
	local_tr_id INT
) 
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
	DELETE FROM gym_trainer WHERE id = local_tr_id;
END //
DELIMITER ;


-- --------------------------------------- GYM --------------------------------------------


-- create gym
DROP PROCEDURE IF EXISTS create_gym;
DELIMITER //
CREATE PROCEDURE create_gym(
    local_gym_name VARCHAR(60),
    local_gym_address VARCHAR(60),
    local_gym_phone VARCHAR(30)
)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_gym_name) OR 
		ISNULL(local_gym_address) OR
		ISNULL(local_gym_phone)) THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_gym (gym_name, gym_address, gym_phone)
        VALUES(local_gym_name, local_gym_address, local_gym_phone);
	END IF;
END //
DELIMITER ;


-- update gym
DROP PROCEDURE IF EXISTS update_gym;
DELIMITER //
CREATE PROCEDURE update_gym(
	local_gym_id INT,
    local_gym_name VARCHAR(60),
    local_gym_address VARCHAR(60),
    local_gym_phone VARCHAR(30)
)
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    IF(ISNULL(local_gym_id)) THEN
		SELECT 'ID field blank' AS message;
    ELSE
		UPDATE gym_gym SET	gym_name = local_gym_name, 
							gym_address = local_gym_address, 
							gym_phone = local_gym_phone
			WHERE id = local_gym_id;
	END IF;
END //
DELIMITER ;


-- read gym by name
DROP PROCEDURE IF EXISTS read_gym_by_name;
DELIMITER //
CREATE PROCEDURE read_gym_by_name(
	local_gym_name VARCHAR(60)
) 
BEGIN    
	SELECT * FROM gym_gym WHERE gym_name = local_gym_name;
END //
DELIMITER ;


-- ------------------------------------ ROOM ----------------------------------------------


-- create room
DROP PROCEDURE IF EXISTS create_room;
DELIMITER //
CREATE PROCEDURE create_room(
    local_room_roomNo INT,
    local_room_cap INT,
    local_room_gymID INT
)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_room_roomNo) OR
		ISNULL(local_room_cap) OR
        ISNULL(local_room_gymID)) THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_room (room_number, room_capacity, gym_id)
        VALUES(local_room_roomNo, local_room_cap, local_room_gymID);
	END IF;
END //
DELIMITER ;


-- ------------------------------------ ACTIVITY -----------------------------------------------


-- create activity
DROP PROCEDURE IF EXISTS create_activity;
DELIMITER //
CREATE PROCEDURE create_activity(
    local_act_name VARCHAR(60),
    local_act_duration INT,
    local_act_calories FLOAT,
    local_act_roomID INT
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_act_name) OR
        ISNULL(local_act_duration) OR
        ISNULL(local_act_calories) OR
        ISNULL(local_act_roomID))THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_activity (activity_name, activity_duration, activity_calories_burnt, room_id)
        VALUES(local_act_name, local_act_duration, local_act_calories, local_act_roomID);
	END IF;
END //
DELIMITER ;


-- update activity
DROP PROCEDURE IF EXISTS update_activity;
DELIMITER //
CREATE PROCEDURE update_activity(
	local_act_id INT,
    local_act_name VARCHAR(60),
    local_act_duration INT,
    local_act_calories FLOAT,
    local_act_roomID INT
)
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    IF(ISNULL(local_act_id)) THEN
		SELECT 'ID field blank' AS message;
    ELSE
		UPDATE gym_activity SET	activity_name = local_act_name,
								activity_duration = local_act_duration,
								activity_calories_burnt = local_act_calories,
								room_id = local_act_roomID
			WHERE id = local_act_id;
	END IF;
END //
DELIMITER ;


-- read activity by gym
DROP PROCEDURE IF EXISTS read_activity_by_gym;
DELIMITER //
CREATE PROCEDURE read_activity_by_gym(
	local_gym_name VARCHAR(60)
) 
BEGIN    
	SELECT a.id, a.activity_name, a.activity_duration, a.activity_calories_burnt, r.room_number
    FROM gym_activity a
    INNER JOIN gym_room r
    ON a.room_id = r.id
    WHERE r.gym_id = (SELECT id FROM gym_gym WHERE gym_name = local_gym_name)
    ORDER BY a.id;
END //
DELIMITER ;

-- delete activity
DROP PROCEDURE IF EXISTS delete_activity;
DELIMITER //
CREATE PROCEDURE delete_activity(
	local_act_id INT
) 
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
	DELETE FROM gym_activity WHERE id = local_act_id;
END //
DELIMITER ;


-- ----------------------------------------- EQUIPMENT --------------------------------------------


-- create equipment
DROP PROCEDURE IF EXISTS create_equipment;
DELIMITER //
CREATE PROCEDURE create_equipment(
    local_eq_name VARCHAR(60),
    local_eq_weight FLOAT,
    local_eq_brand VARCHAR(60),
    local_eq_roomID INT
)
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_eq_name) OR
        ISNULL(local_eq_weight) OR
        ISNULL(local_eq_brand) OR
        ISNULL(local_eq_roomID)) THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_equipment (equipment_name, equipment_weight, equipment_brand, room_id)
        VALUES(local_eq_name, local_eq_weight, local_eq_brand, local_eq_roomID);
	END IF;
END //
DELIMITER ;


-- read equipment by room
DROP PROCEDURE IF EXISTS read_equipment_by_room;
DELIMITER //
CREATE PROCEDURE read_equipment_by_room(
	local_room_no VARCHAR(60)
) 
BEGIN    
	SELECT e.id, e.equipment_name, e.equipment_weight, e.equipment_brand, r.room_number, g.gym_name
    FROM gym_equipment e
    INNER JOIN gym_room r
    ON e.room_id = r.id
    INNER JOIN gym_gym g
    ON g.id = r.gym_id
    WHERE r.room_number = local_room_no
    ORDER BY e.id;
END //
DELIMITER ;


-- read equipment by gym
DROP PROCEDURE IF EXISTS read_equipment_by_gym;
DELIMITER //
CREATE PROCEDURE read_equipment_by_gym(
	local_gym_name VARCHAR(60)
) 
BEGIN 
	SELECT eq.id, eq.equipment_name, eq.equipment_weight, eq.equipment_brand, r.room_number 
    FROM gym_equipment eq
    INNER JOIN gym_room r
    ON eq.room_id = r.id
    WHERE r.gym_id = (SELECT id FROM gym_gym WHERE gym_name = local_gym_name)
    ORDER by eq.id;
END //
DELIMITER ;


-- delete equipment
DROP PROCEDURE IF EXISTS delete_equipment;
DELIMITER //
CREATE PROCEDURE delete_equipment(
	local_eq_id INT
) 
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
	DELETE FROM gym_equipment WHERE id = local_eq_id;
END //
DELIMITER ;


-- -------------------------------- EQUIPMENT CLEANER --------------------------------------


-- create equipment_cleaner
DROP PROCEDURE IF EXISTS create_equipment_cleaner;
DELIMITER //
CREATE PROCEDURE create_equipment_cleaner(
    local_eqcl_name VARCHAR(60),
    local_eqcl_address VARCHAR(60),
    local_eqcl_phone VARCHAR(60),
    local_eqcl_role VARCHAR(40),
    local_eqcl_gymID INT
)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_eqcl_name) OR
        ISNULL(local_eqcl_address) OR
        ISNULL(local_eqcl_phone) OR
        ISNULL(local_eqcl_role) OR
        ISNULL(local_eqcl_gymID)) THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_equipment_cleaner (cleaner_name, cleaner_address, cleaner_phone, cleaner_role, gym_id)
        VALUES(local_eqcl_name, local_eqcl_address, local_eqcl_phone, local_eqcl_role, local_eqcl_gymID);
	END IF;
END //
DELIMITER ;

 
-- update equipment_cleaner 
DROP PROCEDURE IF EXISTS update_equipment_cleaner;
DELIMITER //
CREATE PROCEDURE update_equipment_cleaner(
	local_eqcl_id INT,
    local_eqcl_name VARCHAR(60),
    local_eqcl_address VARCHAR(60),
    local_eqcl_phone VARCHAR(60),
    local_eqcl_role VARCHAR(40)
)
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    IF(ISNULL(local_eqcl_id)) THEN
		SELECT 'ID field blank' AS message;
    ELSE
		UPDATE gym_equipment_cleaner SET	cleaner_name = local_eqcl_name,
											cleaner_address = local_eqcl_address,
											cleaner_phone = local_eqcl_phone,
											cleaner_role = local_eqcl_role
			WHERE id = local_eqcl_id;
	END IF;
END //
DELIMITER ;



-- read equipment cleaner by name
DROP PROCEDURE IF EXISTS read_equipment_cleaner_by_name;
DELIMITER //
CREATE PROCEDURE read_equipment_cleaner_by_name(
	local_eqcl_name VARCHAR(60)
) 
BEGIN    
	SELECT eqcl.id, eqcl.cleaner_name, eqcl.cleaner_address, eqcl.cleaner_phone, eqcl.cleaner_role, g.gym_name
    FROM gym_equipment_cleaner eqcl
    INNER JOIN gym_gym g
    ON g.id = eqcl.gym_id
    WHERE eqcl.cleaner_name = local_eqcl_name
    ORDER BY eqcl.cleaner_name;
END //
DELIMITER ;


-- read number of equipment cleaners by role
DROP PROCEDURE IF EXISTS read_equipmentCleaners_by_role;
DELIMITER //
CREATE PROCEDURE read_equipmentCleaners_by_role() 
BEGIN    
	SELECT cleaner_role, IFNULL(COUNT(*), 0) as "Number of staff members"
    FROM gym_equipment_cleaner
    GROUP BY cleaner_role;
END //
DELIMITER ;


-- delete equipment_cleaner
DROP PROCEDURE IF EXISTS delete_equipment_cleaner;
DELIMITER //
CREATE PROCEDURE delete_equipment_cleaner(
	local_eqcl_id INT
) 
BEGIN    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
	DELETE FROM gym_equipment_cleaner WHERE id = local_eqcl_id;
END //
DELIMITER ;


-- ------------------------------------- GYM MEMBER TO ACTIVITY ----------------------------------


-- create mem_to_act table
DROP PROCEDURE IF EXISTS create_mem_to_act;
DELIMITER //
CREATE PROCEDURE create_mem_to_act(
    local_mta_aid INT,
    local_mta_mid INT
)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_mta_aid) OR
        ISNULL(local_mta_mid))THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_member_to_activity (activity_id, member_id)
        VALUES(local_mta_aid, local_mta_mid);
	END IF;
END //
DELIMITER ;


-- ------------------------------------- GYM TRAINER TO ACTIVITY ----------------------------------


-- create tr_to_act table
DROP PROCEDURE IF EXISTS create_tr_to_act;
DELIMITER //
CREATE PROCEDURE create_tr_to_act(
    local_tta_aid INT,
    local_tta_tid INT
)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_tta_aid) OR
        ISNULL(local_tta_tid))THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_trainer_to_activity (activity_id, trainer_id)
        VALUES(local_tta_aid, local_tta_tid);
	END IF;
END //
DELIMITER ;


-- ------------------------------- GYM EQUIPMENT TO EQUIPMENT CLEANER ------------------------------


-- create eq_to_eqcl table
DROP PROCEDURE IF EXISTS create_eq_to_eqcl;
DELIMITER //
CREATE PROCEDURE create_eq_to_eqcl(
    local_eteq_eqid INT,
    local_eteq_eqclid INT
)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException Encountered' AS message; 
    
    IF (ISNULL(local_eteq_eqid) OR
        ISNULL(local_eteq_eqclid))THEN
        SELECT 'Atleast one of the values found to be blank' AS message;
	ELSE
		INSERT INTO gym_equipment_to_equipment_cleaner (equipment_id, equipment_cleaner_id)
        VALUES(local_eteq_eqid, local_eteq_eqclid);
	END IF;
END //
DELIMITER ;


-- ------------------------------- ACTIVITY EXTRACTION ------------------------------

/*
-- extract list of available activities for a member
DROP PROCEDURE IF EXISTS get_activity_list;
DELIMITER //
CREATE PROCEDURE create_eq_to_eqcl(
    IN local_mem_name VARCHAR(60),
    OUT 
)
BEGIN
	DECLARE row_not_found BOOL;
    DECLARE act_id_var INT;
    DECLARE name_var, school_var VARCHAR(30);
    
    DECLARE student_major_c CURSOR FOR
		SELECT id, name, school
        FROM student_simple
        JOIN student_major
        ON student.id = student_major.student_id;
        
	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET row_not_found = true;
        
	SET row_not_found = false;
    OPEN student_major_c;
    
    WHILE row_not_found = false DO
		FETCH student_major_c INTO student_id_var, name_var, school_var;
        SELECT student_id_var, name_var, school_var;
	END WHILE;
    
	CLOSE student_major_c;
END //
DELIMITER ;
*/

-- ------------------------------- TEST PROCEDURE CALLS ----------------------------------------


CALL create_member('JAMES SCOTT','1990-11-01', '1000000001', 170.10, 64.50, 13, 16);
CALL update_member(10,'JOHN','2010-01-11', '1234567810', 170.1, 64.5);
CALL read_member_by_name('DANNY');
CALL read_member_by_trainer('CLARA');
CALL read_member_by_gym('GOLD-BASIC GYM');
CALL delete_member(2);

CALL create_trainer('Sierra Ruiz','Central Avenue, Boston', '3333322222', 5.0, 17);
CALL update_trainer(10,'CLARA','Park Drive, Boston', '1234467810', 6.5, 10);
CALL read_trainer_by_name('CLARA');
CALL read_trainer_by_gym('GOLD-PREMIUM GYM');
CALL delete_trainer(10);

CALL create_gym('GOLD 360 MIND AND BODY','Ashmont, Boston', '6000690009');
CALL update_gym(10,'GOLD-VIP GYM','Park Drive, Boston', '9000980008');
CALL read_gym_by_name('GOLD 360 MIND AND BODY');
CALL delete_gym(10);

CALL create_room(13, 2, 60, 11);

CALL create_activity('Skipping', 20, 160.6, 10);
CALL update_activity(10, 'Cycling', 15, 155.4, 10);
CALL read_activity_by_gym('GOLD-PREMIUM GYM');
CALL delete_activity(10);

CALL create_equipment('Rowing Machine', 140.64, 'FitBit', 13);
CALL read_equipment_by_room(4);
CALL read_equipment_by_gym('GOLD-BASIC GYM');
CALL delete_equipment(10);

CALL create_equipment_cleaner('Hailey', 'Fenway, Boston', '1234117890', 'Staff Assoc.', 10);
CALL update_equipment_cleaner(10, 'Mathew D.', 'Fenway Park, Boston', '1234567899', 'Staff');
CALL delete_equipment_cleaner(10);

CALL create_mem_to_act(10, 10);
CALL create_tr_to_act(10, 10);
CALL create_eq_to_eqcl(10, 11);


select * from gym_member;
select * from gym_trainer;
select * from gym_gym;
select * from gym_room; 
select * from gym_activity;
select * from gym_equipment;
select * from gym_equipment_cleaner;
select * from gym_equipment_to_equipment_cleaner;
select * from gym_member_to_activity;
select * from gym_trainer_to_activity;
delete from gym_member;
delete from gym_trainer;
delete from gym_gym;
delete from gym_room;
delete from gym_activity;
delete from gym_equipment;
delete from gym_equipment_cleaner;
delete from gym_equipment_to_equipment_cleaner;
delete from gym_member_to_activity;
delete from gym_trainer_to_activity;

-- -------------------------------------- ALTER TABLE CODE --------------------------------------


ALTER TABLE gym_member_to_activity
	DROP CONSTRAINT gym_member_to_activity_member_id_19bc2954_fk_gym_member_id;
ALTER TABLE gym_member_to_activity
  ADD CONSTRAINT gym_act_fk
  FOREIGN KEY (member_id) 
  REFERENCES gym_member(id) 
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  

ALTER TABLE gym_member_to_activity
	DROP CONSTRAINT gym_member_to_activity_activity_id_7475d2ee_fk_gym_activity_id;    
ALTER TABLE gym_member_to_activity
  ADD CONSTRAINT gym_act_fk2
  FOREIGN KEY (activity_id) 
  REFERENCES gym_activity(id) 
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE gym_trainer_to_activity
	DROP CONSTRAINT gym_trainer_to_activity_activity_id_870e63b5_fk_gym_activity_id;
ALTER TABLE gym_trainer_to_activity
  ADD CONSTRAINT gym_tr_act_fk1
  FOREIGN KEY (trainer_id) 
  REFERENCES gym_trainer(id) 
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
   
ALTER TABLE gym_trainer_to_activity
	DROP CONSTRAINT gym_trainer_to_activity_trainer_id_c8c9fde2_fk_gym_trainer_id;    
ALTER TABLE gym_trainer_to_activity
  ADD CONSTRAINT gym_tr_act_fk2
  FOREIGN KEY (activity_id) 
  REFERENCES gym_activity(id) 
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE gym_equipment_to_equipment_cleaner
	DROP CONSTRAINT gym_equipment_to_equ_equipment_cleaner_id_76913438_fk_gym_equip;
ALTER TABLE gym_equipment_to_equipment_cleaner
  ADD CONSTRAINT gym_eq_eqcl_fk1
  FOREIGN KEY (equipment_id) 
  REFERENCES gym_equipment(id) 
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
 
ALTER TABLE gym_equipment_to_equipment_cleaner
	DROP CONSTRAINT gym_equipment_to_equ_equipment_id_7b9546b9_fk_gym_equip;    
ALTER TABLE gym_equipment_to_equipment_cleaner
  ADD CONSTRAINT gym_eq_eqcl_fk2
  FOREIGN KEY (equipment_cleaner_id) 
  REFERENCES gym_equipment_cleaner(id) 
  ON DELETE CASCADE
  ON UPDATE CASCADE;  

ALTER TABLE gym_gym
	ADD CONSTRAINT gym_name_unique
    UNIQUE KEY (gym_name);

ALTER TABLE gym_activity
	DROP CONSTRAINT gym_activity_room_id_3340269d_fk_gym_room_id;
ALTER TABLE gym_activity
	ADD CONSTRAINT act_to_room_fk
    FOREIGN KEY (room_id) 
	REFERENCES gym_room(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
    
ALTER TABLE gym_equipment
	DROP CONSTRAINT gym_equipment_room_id_98539f46_fk_gym_room_id;
ALTER TABLE gym_equipment
	ADD CONSTRAINT eq_to_room_fk
    FOREIGN KEY (room_id) 
	REFERENCES gym_room(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE;    
    
ALTER TABLE gym_equipment_cleaner
	DROP CONSTRAINT gym_equipment_cleaner_gym_id_ca40952d_fk_gym_gym_id;
ALTER TABLE gym_equipment_cleaner
	ADD CONSTRAINT eqcl_to_gym_fk
    FOREIGN KEY (gym_id) 
	REFERENCES gym_gym(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE;     
    
ALTER TABLE gym_member
	DROP CONSTRAINT gym_member_gym_id_e19a9642_fk_gym_gym_id;
ALTER TABLE gym_member
	ADD CONSTRAINT mem_to_gym_fk
    FOREIGN KEY (gym_id) 
	REFERENCES gym_gym(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE;    

ALTER TABLE gym_member
	DROP CONSTRAINT gym_member_trainer_id_d32d1592_fk_gym_trainer_id;
ALTER TABLE gym_member
	ADD CONSTRAINT mem_to_tr_fk
    FOREIGN KEY (trainer_id) 
	REFERENCES gym_trainer(id)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;  
    
ALTER TABLE gym_room
	DROP CONSTRAINT gym_room_gym_id_82f604d8_fk_gym_gym_id;
ALTER TABLE gym_room
	ADD CONSTRAINT room_to_gym_fk
    FOREIGN KEY (gym_id) 
	REFERENCES gym_gym(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE;     
    
ALTER TABLE gym_trainer
	DROP CONSTRAINT gym_trainer_gym_id_fbe4d536_fk_gym_gym_id;
ALTER TABLE gym_trainer
	ADD CONSTRAINT tr_to_gym_fk
    FOREIGN KEY (gym_id) 
	REFERENCES gym_gym(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE;    
    