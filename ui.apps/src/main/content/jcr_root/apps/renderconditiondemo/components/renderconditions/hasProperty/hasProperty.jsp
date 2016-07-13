<%--
  ==============================================================================
  has property render condition
   A condition that takes a resource path and property name and makes the
   rendering decision based on whether that resource has the property.
  /**
   * The resource path of the resource to evaluate.
   */
  - resourcePath (String)
  /**
   * The property name of the resource to evaluate.
   */
  - propertyName (String)
  ==============================================================================
--%><%
%><%@include file="/libs/granite/ui/global.jsp" %><%
%><%@page session="false"
          import="com.adobe.granite.ui.components.Config,
                  com.adobe.granite.ui.components.rendercondition.RenderCondition,
                  com.adobe.granite.ui.components.rendercondition.SimpleRenderCondition,
                  com.adobe.granite.ui.components.ExpressionHelper,
                  com.adobe.granite.ui.components.ExpressionResolver,
                  org.apache.sling.api.resource.ResourceResolver,
                  org.apache.sling.api.resource.Resource"%>
<%
    ResourceResolver resolver = resourceResolver;
    ExpressionHelper expressionHelper = new ExpressionHelper(sling.getService(ExpressionResolver.class), pageContext);

    boolean vote = false;

    if (resolver != null) {
        /*
         * Get the component helper and the "propertyName" and "resourcePath"
         * properties of the current granite:rendercondition resource. Use the
         * ExpressionHelper to evaluate the JSP Expression Language (EL)
         * expression (e.g. ${param.resourcePath} or ${requestPathInfo.suffix}).
         */
        Config cfg = new Config(resource);
        String propertyName = cfg.get("propertyName", String.class);
        String resourcePath = expressionHelper.getString(cfg.get("resourcePath", String.class));

        if (resourcePath != null) {
            Resource res = resolver.getResource(resourcePath);
            if (res != null) {
                ValueMap properties = res.getValueMap();
                Object property = properties.get(propertyName);

                /* The property exists, show the widget */
                if (property != null) {
                    vote = true;
                }
            }
        }
    }

    /* Display or hide the widget */
    request.setAttribute(RenderCondition.class.getName(), new SimpleRenderCondition(vote));
%>
