/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     2017/11/2 10:37:23                           */
/*==============================================================*/
use HXDMS;

if exists (select 1
            from  sysobjects
           where  id = object_id('Auth_Button')
            and   type = 'U')
   drop table Auth_Button
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Auth_Icon')
            and   type = 'U')
   drop table Auth_Icon
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Auth_Menu')
            and   type = 'U')
   drop table Auth_Menu
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Auth_MenuButton')
            and   type = 'U')
   drop table Auth_MenuButton
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Auth_Role')
            and   type = 'U')
   drop table Auth_Role
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Auth_RoleMenu')
            and   type = 'U')
   drop table Auth_RoleMenu
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Auth_User')
            and   type = 'U')
   drop table Auth_User
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Auth_UserRole')
            and   type = 'U')
   drop table Auth_UserRole
go

/*==============================================================*/
/* Table: Auth_Button                                           */
/*==============================================================*/
create table Auth_Button (
   Id                   int                  identity,
   Name                 varchar(50)          null,
   Code                 varchar(50)          null,
   Icon                 varchar(50)          null,
   SortIndex            int                  null,
   CreateTime           datetime             null default getdate(),
   Creater              varchar(50)          null,
   Remark               varchar(50)          null,
   constraint PK_AUTH_BUTTON primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Auth_Button') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Auth_Button' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '按钮表', 
   'user', @CurrentUser, 'table', 'Auth_Button'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Button')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Button', 'column', 'Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '图标名',
   'user', @CurrentUser, 'table', 'Auth_Button', 'column', 'Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Button')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Code')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Button', 'column', 'Code'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '图标代码',
   'user', @CurrentUser, 'table', 'Auth_Button', 'column', 'Code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Button')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Icon')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Button', 'column', 'Icon'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '图标
   ',
   'user', @CurrentUser, 'table', 'Auth_Button', 'column', 'Icon'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Button')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SortIndex')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Button', 'column', 'SortIndex'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'Auth_Button', 'column', 'SortIndex'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Button')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Button', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Auth_Button', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Button')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Creater')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Button', 'column', 'Creater'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', @CurrentUser, 'table', 'Auth_Button', 'column', 'Creater'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Button')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Button', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Auth_Button', 'column', 'Remark'
go

/*==============================================================*/
/* Table: Auth_Icon                                             */
/*==============================================================*/
create table Auth_Icon (
   Id                   int                  identity,
   Name                 varchar(50)          null,
   CreateTime           datetime             null default getdate(),
   Creater              varchar(50)          null,
   constraint PK_AUTH_ICON primary key (Id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Icon')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Icon', 'column', 'Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '图标名称',
   'user', @CurrentUser, 'table', 'Auth_Icon', 'column', 'Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Icon')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Icon', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Auth_Icon', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Icon')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Creater')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Icon', 'column', 'Creater'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', @CurrentUser, 'table', 'Auth_Icon', 'column', 'Creater'
go

/*==============================================================*/
/* Table: Auth_Menu                                             */
/*==============================================================*/
create table Auth_Menu (
   Id                   int                  identity,
   Name                 nvarchar(50)         null,
   Code                 varchar(50)          null,
   Icon                 varchar(50)          null,
   ParentId             int                  null,
   Link                 varchar(255)         null,
   SortIndex            int                  null,
   CreateTime           datetime             null default getdate(),
   Creater              varchar(50)          null,
   Remark               varchar(255)         null,
   constraint PK_AUTH_MENU primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Auth_Menu') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Auth_Menu' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '菜单表', 
   'user', @CurrentUser, 'table', 'Auth_Menu'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单编号',
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单名称',
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Code')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'Code'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单代码',
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'Code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Icon')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'Icon'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单图标',
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'Icon'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ParentId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'ParentId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上级菜单编号',
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'ParentId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Link')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'Link'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单链接',
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'Link'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SortIndex')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'SortIndex'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'SortIndex'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Creater')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'Creater'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'Creater'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Auth_Menu', 'column', 'Remark'
go

