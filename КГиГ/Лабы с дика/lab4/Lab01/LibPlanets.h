#ifndef LIBPLANETS
#define LIBPLANETS 1
const double pi = 3.14159;


struct CSizeD
{
	double cx;
	double cy;
};
//-------------------------------------------------------------------------------
struct CRectD
{
	double left;
	double top;
	double right;
	double bottom;
	CRectD() { left = top = right = bottom = 0; };
	CRectD(double l, double t, double r, double b);
	void SetRectD(double l, double t, double r, double b);
	CSizeD SizeD();		// ���������� �������(������, ������) �������������� 
};
//-------------------------------------------------------------------------------

CMatrix CreateTranslate2D(double dx, double dy);
CMatrix CreateRotate2D(double fi);
CMatrix SpaceToWindow(CRectD& rs, CRect& rw);
void SetMyMode(CDC& dc, CRectD& RS, CRect& RW);  

/////////////////  class CSunSystem //////////////////////////////////////////////

class CSunSystem
{
	CRect Sun;		   // ������������� ������
	CRect Earth;	   // ������������� �����
	CRect Moon;		   // ������������� ����
	CRect Mars;
	CRect Test;
	CRect TMoon;

	CRect EarthOrbit;  // �������������, ��������� ������ ������ �����
	CRect MoonOrbit;   // �������������, ��������� ������ ������ ����
	CRect MarsOrbit;
	CRect TestOrbit;
	CRect TMoonOrbit;


	CMatrix TMCoords;
	CMatrix ECoords;   // ������� ���������� ����� � �� ������ ( x,y,1)
	CMatrix MCoords;   // ������� ���������� ���� � �� ����� ( x,y,1)
	CMatrix VCoords;
	CMatrix TCoords;
	CRect RW;		   // ������������� � ����
	CRectD RS;		   // ������������� ������� � ���
	double wEarth;	   // ������� �������� ����� ������������ ������, ����./���.
	double wMoon;	   // ������� �������� ����� ������������ ������, ����./���.
	double wMars;
	double wTest;
	double wTMoon;
	double fiE;		   // ������� ��������� ����� � ������� ��������� ������, ����
	double fiM;		   // ������� ��������� ���� � ������� ��������� �����, ����
	double fiV;

	double dt;		   // �������� �������������, ���.
public:
	CSunSystem();
	void SetDT(double dtx) { dt = dtx; };	// ��������� ��������� �������������
	void SetNewCoords();					// ��������� ����� ���������� ������
	void GetRS(CRectD& RSX);				// ���������� ������� ������� � ������� ��
	CRect GetRW() { return RW; };			// ���������� ������� ������� � ����	
	void Draw(CDC& dc);						// ��������� ��� ���������������� ��������� ���������
};


#endif

