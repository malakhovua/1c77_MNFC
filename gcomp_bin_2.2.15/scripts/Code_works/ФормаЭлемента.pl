my $OnNew = <<EOF
//_____________________________________________________________________________
��������� ����������(�����������)
	�������.����������(�����������);

	���� ����������� = 1 �����
		�������;
	���������;
��������������
EOF
;
my $OnOpen = <<EOF
//_____________________________________________________________________________
��������� �����������()
��������������
EOF
;
my $OnSave1 = <<EOF
//_____________________________________________________________________________
��������� ����_���������()
��������������
EOF
;
my $OnSave2 = <<EOF
//_____________________________________________________________________________
//������ ������, ������������ ������������� ���
��������� ���������() 
	//��������: ������ ��������� ��� ���������� ��������� ����� ������������ ������
	//��� ���������� �������� ���� !!!
	//����������� ����������� ��������� ���������� � ������ ��������� � ��������� ����_
	�������������������(��������, ��������������(), �����������());
��������������
//����� ������, ������������ ������������� ���
EOF
;

CodeWorks::CreateProc("�����������", $OnOpen, "�����������, ����_���������, ���������");

CodeWorks::CreateProc("����������", $OnNew, "�����������, �����������, ����_���������, ���������");
CodeWorks::InsertCode($ObjName, "����������", "�������.����������(�����������);");


CodeWorks::CreateProc("���������", $OnSave2, "");
CodeWorks::InsertCode($ObjName, "���������", "�������������������(��������, ��������������(), �����������());\n����_���������();");
CodeWorks::CreateProc("����_���������", $OnSave1, "���������");

CodeWorks::InsertVarDecl($ObjName, "", "�������");
CodeWorks::InsertCode($ObjName, "", "\n������� = �������������(\"�����������\");");

#CodeWorks::RemoveVarDecl($ObjName, "", "�������");
#CodeWorks::RenameObject($ObjName, "", "�������", "�������2");

#������ �������� ����� ����, ������������� �������� '//MOD{'  �  '//}MOD'
CodeWorks::RemoveCode("", "\/\/\\s*(MOD\\s*{)\\s*([\\d.-_:]*)", "\/\/}MOD");
