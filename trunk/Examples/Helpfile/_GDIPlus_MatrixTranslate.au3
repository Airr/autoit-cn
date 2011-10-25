
#include  <GUIConstantsEx.au3>
#include  <GDIPlus.au3>

; ��������
$hWnd = GUICreate("GDI+ ʾ��", 400, 300)
GUISetState()

; Start GDI+
_GDIPlus_Startup()
$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hWnd)

$hMatrix = _GDIPlus_MatrixCreate()
; �������������ƶ�������
_GDIPlus_MatrixTranslate($hMatrix, 200, 150)
_GDIPlus_MatrixRotate($hMatrix, 45)
_GDIPlus_GraphicsSetTransform($hGraphics, $hMatrix)

$hPen = _GDIPlus_PenCreate(0xFF00FF00, 10)

_GDIPlus_GraphicsClear($hGraphics)
; ����GUI���Ͻ�, �����Ѿ��ƶ��˾���, ���󽫳�����GUI����
_GDIPlus_GraphicsDrawRect($hGraphics, -50, -50, 100, 100, $hPen)


Do
Until GUIGetMsg() = $GUI_EVENT_CLOSE

; �����Դ
_GDIPlus_PenDispose($hPen)
_GDIPlus_MatrixDispose($hMatrix)
_GDIPlus_GraphicsDispose($hGraphics)
_GDIPlus_Shutdown()

