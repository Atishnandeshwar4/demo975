﻿/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :  ApplicationSettingData.sql					
               					
--------------------------------------------------------------------------------------
*/



--To publish new B2B database 
:r .\Script.PostDeploymentB2B.sql

--To publish new Multifront database
--:r .\Script.PostDeploymentMultifront.sql
:r .\Script.PostDeploymentBlank.sql
	


-- Following lookup file checkins are use for incremental build data changes

:r .\Post\ZnodePublishState.sql
:r .\Post\ApplicationSetting_AdminRefresh.sql
:r .\Post\ApplicationSettingData.sql
:r .\Post\ZnodeMenu.sql
:r .\Post\ZnodeAction.sql
:r .\Post\ZnodeGlobalSetting.sql
:r .\Post\ZnodeMessage.sql
:r .\Post\ZnodePaymentGateway.sql
:r .\Post\ZnodeImportTemplateMapping.sql
:r .\Post\ZnodeImportAttributeValidation.sql
:r .\Post\ZnodePaymentType.sql
:r .\Post\ZnodePimAttributeValidation.sql
:r .\Post\SEODetail.sql 
:r .\Post\ZnodeGlobalAttributeFamily.sql
:r .\Post\ZnodeGlobalAttribute.sql
:r .\Post\ZnodeOmsOrderState.sql
:r .\Post\ZnodeOmsOrderLineItemRelationshipType.sql
:r .\Post\ZnodeAccountPermission.sql
:r .\Post\ZnodePublishStateApplicationTypeMapping.sql
:r .\Post\ZnodeCMSMessage.sql
:r .\Post\ZnodeApproverLevel.sql
:r .\Post\ZnodePaymentSetting.sql
:r .\Post\ZnodeOmsPaymentState.sql
:r .\Post\ZnodePublishCatalogLog.sql
:r .\Post\ZnodeEmailTemplate.sql
:r .\Post\ZnodeOmsQuote.sql
:r .\Post\ZnodeOmsOrderStateShowToCustomer.sql
:r .\Post\ZnodeRobotsTxt.sql
:r .\Post\AspNet_SqlCacheTablesForChangeNotification.sql
:r .\Post\ZnodeTimeFormat.sql
:r .\Post\ZnodeBrandDetailLocale.sql
:r .\Post\ZnodeCMSCustomerReview.sql
:r .\Post\ZnodePublishStatus.sql
:r .\Post\ZnodeReportCategories.sql
:r .\Post\ZnodeReportSetting.sql
:r .\Post\ZnodeReportStyleSheets.sql
:r .\Post\ZnodeSavedReportViews.sql
:r .\Post\ZnodePortalFeature.sql
:r .\Post\ZnodePortalAccount.sql
:r .\Post\ZnodePortalApprovalType.sql
:r .\Post\ZnodeDomain.sql
:r .\Post\ZnodeRoleMenu.sql
:r .\Post\ZnodePageSetting.sql
:r .\Post\ZnodeSortSetting.sql
:r .\Post\ZnodePimCatalogCategory.sql
:r .\Post\ZnodeOmsOrderDetails.sql
:r .\Post\ZnodeLocale.sql
:r .\Post\ZnodePortalPixelTracking.sql
:r .\Post\RepairData_ZnodeCMSPortalMessage.sql
:r .\Post\ZnodePimAttribute.sql
:r .\Post\ZnodeCMSWidgets.sql
:r .\Post\ZnodeCurrency.sql
:r .\Post\ZnodePimAttributeValueLocale.sql
:r .\Post\ZnodePimAttributeDefaultValueLocale.sql
:r .\Post\ZnodeUserPortal.sql
:r .\Post\ZnodeMongoIndex.sql
:r .\Post\ZnodeSearchFeature.sql
:r .\Post\ZnodeApplicationCache.sql
:r .\Post\ZnodeActivityLogType.sql
:r .\Post\ZnodeAddress.sql
:r .\Post\ZnodeRmaReturnState.sql
:r .\Post\ZnodeCMSTemplate.sql
:r .\Post\ZnodeCMSContentPages.sql
:r .\Post\ZnodeGiftCard.sql
:r .\Post\ZnodeGlobalAttributeFamilyLocale.sql
:r .\Post\ZnodeGlobalAttributeGroup.sql
:r .\Post\ZnodeGlobalEntity.sql
:r .\Post\ZnodeGlobalEntityFamilyMapper.sql
:r .\Post\ZnodeGlobalFamilyGroupMapper.sql
:r .\Post\ZnodePimProductTypeAssociation.sql
:r .\Post\ZnodeGlobalMediaDisplaySetting.sql
:r .\Post\ZnodePublishWidgetTitleEntity.sql

:r .\Post\ZnodeOmsSavedCartLineItem.sql
:r .\Post\ZnodeOmsCookieMapping.sql
:r .\Post\ZnodeRoleMenuAccessMapper.sql


:r .\Post\ZnodeAttributeInputValidationRule.sql

:r .\Post\ZnodeState.sql 
:r .\Post\ZnodePublishWidgetTitleEntity.sql
:r .\Post\ZnodeTaxPortal.sql
:r .\Post\ZnodeSearchQueryType.sql
:r .\Post\ZnodePimCategoryHierarchy.sql
:r .\Post\ZnodeSearchProfile.sql
:r .\Post\ZnodeSearchProfileAttributeMapping.sql

:r .\Post\ZnodeCMSWidgetProfileVariant.sql 
:r .\Post\ZnodeCMSContentContainer.sql
:r .\Post\ZnodeCMSContainerConfiguration.sql

:r .\Post\ZnodeSearchSynonyms.sql

:r .\Post\ZnodePimFamilyGroupMapper.sql
:r .\Post\ZnodeProductFeedSiteMapType.sql
:r .\Post\ZnodePimProductAttributeMediaScript.sql
:r .\Post\ZnodeManageConditionalDefaultData.sql
:r .\Post\ZnodeMultifront.sql
:r .\Post\ZnodeEmailProvider.sql
:r .\Post\DefaultDataScriptForInternalPurposeOnly.sql
:r .\Post\ZnodePublishImprovement.sql
--Add new post file above this line

:r .\Post\ZnodeOmsSavedCartLineItem.sql
:r .\Post\ZnodePromotionDiscountAttributeMapper.sql
:r .\Post\Znode_Multifront_RecommendationEngine.sql
