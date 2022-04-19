#pragma once
#include <fstream>
using namespace std;

class CMatrix
{
public:
	// ����.
	double **array;
	int n_rows = 1;							// ����� �����
	int n_cols = 1;							// ����� ��������
public:
	// ������������/�����������.
	CMatrix();							// ����������� �� ��������� (1 �� 1)
	CMatrix(int, int);		    		// �����������
	CMatrix(int);						// ����������� ������� (���� �������)
	CMatrix(const CMatrix&);			// ����������� �����������
	~CMatrix();

	// ���������� ����������.

	// ����� �������� ������� �� �������.
	double& operator()(int, int);
	// ����� �������� ������� �� �������.
	double& operator()(int);
	// �������� "���������":    M1=M2.
	CMatrix operator=(const CMatrix&);
	// �������� "������������": �1*�2.
	CMatrix operator*(CMatrix&);
	// �������� "+": M1+M2.
	CMatrix operator+(CMatrix&);
	// �������� "-": M1-M2.
	CMatrix operator-(CMatrix&);

	// ������
	void getInArray();
	// ���������� ����� �����.
	int rows()const { return n_rows; };
	// ���������� ����� ��������.
	int cols()const { return n_cols; };
	// ���������� �������, ����������������� � �������.
	CMatrix Transp();
	// ���������� ������ �� ������.
	CMatrix GetRow(int);
	CMatrix GetRow(int, int, int);
	// ���������� ������� �� ������.
	CMatrix GetCol(int);
	CMatrix GetCol(int, int, int);
	// �������� ������ ������� � ������������ ������.
	CMatrix RedimMatrix(int, int);
	// �������� ������ ������� � ����������� ������, ������� ����� ���������.
	CMatrix RedimData(int, int);
	// �������� ������ ������� � ������������ ������.
	CMatrix RedimMatrix(int);
	// �������� ������ ������� � ����������� ������, ������� ����� ���������.
	CMatrix RedimData(int);
	// ������������ ������� �������
	double MaxElement();
	// ����������� ������� �������
	double MinElement();
};