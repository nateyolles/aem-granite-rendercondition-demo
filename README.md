# AEM Granite Render Condition Demo

This project demonstrates how to use Granite render conditions to evaluate whether a Granite widget will display. This sample project contains a custom form that shows and hides fields based on the following conditions:

- selectors
- suffixes
- querystring parameters
- cookies
- request headers
- JCR privileges
- custom render condition based off the current day
- customer render condition based off the resource path evaluated with JSP Expression Language (EL)

See [http://www.nateyolles.com/blog/2016/07/aem-granite-custom-render-conditions](http://www.nateyolles.com/blog/2016/07/aem-granite-custom-render-conditions) for a detailed description of how Granite render conditions work.

## Modules

The main parts of the template are:

* ui.apps: contains the /apps (and /etc) parts of the project, ie JS&CSS clientlibs, components, and templates as well as the sample form using Granite Widgets an render conditions, custom admin UI, and custom render condition
* ui.content: contains a sample page at `/content/renderconditiondemo/en.html` to test the lock condition

## How to view the demo

Navigate to the custom admin UI at `AEM > Tools > Operations > Render Condition Demo` or go directly to [http://localhost:4502/apps/renderconditiondemo/components/admin/tools/operations/renderconditiondemo.html](http://localhost:4502/apps/renderconditiondemo/components/admin/tools/operations/renderconditiondemo.html). This is the custom form with each widget utilizing a different render condition.

The links on the form will refresh this same page with different selectors, suffixes, querystring parameters, user-agent headers, cookies and user impersonations. Try clicking on those links, spoofing your user-agent header or using multiple browsers, and lock/unlock "/content/renderconditiondemo/en.html" to witness the render conditions in action. There are many Granite widgets defined on the page, however, only the widgets that satisfy their render conditions will display.

View the custom Day Render Condition at [http://localhost:4502/crx/de/index.jsp#/apps/renderconditiondemo/components/renderconditions/day/day.jsp](http://localhost:4502/crx/de/index.jsp#/apps/renderconditiondemo/components/renderconditions/day/day.jsp). This render condition demonstrates how to show/hide a widget based off the current day.

View the custom Has Property Render Condition at [http://localhost:4502/crx/de/index.jsp#/apps/renderconditiondemo/components/renderconditions/hasProperty/hasProperty.jsp](http://localhost:4502/crx/de/index.jsp#/apps/renderconditiondemo/components/renderconditions/hasProperty/hasProperty.jsp). This custom Render Condition utilizes the ExpressionHelper to evaluate an Expression Language expression such as `${param.resourcePath}` or `${requestPathInfo.suffix}`.

The settings are located in the Granite Widgets at [http://localhost:4502/crx/de/index.jsp#/apps/renderconditiondemo/components/admin/tools/operations/renderconditiondemo](http://localhost:4502/crx/de/index.jsp#/apps/renderconditiondemo/components/admin/tools/operations/renderconditiondemo). Notice the `granite:rendercondition` nodes under each widget, their resource type, and the JSP Expression Language used in the properties.

## How to build

To build all the modules run in the project root directory the following command with Maven 3:

    mvn clean install

If you have a running AEM instance you can build and package the whole project and deploy into AEM with  

    mvn clean install -PautoInstallPackage

Or to deploy it to a publish instance, run

    mvn clean install -PautoInstallPackagePublish

Or alternatively

    mvn clean install -PautoInstallPackage -Daem.port=4503

Or to deploy only the bundle to the author, run

    mvn clean install -PautoInstallBundle

## Maven settings

The project comes with the auto-public repository configured. To setup the repository in your Maven settings, refer to:

    http://helpx.adobe.com/experience-manager/kb/SetUpTheAdobeMavenRepository.html

## Other

### Archetype

````
mvn archetype:generate \
 -DarchetypeGroupId=com.adobe.granite.archetypes \
 -DarchetypeArtifactId=aem-project-archetype \
 -DarchetypeVersion=11-SNAPSHOT \
 -DarchetypeRepository=https://repo.adobe.com/nexus/content/groups/public/ \
 -DgroupId=com.nateyolles.aem \
 -DartifactId=aem-granite-rendercondition-demo \
 -Dversion=1.0-SNAPSHOT \
 -Dpackage=com.nateyolles.aem.renderconditiondemo \
 -DappsFolderName=renderconditiondemo \
 -DartifactName="AEM Granite Render Condition Demo" \
 -DcomponentGroupName="AEM Granite Render Condition Demo" \
 -DcontentFolderName=renderconditiondemo \
 -DcssId=renderconditiondemo \
 -DpackageGroup=renderconditiondemo \
 -DsiteName="AEM Render Condition Demo"
````