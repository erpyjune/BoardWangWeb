<#-- 변수 assign 간소화 -->
<#function get val, def>
    <#if val?has_content>
        <#return val>
    <#else>
        <#return def>
    </#if>
</#function>

<#assign sortField = "">
<#assign sortField = get((sort)!, "") />

<#if sortField == "">
    <#assign sortFieldName = "댓글 많은 순서">
<#elseif sortField == "view">
    <#assign sortFieldName = "조회 많은 순서">
<#elseif sortField == "suggest">
    <#assign sortFieldName = "추천 많은 순서">
<#elseif sortField == "reply">
    <#assign sortFieldName = "댓글 많은 순서">
</#if>
