#include "stdafx.h"
#include <iostream>

CPyramid::CPyramid()
{
	// 
	Vertices.RedimMatrix(4, 6);
	// ���������� ������ - �������
	Vertices(0, 2) = 3;
	Vertices(0, 5) = 1;
	Vertices(1, 0) = 3;	
	Vertices(1, 3) = 1;	
	Vertices(2, 3) = 3;
	Vertices(2, 4) = 3;
	Vertices(2, 5) = 3;
	for (int i = 0; i < 6; i++)
		Vertices(3, i) = 1;
}

void CPyramid::ColorDraw(CDC& dc, CMatrix& PView, CRect& RW, COLORREF Color)
{
	BYTE red = GetRValue(Color);
	BYTE green = GetGValue(Color);
	BYTE blue = GetBValue(Color);

	// ������� ��������� �� ��� � ���.
	CMatrix MV = CreateViewCoord(PView(0), PView(1), PView(2));
	// �������� ������� �-� �������� � ���
	CMatrix ViewVert = MV * Vertices;

	CRectD RectView;
	// �������� �������������, ������������ ��������.
	GetRect(ViewVert, RectView);
	// �-�� ��������� �� ��� � ���.
	CMatrix MW = SpaceToWindow(RectView, RW);

	CPoint MasVert[6];
	CMatrix V(3);
	V(2) = 1;
	// ������������� �-�� � ��� � ���������� � ������� MasVert.
	for (int i = 0; i < 6; i++)
	{
		V(0) = ViewVert(0, i); // x
		V(1) = ViewVert(1, i); // y
		V = MW * V;
		MasVert[i].x = (int)V(0);
		MasVert[i].y = (int)V(1);
	}

	// ����������� ����������� �-�� � ���������.
	CMatrix ViewCart = SphereToCart(PView);

	CMatrix R1(3), R2(3), VN(3);
	// ����������� �����������.
	double sm;
	for (int i = 0; i < 3; i++)
	{
		// �������� �-�� ����� �������� ���������
		CMatrix VE = Vertices.GetCol(i + 3, 0, 2);
		VE.getInArray();

		int k = (i == 2) ? 0 : i + 1;
		// ������� ����� ���������
		R1 = Vertices.GetCol(i, 0, 2);
		R1.getInArray();
		// ��������� ����� ���������
		R2 = Vertices.GetCol(k, 0, 2);
		R2.getInArray();

		CMatrix V1 = R2 - R1;				// ������ ���������			    
		V1.getInArray();
		CMatrix V2 = VE - R1;				// ������ ����� ���������� � ��������		  
		V2.getInArray();
		VN = VectorMult(V2, V1);			// ��������� ������������ - ������ ������� ������� � �����
		VN.getInArray();
		sm = CosV1V2(VN, ViewCart);			// ������� ����� �������� ������� � ����� � �������� ����� ����������	

		if (sm >= 0)						// ����� ������ (������ ����) - ������ ������� �����
		{
			CPen Pen(PS_SOLID, 2,			// ������ ����
				RGB(sm*red, sm*green, sm*blue));	// ����� ����� ������ � ��������� �� ���� ��������� �������� 
			CPen* pOldPen = dc.SelectObject(&Pen);	// �������� ���� � �������� ���������

			CBrush Brus(RGB(sm*red, sm*green, sm*blue));	// ������ ��������� ����� ��� ����� ����
			CBrush* pOldBrush = dc.SelectObject(&Brus);				// �������� ���� � �������� ������
			CPoint MasVertR[4] = { MasVert[i],MasVert[k],MasVert[k+3],MasVert[i+3] };// ������� ������������
			dc.Polygon(MasVertR, 4);		// ������� �����
			
			dc.SelectObject(pOldBrush);		// ����������� ��������� ������
			dc.SelectObject(pOldPen);
		}
	}

	VN = VectorMult(R1, R2);
	sm = CosV1V2(VN, ViewCart);
	if (sm >= 0)
	{
		CBrush Brus(RGB(sm*0.3, sm*0.3, sm*0.3));
		CBrush* pOldBrush = dc.SelectObject(&Brus);
		dc.Polygon(MasVert, 3);	// ���������
		dc.SelectObject(pOldBrush);
	}
	else 
	{
		CBrush Brus(RGB(sm*0.7, sm*0.7, sm*0.7));
		CBrush* pOldBrush = dc.SelectObject(&Brus);
		dc.Polygon(MasVert+3, 3);	// ������� ���������
		dc.SelectObject(pOldBrush);
	}
}

void CPyramid::GetRect(CMatrix& Vert, CRectD& RectView)
// ��������� ���������� ��������������,������������� �������� 
// �������� �� ��������� XY � ������� ������� ���������
// Ver - ���������� ������ (� ��������)
// RectView - �������� - ������������ �������������
{
	CMatrix V = Vert.GetRow(0);		// x - ����������
	double xMin = V.MinElement();
	double xMax = V.MaxElement();

	V = Vert.GetRow(1);				// y - ����������
	double yMin = V.MinElement();
	double yMax = V.MaxElement();
	RectView.SetRectD(xMin, yMax, xMax, yMin);
}
