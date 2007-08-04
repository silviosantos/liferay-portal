<%
/**
 * Copyright (c) 2000-2007 Liferay, Inc. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
%>

<%@ include file="/html/portlet/enterprise_admin/init.jsp" %>

<%
UserSearch searchContainer = (UserSearch)request.getAttribute("liferay-ui:search:searchContainer");

UserDisplayTerms displayTerms = (UserDisplayTerms)searchContainer.getDisplayTerms();
%>

<table class="liferay-table">
<tr>
	<td>
		<liferay-ui:message key="first-name" />
	</td>
	<td>
		<liferay-ui:message key="middle-name" />
	</td>
	<td>
		<liferay-ui:message key="last-name" />
	</td>
</tr>
<tr>
	<td>
		<input name="<portlet:namespace /><%= UserDisplayTerms.FIRST_NAME %>" size="20" type="text" value="<%= displayTerms.getFirstName() %>" />
	</td>
	<td>
		<input name="<portlet:namespace /><%= UserDisplayTerms.MIDDLE_NAME %>" size="20" type="text" value="<%= displayTerms.getMiddleName() %>" />
	</td>
	<td>
		<input name="<portlet:namespace /><%= UserDisplayTerms.LAST_NAME %>" size="20" type="text" value="<%= displayTerms.getLastName() %>" />
	</td>
</tr>
<tr>
	<td>
		<liferay-ui:message key="screen-name" />
	</td>
	<td>
		<liferay-ui:message key="email-address" />
	</td>

	<c:choose>
		<c:when test="<%= portletName.equals(PortletKeys.ENTERPRISE_ADMIN) %>">
			<td>
				<liferay-ui:message key="active" />
			</td>
		</c:when>
		<c:otherwise>
			<td></td>
		</c:otherwise>
	</c:choose>
</tr>
<tr>
	<td>
		<input name="<portlet:namespace /><%= UserDisplayTerms.SCREEN_NAME %>" size="20" type="text" value="<%= displayTerms.getScreenName() %>" />
	</td>
	<td>
		<input name="<portlet:namespace /><%= UserDisplayTerms.EMAIL_ADDRESS %>" size="20" type="text" value="<%= displayTerms.getEmailAddress() %>" />
	</td>

	<c:choose>
		<c:when test="<%= portletName.equals(PortletKeys.ENTERPRISE_ADMIN) %>">
			<td>
				<select name="<portlet:namespace /><%= UserDisplayTerms.ACTIVE %>">
					<option <%= displayTerms.isActive() ? "selected" : "" %> value="1"><liferay-ui:message key="yes" /></option>
					<option <%= !displayTerms.isActive() ? "selected" : "" %> value="0"><liferay-ui:message key="no" /></option>
				</select>
			</td>
		</c:when>
		<c:otherwise>
			<td></td>
		</c:otherwise>
	</c:choose>
</tr>
</table>

<br />

<select name="<portlet:namespace /><%= UserDisplayTerms.AND_OPERATOR %>">
	<option <%= displayTerms.isAndOperator() ? "selected" : "" %> value="1"><liferay-ui:message key="and" /></option>
	<option <%= !displayTerms.isAndOperator() ? "selected" : "" %> value="0"><liferay-ui:message key="or" /></option>
</select>

<input type="submit" value="<liferay-ui:message key="search" />" />

<c:if test="<%= renderRequest.getWindowState().equals(WindowState.NORMAL) %>">
	<c:if test="<%= portletName.equals(PortletKeys.ENTERPRISE_ADMIN) || portletName.equals(PortletKeys.LOCATION_ADMIN) || portletName.equals(PortletKeys.ORGANIZATION_ADMIN) %>">
		<c:if test="<%= (portletName.equals(PortletKeys.ENTERPRISE_ADMIN) && PortalPermission.contains(permissionChecker, ActionKeys.ADD_USER)) ||
						(portletName.equals(PortletKeys.LOCATION_ADMIN) && LocationPermission.contains(permissionChecker, displayTerms.getOrganizationId(), ActionKeys.ADD_USER)) ||
						(portletName.equals(PortletKeys.ORGANIZATION_ADMIN) && OrganizationPermission.contains(permissionChecker, displayTerms.getOrganizationId(), ActionKeys.ADD_USER)) %>">
			<input type="button" value="<liferay-ui:message key="add-user" />" onClick="self.location = '<portlet:renderURL windowState="<%= WindowState.MAXIMIZED.toString() %>"><portlet:param name="struts_action" value="/enterprise_admin/edit_user" /></portlet:renderURL>';" />
		</c:if>
	</c:if>
</c:if>