/*==============================================================*/
/* Table: Auth_MenuButton                                       */
/*==============================================================*/
create table Auth_MenuButton (
   Id                   int                  identity,
   MenuId               int                  null,
   ButtonId             int                  null,
   constraint PK_AUTH_MENUBUTTON primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Auth_MenuButton') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Auth_MenuButton' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '菜单按钮表', 
   'user', @CurrentUser, 'table', 'Auth_MenuButton'
go

/*==============================================================*/
/* Table: Auth_Role                                             */
/*==============================================================*/
create table Auth_Role (
   Id                   int                  identity,
   Name                 nvarchar(50)         null,
   CreateTime           datetime             null default getdate(),
   Creater              varchar(50)          null,
   Remark               varchar(255)         null,
   constraint PK_AUTH_ROLE primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Auth_Role') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Auth_Role' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '角色表', 
   'user', @CurrentUser, 'table', 'Auth_Role'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Role', 'column', 'Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色名称',
   'user', @CurrentUser, 'table', 'Auth_Role', 'column', 'Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Role', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '默认当前时间',
   'user', @CurrentUser, 'table', 'Auth_Role', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Creater')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Role', 'column', 'Creater'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', @CurrentUser, 'table', 'Auth_Role', 'column', 'Creater'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_Role', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Auth_Role', 'column', 'Remark'
go

/*==============================================================*/
/* Table: Auth_RoleMenu                                         */
/*==============================================================*/
create table Auth_RoleMenu (
   Id                   int                  identity,
   RoleId               int                  null,
   MenuId               int                  null,
   constraint PK_AUTH_ROLEMENU primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Auth_RoleMenu') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Auth_RoleMenu' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '角色菜单表', 
   'user', @CurrentUser, 'table', 'Auth_RoleMenu'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_RoleMenu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'RoleId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_RoleMenu', 'column', 'RoleId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色编号',
   'user', @CurrentUser, 'table', 'Auth_RoleMenu', 'column', 'RoleId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_RoleMenu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'MenuId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_RoleMenu', 'column', 'MenuId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单编号',
   'user', @CurrentUser, 'table', 'Auth_RoleMenu', 'column', 'MenuId'
go

/*==============================================================*/
/* Table: Auth_User                                             */
/*==============================================================*/
create table Auth_User (
   Id                   int                  identity,
   UserName             varchar(50)          null,
   UserPass             char(32)             null,
   NickName             nvarchar(50)         null,
   Enable               bit                  null default 1,
   Phone                char(11)             null,
   Email                varchar(255)         null,
   CreateTime           datetime             null default getdate(),
   Creater              varchar(50)          null,
   Remark               varchar(255)         null,
   constraint PK_AUTH_USER primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Auth_User') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Auth_User' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '用户表', 
   'user', @CurrentUser, 'table', 'Auth_User'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UserName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_User', 'column', 'UserName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '登录名',
   'user', @CurrentUser, 'table', 'Auth_User', 'column', 'UserName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UserPass')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_User', 'column', 'UserPass'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '登录密码',
   'user', @CurrentUser, 'table', 'Auth_User', 'column', 'UserPass'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'NickName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_User', 'column', 'NickName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '昵称',
   'user', @CurrentUser, 'table', 'Auth_User', 'column', 'NickName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Enable')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_User', 'column', 'Enable'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '默认可用',
   'user', @CurrentUser, 'table', 'Auth_User', 'column', 'Enable'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_User', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '默认当前时间',
   'user', @CurrentUser, 'table', 'Auth_User', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_User', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Auth_User', 'column', 'Remark'
go

/*==============================================================*/
/* Table: Auth_UserRole                                         */
/*==============================================================*/
create table Auth_UserRole (
   Id                   int                  identity,
   UserId               int                  null,
   RoleId               int                  null,
   constraint PK_AUTH_USERROLE primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Auth_UserRole') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Auth_UserRole' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '用户角色中间表', 
   'user', @CurrentUser, 'table', 'Auth_UserRole'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_UserRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_UserRole', 'column', 'UserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户编号',
   'user', @CurrentUser, 'table', 'Auth_UserRole', 'column', 'UserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Auth_UserRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'RoleId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Auth_UserRole', 'column', 'RoleId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色编号',
   'user', @CurrentUser, 'table', 'Auth_UserRole', 'column', 'RoleId'
go



--------------------------------数据
begin tran
declare 
@userId int,
@roleId int,
@menuId int

--用户表
insert into Auth_User(  UserName, UserPass, NickName, Enable, Phone, Email, CreateTime, Creater, Remark)
values('admin','21232f297a57a5a743894a0e4a801fc3','贺晓冬',1,'18751951885','675556820@qq.com',GETDATE(),'admin',NULL)
set @userId=@@IDENTITY;

--角色表
insert into Auth_Role( Name, CreateTime, Creater,Remark)
values('超级管理员',GETDATE(),'admin',NULL)
set @roleId=@@IDENTITY;

--用户角色表
insert into Auth_UserRole( UserId, RoleId)
values(@userId,@roleId)

--菜单表
insert into Auth_Menu(Name, Code, Icon, ParentId, Link, SortIndex, CreateTime, Creater, Remark)
values
('系统设置',NULL,'icon-cog',0,NULL,1,GETDATE(),'admin',NULL)
set @menuId=@@IDENTITY;

--角色菜单表
insert into Auth_RoleMenu(RoleId,MenuId)
values(@roleId,@menuId)

--创建子菜单
insert into Auth_Menu( Name, Code, Icon, ParentId, Link, SortIndex, CreateTime, Creater, Remark)
values('菜单管理','menu','icon-cog',1,'/Menu/Index',1,GETDATE(),'admin',NULL),
('用户管理','user','icon-user_b',1,'/User/Index',2,GETDATE(),'admin',NULL),
('角色管理','role','icon-tree',1,'/Role/Index',3,GETDATE(),'admin',NULL),
('图标管理','icon','icon-group_key',1,'/Icon/Index',4,GETDATE(),'admin',NULL),
('按钮管理','button','icon-layers',1,'/Button/Index',5,GETDATE(),'admin',NULL)
--给角色分配权限
insert into Auth_RoleMenu(RoleId,MenuId)
values(1,2)
insert into Auth_RoleMenu(RoleId,MenuId)
values(1,3)
insert into Auth_RoleMenu(RoleId,MenuId)
values(1,4)
insert into Auth_RoleMenu(RoleId,MenuId)
values(1,5)
insert into Auth_RoleMenu(RoleId,MenuId)
values(1,6)


--创建按钮
--按钮表

insert into Auth_Button( Name, Code, Icon, SortIndex, Remark, CreateTime, Creater)
values
('新增','add','icon-add',1,'新增按钮',GETDATE(),'admin'),
('修改','edit','icon-edit',2,'修改按钮',GETDATE(),'admin'),
('删除','delete','icon-delete',3,'删除按钮',GETDATE(),'admin'),
('分配按钮','allot','icon-link',4,'分配按钮的按钮',GETDATE(),'admin'),
('角色授权','authorize','icon-key',5,'角色授权按钮',GETDATE(),'admin'),
('角色设置','set','icon-user_key',6,'角色设置按钮',GETDATE(),'admin'),
('导入','import','icon-import',7,'导入按钮',GETDATE(),'admin'),
('导出','export','icon-page_excel',8,'导出按钮',GETDATE(),'admin')


--给子菜单分配按钮
insert into Auth_MenuButton values(2,1),(2,2),(2,3),(2,4)


--导入icon
insert into Auth_Icon (Name,CreateTime,Creater) (select IconCssInfo,GETDATE(),CreateBy from AchieveDB.dbo.tbIcons)
commit tran;





 






--根据userid和parentid查询父菜单，替换parentid查询子菜单
select c.Id,c.Name,c.ParentId,c.Link,c.Code,c.Icon from Auth_UserRole a,Auth_RoleMenu b,Auth_Menu c
where a.UserId = 1
and a.RoleId = b.RoleId
and b.MenuId = c.Id
and c.ParentId = 0
order by c.SortIndex


--子菜单对应按钮
select e.Id,e.Code,e.Name,e.SortIndex,e.Icon,e.Creater,e.CreateTime,e.Remark from Auth_UserRole a,Auth_RoleMenu b,Auth_Menu c,Auth_MenuButton d,Auth_Button e
where a.UserId = 1
and a.RoleId = b.RoleId
and b.MenuId = c.Id
and c.Code = 'user'
and b.MenuId = d.MenuId
and d.ButtonId = e.Id
order by e.SortIndex



select * from Auth_MenuButton

use HXDMS
select * from Auth_Icon





