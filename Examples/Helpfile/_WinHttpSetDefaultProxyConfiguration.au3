19
 _WinHttpSetDefaultProxyConfiguration      _WinHttpSetDefaultProxyConfiguration   
����Ĭ�ϵ�WinHTTP�������� 
 
#Include <WinHTTP.au3> 
_WinHttpSetDefaultProxyConfiguration( $iAccessType, $Proxy, $ProxyBypass ) 
 
   
����    
 $iAccessType  ����Ȩ�����͵�����ֵ  
 $Proxy  ��������������б���ַ���  
 $ProxyBypass  ����������·�б���ַ���  
   
����ֵ �ɹ�: ����1������@errorΪ0 
ʧ��: ����0������@error�ҵ���Ϊ1ʱ��ʾDllCallʧ�� 
   
���  _WinHttpDetectAutoProxyConfigUrl ,  _WinHttpGetDefaultProxyConfiguration ,  _WinHttpGetIEProxyConfigForCurrentUser 
   
�ο�  ����MSDN֪ʶ����WinHttpSetDefaultProxyConfiguration�������Ϣ  
   
