/*
 * sys_company							租赁公司表
 * sys_organization						组织机构表
 * sys_project							项目表
 * sys_resource							资源表
 * sys_user								用户表
 * sys_role								角色表
 * sys_user_role						用户角色表
 * sys_role_resource					角色资源表
 * sys_user_permission					用户权限表
 * sys_user_privilege					用户特权表
 * sys_menu								菜单表
 */

-- 建立数据库
-- CREATE DATABASE IF NOT EXISTS db_euond default charset utf8 COLLATE utf8_general_ci;

-- 选择数据库
-- use db_euond;

-- drop table if exists sys_company;
create table sys_company
(
    id         				bigint 		not null 					comment 'ID',
    code					varchar(20) not null					comment '公司编码',
    name 		 			varchar(64) not null					comment '公司名称',
    linkman  				varchar(20) 							comment '联系人',
    work_phone  			varchar(20) 							comment '工作电话',
    mobile_phone  			varchar(20) 							comment '移动电话',
    address       			varchar(64) 							comment '地址',
    creator					varchar(20) not null					comment '建档人',
    create_time				datetime 	not null					comment '建档时间',
    last_modifier			varchar(20) 							comment '最后修改人',
    last_modified_time		datetime								comment '最后修改时间',
    remarks					varchar(255) 							comment '备注',
    constraint pk_sys_company primary key(id),
    constraint unique_sys_company unique(code)
) comment = '租赁公司表';

/*
* sys_organization						组织机构表
*/
-- drop table if exists sys_organization;
create table sys_organization
(
    id         				bigint 		not null 					comment 'ID',
    company_id				bigint 		not null 					comment '租赁公司ID',
    code					varchar(20) not null					comment '组织编码',
    name 		 			varchar(64) not null					comment '组织名称',
    parent_id         		bigint 		not null 					comment '父ID',
    parent_ids  			varchar(32) not null					comment '父路径',
    status  				tinyint		not null					comment '状态',
    creator					varchar(20) not null					comment '建档人',
    create_time				datetime	not null					comment '建档时间',
    last_modifier			varchar(20) 							comment '最后修改人',
    last_modified_time		datetime								comment '最后修改时间',
    remarks					varchar(255) 							comment '备注',
    constraint pk_sys_organization primary key(id),
    constraint unique_sys_organization unique(company_id,code)
) comment='组织机构表';

/*
* sys_project							项目表
*/
-- drop table if exists sys_project;
create table sys_project
(
    id         				bigint 		not null 					comment 'ID',
    code					varchar(20) not null					comment '项目编码',
    name 		 			varchar(64) not null					comment '项目名称',
    creator					varchar(20) not null					comment '建档人',
    create_time				datetime 	not null					comment '建档时间',
    last_modifier			varchar(20) 							comment '最后修改人',
    last_modified_time		datetime								comment '最后修改时间',
    remarks					varchar(255) 							comment '备注',
    constraint pk_sys_project primary key(id),
    constraint unique_sys_project unique(code)
) comment='项目表';

/*
* sys_resource							资源表
*/
-- drop table if exists sys_resource;
create table sys_resource
(
    id         				bigint 		not null 					comment 'ID',
    name 		 			varchar(64) not null					comment '资源名称',
    url 		 			varchar(64) not null					comment '地址',
    icon 		 			varchar(64) not null					comment '图标',
    permission_val 		 	int 		not null					comment '权限值',
    status  				tinyint		not null					comment '状态',
    creator					varchar(20) not null					comment '建档人',
    create_time				datetime 	not null					comment '建档时间',
    last_modifier			varchar(20) 							comment '最后修改人',
    last_modified_time		datetime								comment '最后修改时间',
    remarks					varchar(255) 							comment '备注',
    constraint pk_sys_resource primary key(id),
    constraint unique_sys_resource unique(name)
) comment='资源表';


/*
 * sys_user							用户表
 */
-- drop table if exists sys_user;
create table sys_user
(
    id         				bigint 		not null 					comment 'ID',
    company_id				bigint 		not null 					comment '租赁公司ID',
    login_name  			varchar(20) not null					comment '登录名称',
    org_id					bigint 		not null 					comment '组织ID',
    phone_number  			varchar(20) 							comment '手机号码',
    email  					varchar(20) 							comment 'e-mail',
    username				varchar(20) 							comment '用户名称',
    salt       				varchar(10) not null					comment '加密种子',
    password  				varchar(32) not null					comment '登录密码',
    status  				tinyint		not null					comment '状态',
    deleted					bool default false					    comment '逻辑删除',
    creator					varchar(20) not null					comment '建档人',
    create_time				datetime not null						comment '建档时间',
    last_modifier			varchar(20) 							comment '最后修改人',
    last_modified_time		datetime								comment '最后修改时间',
    remarks					varchar(255) 							comment '备注',
    constraint pk_sys_user primary key(id),
    constraint unique_sys_user unique(login_name)
)  comment='用户表';

