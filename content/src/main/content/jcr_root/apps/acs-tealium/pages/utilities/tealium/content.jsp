<%@page session="false"
        contentType="text/html"
        pageEncoding="utf-8"
        import="com.day.cq.i18n.I18n"%><%
%><%@taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %><%
%><cq:defineObjects/>
<%@include file="/libs/cq/cloudserviceconfigs/components/configpage/init.jsp"%>
<%@include file="/libs/cq/cloudserviceconfigs/components/configpage/hideeditok.jsp"%>
<cq:includeClientLib categories="cq.analytics,cq.personalization" />
<%
    I18n i18n = new I18n(request);
    String resPath = resource.getPath().replace("/jcr:content", "");
%>
    <div>
        <h3>Tealium</h3>
        <ul>
            <li><div class="li-bullet"><strong>Account Name: </strong><br><%= xssAPI.encodeForHTML(properties.get("accountName", "")).replaceAll("\\&\\#xa;","<br>") %></div></li>
            <li><div class="li-bullet"><strong>Environment: </strong><br><%= xssAPI.encodeForHTML(properties.get("environment", "")).replaceAll("\\&\\#xa;","<br>") %></div></li>
            <li><div class="li-bullet"><strong>Profile: </strong><br><%= xssAPI.encodeForHTML(properties.get("profile", "")).replaceAll("\\&\\#xa;","<br>") %></div></li>
            <li><div class="li-bullet"><strong>Asynchronous: </strong><br><%= properties.get("synchronous", false) %></div></li>
            <li class="config-successful-message when-config-successful" style="display: none">Tealium Configured</li>
        </ul>
    </div>