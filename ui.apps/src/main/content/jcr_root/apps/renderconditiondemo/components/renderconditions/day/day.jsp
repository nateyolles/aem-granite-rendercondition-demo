<%--
  ==============================================================================
  Day Rendercondition
   A condition that takes a String array of days and compares agains the current
   day for the decision.
  /**
   * The days to evaluate.
   */
  - days (String[])
  ==============================================================================
--%><%
%><%@include file="/libs/granite/ui/global.jsp" %><%
%><%@page session="false"
          import="com.adobe.granite.ui.components.Config,
                  com.adobe.granite.ui.components.rendercondition.RenderCondition,
                  com.adobe.granite.ui.components.rendercondition.SimpleRenderCondition,
                  java.util.Date,
                  java.text.SimpleDateFormat" %>
<%
    Config cfg = cmp.getConfig();
    String[] days = cfg.get("days", String[].class);
    boolean vote = false;

    if (days != null && days.length > 0) {
        Date now = new Date();
        SimpleDateFormat simpleDateformat = new SimpleDateFormat("EEEE");
        String currentDay = simpleDateformat.format(now);

        for (String day : days) {
            if (day.equals(currentDay)) {
                vote = true;
                break;
            }
        }

    }

    request.setAttribute(RenderCondition.class.getName(), new SimpleRenderCondition(vote));
%>