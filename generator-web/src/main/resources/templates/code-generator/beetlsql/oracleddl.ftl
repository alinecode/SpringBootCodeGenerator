  CREATE TABLE "${classInfo.tableName}" 
   (  
<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0><#list classInfo.fieldList as fieldItem >    "${fieldItem.columnName}" ${fieldItem.oracleFieldType},<#if fieldItem_has_next></#if>
    </#list>
</#if>
    PRIMARY KEY ("${classInfo.fieldList[0].columnName}") ENABLE
   );
 
    <#list classInfo.fieldList as fieldItem >
      COMMENT ON COLUMN "${classInfo.tableName}"."${fieldItem.columnName}" IS '${fieldItem.fieldComment}';<#if fieldItem_has_next></#if>
    </#list>
      COMMENT ON TABLE "${classInfo.tableName}" IS '${classInfo.classComment}';
      
-- 默认排名第一个的是主键      
-- 如果oracle需要自增，请自行搜索自增方法(版本11和12不同)。
-- 参考： https://stackoverflow.com/questions/11296361/how-to-create-id-with-auto-increment-on-oracle