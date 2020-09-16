CREATE TABLE ${classInfo.tableName} (
<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0><#list classInfo.fieldList as fieldItem >    ${fieldItem.columnName} ${fieldItem.mysqlFieldType}<#if fieldItem_has_next>,</#if>
    </#list>
</#if>
) COMMENT='${classInfo.classComment}'

-- 自增需自行将id换成int