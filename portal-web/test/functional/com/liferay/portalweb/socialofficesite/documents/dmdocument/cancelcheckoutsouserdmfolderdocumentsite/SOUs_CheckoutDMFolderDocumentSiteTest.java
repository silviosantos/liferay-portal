/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package com.liferay.portalweb.socialofficesite.documents.dmdocument.cancelcheckoutsouserdmfolderdocumentsite;

import com.liferay.portalweb.portal.BaseTestCase;
import com.liferay.portalweb.portal.util.RuntimeVariables;

/**
 * @author Brian Wing Shun Chan
 */
public class SOUs_CheckoutDMFolderDocumentSiteTest extends BaseTestCase {
	public void testSOUs_CheckoutDMFolderDocumentSite()
		throws Exception {
		selenium.selectWindow("null");
		selenium.selectFrame("relative=top");
		selenium.open("/user/socialoffice01/so/dashboard/");
		assertEquals(RuntimeVariables.replace("Sites"),
			selenium.getText("//div[@id='so-sidebar']/h3"));
		assertTrue(selenium.isVisible("//input[@class='search-input']"));
		selenium.type("//input[@class='search-input']",
			RuntimeVariables.replace("Open"));
		Thread.sleep(1000);
		assertEquals(RuntimeVariables.replace("Open Site Name"),
			selenium.getText(
				"//li[contains(@class, 'social-office-enabled')]/span[2]/a"));
		selenium.clickAt("//li[contains(@class, 'social-office-enabled')]/span[2]/a",
			RuntimeVariables.replace("Open Site Name"));
		selenium.waitForPageToLoad("30000");
		assertEquals(RuntimeVariables.replace("Documents"),
			selenium.getText("//nav/ul/li[contains(.,'Documents')]/a/span"));
		selenium.clickAt("//nav/ul/li[contains(.,'Documents')]/a/span",
			RuntimeVariables.replace("Documents"));
		selenium.waitForPageToLoad("30000");
		assertEquals(RuntimeVariables.replace("DM Folder Name"),
			selenium.getText(
				"//a[contains(@class,'document-link')]/span[@class='entry-title']"));
		selenium.clickAt("//a[contains(@class,'document-link')]/span[@class='entry-title']",
			RuntimeVariables.replace("DM Folder Name"));
		selenium.waitForText("//li[@class='folder selected']/a",
			"DM Folder Name");
		assertEquals(RuntimeVariables.replace("DM Folder Name"),
			selenium.getText("//li[@class='folder selected']/a"));
		assertEquals(RuntimeVariables.replace("Home"),
			selenium.getText(
				"//div[@class='document-library-breadcrumb']/ul/li/span/a"));
		assertEquals(RuntimeVariables.replace(
				"Access these files offline using Liferay Sync."),
			selenium.getText("//div[@id='_20_syncNotificationContent']/a"));
		assertTrue(selenium.isVisible("//span[@class='document-thumbnail']/img"));
		assertEquals(RuntimeVariables.replace("DM Folder Document Title"),
			selenium.getText(
				"//a[contains(@class,'document-link')]/span[@class='entry-title']"));
		selenium.clickAt("//a[contains(@class,'document-link')]/span[@class='entry-title']",
			RuntimeVariables.replace("DM Folder Document Title"));
		selenium.waitForPageToLoad("30000");
		assertEquals(RuntimeVariables.replace("DM Folder Document Title"),
			selenium.getText("//h1[@class='header-title']/span"));
		assertEquals(RuntimeVariables.replace("\u00ab Back"),
			selenium.getText("//span[@class='header-back-to']/a"));
		assertEquals(RuntimeVariables.replace("Checkout"),
			selenium.getText(
				"//span[@class='aui-toolbar-content']/button[contains(.,'Checkout')]/span[2]"));
		selenium.clickAt("//span[@class='aui-toolbar-content']/button[contains(.,'Checkout')]/span[2]",
			RuntimeVariables.replace("Checkout"));
		selenium.waitForPageToLoad("30000");
		assertEquals(RuntimeVariables.replace(
				"Your request completed successfully."),
			selenium.getText("//div[@class='portlet-msg-success']"));
		assertTrue(selenium.isPartialText(
				"//div[@class='portlet-msg-lock portlet-msg-success']",
				"You now have a lock on this document. No one else can edit this document until you unlock it."));
	}
}