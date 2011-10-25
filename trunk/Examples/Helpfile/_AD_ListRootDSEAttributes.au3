#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; ��ȡ����RootDSE���Ե��б�
; *****************************************************************************
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

; ��ȡ����RootDSE���Լ��������б�
Global $aRootDSE[23][2] = [[""],["configurationNamingContext"],["currentTime"],["defaultNamingContext"], _
		["dnsHostName"],["domainControllerFunctionality"],["domainFunctionality"],["dsServiceName"],["forestFunctionality"], _
		["highestCommittedUSN"],["isGlobalCatalogReady"],["isSynchronized"],["LDAPServiceName"],["namingContexts"], _
		["rootDomainNamingContext"],["schemaNamingContext"],["serverName"],["subschemaSubentry"],["supportedCapabilities"], _
		["supportedControl"],["supportedLDAPPolicies"],["supportedLDAPVersion"],["supportedSASLMechanisms"]]
Global $aTemp = _AD_ListRootDSEAttributes()
Global $iCount
For $iCount = 1 To $aTemp[0]
	$aRootDSE[$iCount][1] = $aTemp[$iCount]
Next
$aRootDSE[0][0] = $aTemp[0]
_arraydisplay($aRootDSE, "Active Directory Functions", -1, 0, "<")

; �ر�Active Directory����
_AD_Close()