/*
* sys_role							角色表
*/
-- drop table if exists sys_role;
create table sys_role
(
    id         				bigint 		not null 					comment 'ID',
    company_id				bigint 		not null 					comment '租赁公司ID',
    code					varchar(20) not null					comment '角色编码',
    name 		 			varchar(64) not null					comment '角色名称',
    status  				tinyint		not null					comment '状态',
    creator					varchar(20) not null					comment '建档人',
    create_time				datetime 	not null					comment '建档时间',
    last_modifier			varchar(20) 							comment '最后修改人',
    last_modified_time		datetime								comment '最后修改时间',
    remarks					varchar(255) 							comment '备注',
    constraint pk_sys_role primary key(id),
    constraint unique_sys_role unique(company_id,code)
) comment='角色表';

/*
* sys_user_role							用户角色表
*/
-- drop table if exists sys_user_role;
create table sys_user_role
(
    id         				bigint 		not null 					comment 'ID',
    company_id				bigint 		not null 					comment '租赁公司ID',
    user_id					bigint 		not null 					comment '用户ID',
    role_id					bigint 		not null 					comment '角色ID',
    constraint pk_sys_user_role primary key(id),
    constraint unique_sys_user_role unique(user_id,role_id)
)  comment='用户角色表';

/*
* sys_role_resource							角色资源表
*/
-- drop table if exists sys_role_resource;
create table sys_role_resource
(
    id         				bigint 		not null 					comment 'ID',
    company_id				bigint 		not null 					comment '租赁公司ID',
    role_id					bigint 		not null 					comment '角色ID',
    resource_id				bigint 		not null 					comment '资源ID',
    permission_val			int 		not null 					comment '权限值',
    constraint pk_sys_role_resource primary key(id),
    constraint unique_sys_role_resource unique(role_id,resource_id)
) comment='角色资源表';

/*
* sys_user_permission							用户权限表
*/
-- drop table if exists sys_user_permission;
create table sys_user_permission
(
    id         				bigint 		not null 					comment 'ID',
    company_id				bigint 		not null 					comment '租赁公司ID',
    user_id					bigint 		not null 					comment '用户ID',
    resource_id				bigint 		not null 					comment '资源ID',
    roles_val				int 		not null 					comment '用户所有角色权限之和',
    add_val					int 		not null 					comment '特殊增加权限',
    sub_val					int 		not null 					comment '特殊减少权限',
    constraint pk_sys_user_permission primary key(id),
    constraint unique_sys_user_permission unique(user_id,resource_id)
) comment='用户权限表';

/*
* sys_user_privilege							用户特权表
*/
--  drop table if exists sys_user_privilege;
create table sys_user_privilege
(
    id         				bigint 		not null 					comment 'ID',
    company_id				bigint 		not null 					comment '租赁公司ID',
    user_id					bigint 		not null 					comment '用户ID',
    resource_id				bigint 		not null 					comment '资源ID',
    add_val					int 		not null 					comment '特殊增加权限',
    sub_val					int 		not null 					comment '特殊减少权限',
    constraint pk_sys_user_privilege primary key(id),
    constraint unique_sys_user_privilege unique(user_id,resource_id)
) comment='用户特权表';

/*
* sys_menu							菜单表
*/
-- drop table if exists sys_menu;
create table sys_menu
(
    id         				bigint 		not null 					comment 'ID',
    company_id				bigint 		not null 					comment '租赁公司ID',
    project_id				bigint 		not null 					comment '项目ID',
    sequence				int 		not null 					comment '排序号',
    name 		 			varchar(32) not null					comment '菜单名称',
    icon 		 			varchar(64) not null					comment '菜单图标',
    resource_id				bigint		not null 					comment '资源ID',
    parent_id         		bigint 		not null 					comment '父ID',
    parent_ids  			varchar(32) not null					comment '父路径',
    status  				tinyint		not null					comment '状态',
    constraint pk_sys_menu primary key(id),
    constraint unique_sys_menu unique(project_id,name)
) comment='菜单表';

