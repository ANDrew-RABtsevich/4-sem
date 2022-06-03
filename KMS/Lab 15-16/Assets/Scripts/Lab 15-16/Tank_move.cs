using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Tank_move : MonoBehaviour
{
    public GameObject bashnya;         //��������� ���������� ��� ���������� ������
    public GameObject stvol;           //��������� ���������� ��� ���������� �������
    public AudioSource audio_tank_move;
    bool isPlaying = false;

    public float TankMoveSpeed = 0.1f; //��� ������������� �������� �������� �����
    public float RotateSpeed = 1f;     //��� ������������� �������� �������� �����
    public float min = 250f;           //����������� ���� �������� ������
    public float max = 290f; 			//������������ ���� �������� ������
    float rotV = 270f;


    
    void Start()
    {

    }
    private void Update()
    {
        float z = Input.GetAxis("Vertical");         // ������� W � S
        if (z != 0)
        {
            //���������� �� ��� ����� ������� ������ �� ���������� TankMoveSpeed*z

            transform.position +=
            transform.TransformDirection(Vector3.up * TankMoveSpeed * z);
            //audio_tank.Play();
        }


        float x = Input.GetAxis("Horizontal");    // ������� A � D
        if (x != 0)
        {
            // ������������ �� ���� x ������ ��� Y
            transform.Rotate(0f,  0f, x);


        }

        float h = Input.GetAxis("Mouse X");
        if (h != 0)
        {
            bashnya.transform.Rotate(0f, h * RotateSpeed, 0f);
        }

        if (h == 0)
        {
            bashnya.transform.Rotate(0f, h * RotateSpeed, 0f);
        }


        float v = Input.GetAxis("Mouse Y");



        rotV += v;
        rotV = Mathf.Clamp(rotV, min, max);
        
        stvol.transform.localRotation = Quaternion.Euler(rotV * RotateSpeed, 0, 0);




        if ((x != 0 || z != 0) && !isPlaying)
        {
            audio_tank_move.Play();
            isPlaying = true;
        }

        if ((x == 0 && z == 0) && isPlaying)
        {
            audio_tank_move.Stop();
            isPlaying = false;
        }


    }
}
