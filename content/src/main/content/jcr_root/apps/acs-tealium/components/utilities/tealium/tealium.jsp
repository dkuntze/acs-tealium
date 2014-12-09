<%--
  #%L
  ACS AEM Commons Package
  %%
  Copyright (C) 2013 Adobe
  %%
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  #L%
  --%>
<%@page session="false" import="org.apache.sling.api.resource.Resource,
                org.apache.sling.api.resource.ValueMap,
                org.apache.sling.api.resource.ResourceUtil,
                com.day.cq.wcm.webservicesupport.Configuration,
                com.day.cq.wcm.webservicesupport.ConfigurationManager" %>
<%@include file="/libs/foundation/global.jsp" %><%
    String[] services = pageProperties.getInherited("cq:cloudserviceconfigs", new String[]{});
    ConfigurationManager cfgMgr = sling.getService(ConfigurationManager.class);
    String account = null;
    String profile = null;
    String environment = null;
    boolean synchronous = false;

    if(cfgMgr != null) {
        Configuration cfg = cfgMgr.getConfiguration("tealium", services);
        if(cfg != null) {
            account = cfg.get("accountName", "");
            profile = cfg.get("profile", "main");
            environment = cfg.get("environment", "dev");
            synchronous = cfg.get("synchronous", false);
        }
    }

    StringBuffer urlParams = new StringBuffer();
    urlParams.append(account).append("/");
    urlParams.append(profile).append("/");
    urlParams.append(environment);
%>

<script type="text/javascript">
    var utag_data = {
    }
</script>


<%
    if (synchronous) {
        //synchronous loading script (not default)
        out.println("<script type=\"text/javascript\" src=\"//tags.tiqcdn.com/utag/" + urlParams + "/utag.js\"></script>");
    } else {
%>
    <script type="text/javascript">
        (function(a,b,c,d){
            a='//tags.tiqcdn.com/utag/<%= urlParams.toString() %>/utag.js';
            b=document;c='script';d=b.createElement(c);d.src=a;d.type='text/java'+c;d.async=true;
            a=b.getElementsByTagName(c)[0];a.parentNode.insertBefore(d,a);
        })();
    </script>
<%
    }
%>

