select * from tbl_make_step
where hobby_no = 9 and is_del = 'N';

update tbl_make_step
set link_url = 'http://localhost/hobby/content/21'
where step_no =121;

commit;