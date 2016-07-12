<%--
  ==============================================================================
  day of the week render condition
   A condition that takes a String array of days and compares against the
   current day for the decision.
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
                  java.text.SimpleDateFormat"%>
<%
    /*
     * Get the component helper and the "days" property of the current
     * granite:rendercondition resource
     */
    Config cfg = cmp.getConfig();
    String[] days = cfg.get("days", String[].class);

    boolean vote = false;

    /* Get today's day and compare against the "days" property */
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

    /* Display or hide the widget */
    request.setAttribute(RenderCondition.class.getName(), new SimpleRenderCondition(vote));
%>
