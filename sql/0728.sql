create table tbl_comment (
    c_no number not null,
    user_id varchar2(50) not null,
    c_content varchar2(700) not null,
    h_no number not null,
    parent_c_no number,
	re_group number,
    c_depth number(1) default 0 not null,
    is_del varchar(2) default 'N' not null CHECK(is_del IN('N','Y')),
    reg_date timestamp default sysdate not null,
    mod_date timestamp default null,
    del_date timestamp default null,
    CONSTRAINT comment_c_no_pk PRIMARY KEY (c_no),
    constraint comment_user_id_fk foreign key (user_id) references tbl_member(user_id) on delete cascade,
    CONSTRAINT comment_h_no_fk FOREIGN KEY (h_no) REFERENCES tbl_hobby(hobby_no) ON DELETE CASCADE,
    CONSTRAINT comment_parent_c_no_fk FOREIGN KEY (parent_c_no) REFERENCES tbl_comment(c_no)
);

CREATE SEQUENCE SEQ_C_NO;