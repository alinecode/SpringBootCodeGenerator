CREATE TABLE ${classInfo.tableName} (
<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0><#list classInfo.fieldList as fieldItem >    "${fieldItem.columnName}" ${fieldItem.sqlservFieldType},<#if fieldItem_has_next></#if>
    </#list>
</#if>
) GO

<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
ALTER TABLE [dbo].[${classInfo.tableName}] SET (LOCK_ESCALATION = TABLE)
GO
<#list classInfo.fieldList as fieldItem >    
EXEC sp_addextendedproperty
'MS_Description', N'${fieldItem.fieldComment}',
'SCHEMA', N'dbo',
'TABLE', N'${classInfo.tableName}',
'COLUMN', N'${fieldItem.columnName}'
GO
    </#list>
    
EXEC sp_addextendedproperty
'MS_Description', N'${classInfo.classComment}',
'SCHEMA', N'dbo',
'TABLE', N'${classInfo.tableName}'    
    
</#if>

-- 没有处理 UNIQUE 等
-- 没有处理除了主键约束外的其他约束
-- 全部默认dbo