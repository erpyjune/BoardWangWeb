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
<#elseif sortField == "recency">
    <#assign sortFieldName = "">
</#if>


<#assign dateOpt = "">
<#assign dateOpt = get((date_opt)!, "") />
<#if dateOpt == "" >
    <#assign dateOptName = "최신글 순서">
<#elseif dateOpt == "30min">
    <#assign dateOptName = "최근 30분 동안">
<#elseif dateOpt == "1hour">
    <#assign dateOptName = "최근 1시간 동안">
<#elseif dateOpt == "3hour">
    <#assign dateOptName = "최근 3시간 동안">
<#elseif dateOpt == "6hour">
    <#assign dateOptName = "최근 6시간 동안">
<#elseif dateOpt == "12hour">
    <#assign dateOptName = "최근 12시간 동안">
<#elseif dateOpt == "24hour">
    <#assign dateOptName = "최근 24시간 동안">
<#else>
    <#assign dateOptName = "최신글 순서">
</#if>