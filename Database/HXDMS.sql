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
   '��ť��', 
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
   'ͼ����',
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
   'ͼ�����',
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
   'ͼ��
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
   '����',
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
   '����ʱ��',
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
   '������',
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
   '��ע',
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
   'ͼ������',
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
   '����ʱ��',
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
   '������',
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
   '�˵���', 
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
   '�˵����',
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
   '�˵�����',
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
   '�˵�����',
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
   '�˵�ͼ��',
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
   '�ϼ��˵����',
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
   '�˵�����',
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
   '����',
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
   '����ʱ��',
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
   '������',
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
   '��ע',
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
   '�˵���ť��', 
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
   '��ɫ��', 
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
   '��ɫ����',
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
   'Ĭ�ϵ�ǰʱ��',
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
   '������',
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
   '��ע',
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
   '��ɫ�˵���', 
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
   '��ɫ���',
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
   '�˵����',
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
   '�û���', 
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
   '��¼��',
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
   '��¼����',
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
   '�ǳ�',
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
   'Ĭ�Ͽ���',
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
   'Ĭ�ϵ�ǰʱ��',
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
   '��ע',
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
   '�û���ɫ�м��', 
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
   '�û����',
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
   '��ɫ���',
   'user', @CurrentUser, 'table', 'Auth_UserRole', 'column', 'RoleId'
go



--------------------------------����
begin tran
declare 
@userId int,
@roleId int,
@menuId int

--�û���
insert into Auth_User(  UserName, UserPass, NickName, Enable, Phone, Email, CreateTime, Creater, Remark)
values('admin','21232f297a57a5a743894a0e4a801fc3','������',1,'18751951885','675556820@qq.com',GETDATE(),'admin',NULL)
set @userId=@@IDENTITY;

--��ɫ��
insert into Auth_Role( Name, CreateTime, Creater,Remark)
values('��������Ա',GETDATE(),'admin',NULL)
set @roleId=@@IDENTITY;

--�û���ɫ��
insert into Auth_UserRole( UserId, RoleId)
values(@userId,@roleId)

--�˵���
insert into Auth_Menu(Name, Code, Icon, ParentId, Link, SortIndex, CreateTime, Creater, Remark)
values
('ϵͳ����',NULL,'icon-cog',0,NULL,1,GETDATE(),'admin',NULL)
set @menuId=@@IDENTITY;

--��ɫ�˵���
insert into Auth_RoleMenu(RoleId,MenuId)
values(@roleId,@menuId)

--�����Ӳ˵�
insert into Auth_Menu( Name, Code, Icon, ParentId, Link, SortIndex, CreateTime, Creater, Remark)
values('�˵�����','menu','icon-cog',1,'/Menu/Index',1,GETDATE(),'admin',NULL),
('�û�����','user','icon-user_b',1,'/User/Index',2,GETDATE(),'admin',NULL),
('��ɫ����','role','icon-tree',1,'/Role/Index',3,GETDATE(),'admin',NULL),
('ͼ�����','icon','icon-group_key',1,'/Icon/Index',4,GETDATE(),'admin',NULL),
('��ť����','button','icon-layers',1,'/Button/Index',5,GETDATE(),'admin',NULL)
--����ɫ����Ȩ��
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


--������ť
--��ť��

insert into Auth_Button( Name, Code, Icon, SortIndex, Remark, CreateTime, Creater)
values
('����','add','icon-add',1,'������ť',GETDATE(),'admin'),
('�޸�','edit','icon-edit',2,'�޸İ�ť',GETDATE(),'admin'),
('ɾ��','delete','icon-delete',3,'ɾ����ť',GETDATE(),'admin'),
('���䰴ť','allot','icon-link',4,'���䰴ť�İ�ť',GETDATE(),'admin'),
('��ɫ��Ȩ','authorize','icon-key',5,'��ɫ��Ȩ��ť',GETDATE(),'admin'),
('��ɫ����','set','icon-user_key',6,'��ɫ���ð�ť',GETDATE(),'admin'),
('����','import','icon-import',7,'���밴ť',GETDATE(),'admin'),
('����','export','icon-page_excel',8,'������ť',GETDATE(),'admin')


--���Ӳ˵����䰴ť
insert into Auth_MenuButton values(2,1),(2,2),(2,3),(2,4)


--����icon
insert into Auth_Icon (Name,CreateTime,Creater) (select IconCssInfo,GETDATE(),CreateBy from AchieveDB.dbo.tbIcons)
commit tran;





 






--����userid��parentid��ѯ���˵����滻parentid��ѯ�Ӳ˵�
select c.Id,c.Name,c.ParentId,c.Link,c.Code,c.Icon from Auth_UserRole a,Auth_RoleMenu b,Auth_Menu c
where a.UserId = 1
and a.RoleId = b.RoleId
and b.MenuId = c.Id
and c.ParentId = 0
order by c.SortIndex


--�Ӳ˵���Ӧ��ť
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





