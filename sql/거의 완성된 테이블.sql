-- * 취미글 부분
CREATE TABLE tbl_hobby (
    hobby_no NUMBER NOT NULL,
    user_id VARCHAR2(50) NOT NULL,
    hobby_title VARCHAR2(500) NOT NULL,
    main_img VARCHAR2(500) NOT NULL,
    hobby_intro VARCHAR2(800) NOT NULL,
    hobby_video VARCHAR2(100),
    l_cate_no NUMBER NOT NULL,
    m_cate_no NUMBER NOT NULL,
    time_no NUMBER NOT NULL,
    level_no NUMBER NOT NULL,
    cost_no NUMBER NOT NULL,
    view_cnt NUMBER DEFAULT 0 NOT NULL,
    like_cnt NUMBER DEFAULT 0 NOT NULL,
    is_del VARCHAR2(1) DEFAULT 'N' NOT NULL CHECK(is_delete IN('N','Y')),
    reg_date TIMESTAMP DEFAULT sysdate NOT NULL,
    mod_date TIMESTAMP DEFAULT NULL,
    del_date TIMESTAMP DEFAULT NULL,
    CONSTRAINT hobby_hobby_no_pk PRIMARY KEY (hobby_no),
    CONSTRAINT hobby_user_id_fk FOREIGN KEY (user_id) REFERENCES tbl_memberinfo(user_id) ON DELETE CASCADE,
    CONSTRAINT hobby_l_cate_no_fk FOREIGN KEY (l_cate_no) REFERENCES tbl_hobby_cate(cate_no) ON DELETE CASCADE,
    CONSTRAINT hobby_m_cate_no_fk FOREIGN KEY (m_cate_no) REFERENCES tbl_hobby_cate(cate_no) ON DELETE CASCADE,
    CONSTRAINT hobby_time_no_fk FOREIGN KEY (time_no) REFERENCES tbl_time_cate(time_no) ON DELETE CASCADE,
    CONSTRAINT hobby_level_no_fk FOREIGN KEY (level_no) REFERENCES tbl_level_cate(level_no) ON DELETE CASCADE,
    CONSTRAINT hobby_cost_no_fk FOREIGN KEY (cost_no) REFERENCES tbl_cost_cate(cost_no) ON DELETE CASCADE
);

CREATE SEQUENCE seq_hobby_no;

--* 준비물 부분
CREATE TABLE tbl_MATERIAL (
    MATERIAL_NO NUMBER NOT NULL,
    MATERIAL_NAME VARCHAR2(200) NOT NULL,
    CONSTRAINT MATERIAL_PK PRIMARY KEY (MATERIAL_NO)
);
CREATE SEQUENCE seq_material_no;

-- * 취미글_준비물 부분
CREATE TABLE tbl_hobby_material (
    hm_no number not null,
    hobby_no NUMBER NOT NULL,
    material_no NUMBER NOT NULL,
    material_detail VARCHAR2(200),
    seq NUMBER(2) NOT NULL, 
    is_del VARCHAR2(1) DEFAULT 'N' NOT NULL CHECK(is_delete IN('N','Y')),
    CONSTRAINT hobby_material_pk PRIMARY KEY (hm_no),
    CONSTRAINT hobby_material_fk1 FOREIGN KEY (hobby_no) REFERENCES tbl_hobby(hobby_no) ON DELETE CASCADE,
    CONSTRAINT hobby_material_fk2 FOREIGN KEY (material_no) REFERENCES tbl_material(material_no) ON DELETE CASCADE
);
CREATE SEQUENCE seq_hm_no;

-- *만들기 순서 부분
CREATE TABLE tbl_make_step (
    step_no number not null,
    hobby_no NUMBER NOT NULL,
    make_step_num NUMBER(2) NOT NULL,
    make_step_text VARCHAR(2000) NOT NULL,
    make_step_img VARCHAR2(500),
    tip varchar2(500),
    note varchar2(500),
    link_url varchar2(500),
    link_desc varchar2(500),
    is_del VARCHAR2(1) DEFAULT 'N' NOT NULL CHECK(is_delete IN('N','Y')),
    CONSTRAINT make_step_pk PRIMARY KEY (step_no),
    CONSTRAINT make_step_fk FOREIGN KEY (hobby_no) REFERENCES tbl_hobby(hobby_no) ON DELETE CASCADE
);
CREATE SEQUENCE seq_step_no;

--*완성 사진 부분
CREATE TABLE tbl_complete_img (
    hobby_no NUMBER NOT NULL,
    num NUMBER(1) NOT NULL,
    img_name varchar2(500),
    CONSTRAINT complete_img_fk FOREIGN KEY (hobby_no) REFERENCES tbl_hobby(hobby_no) ON DELETE CASCADE
);