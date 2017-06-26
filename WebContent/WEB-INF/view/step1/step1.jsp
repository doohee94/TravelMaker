<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!-- ��������� step1 ������ ��/��/������ ���ð� ������ ���� �׸��� ��¥�Է��ϴ� ������
    (ȭ�鼳�� �����̵�4��)-->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>��������� step1</title>

<!-- ����� ������ ������ ȭ�� css -->
<link href="/resource/step1/css/step1.css" rel="stylesheet"/>
<link href="/resource/step1/css/travelRegionStart.css" rel="stylesheet" />
<link href="/resource/step1/css/travelRegionStopover.css" rel="stylesheet" />
<link href="/resource/step1/css/travelRegionDestination.css" rel="stylesheet" />

<!-- jquery Datepicker css-->
<link rel="stylesheet"	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

<!-- ����� ������ ������ �� css -->
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />


<!-- ����� ������ ������ �� script -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- jquery Datepicker script -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- js -->
<script src="/resource/step1/js/step1.js"></script>

<script>
//������ �˾� js���Ͽ� ������ �����߻�
$('#btn_popup').click(function() {
	$a.popup({
		title : "������ �˾� �׽�Ʈ",
		url : "fellowtravellers.jsp",
		iframe : true
	// default
	});
});
</script>
</head>
<body>
	<div class="container">
	<form class="contnsubform" action="" method='get'>
		<!--   ����� ������ ������ ��	-->
		
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#menu1">�����</a></li>
			<li><a data-toggle="tab" href="#menu2">������</a></li>
			<li><a data-toggle="tab" href="#menu3">������</a></li>
			<input type="button" value="����" id="nextbtn">
		</ul>

		<div class="tab-content">
			<!-- ����� �� -->
			<div id="menu1" class="tab-pane fade in active">
				
				<div class="wrap">

	<!-- ���� ���� ���� 3�� �� 1�� -->
	<div class="city0">
			<input type="button" value="�ֿ䵵��" id=majorcitymark>
			<input type="button" value="����" id="myButton1" class="a">
			<input type="button" value="����" id="myButton2" class="a">
			<input type="button" value="�λ�" id="myButton3" class="a">
			<input type="button" value="����" id="myButton4" class="a">
			<input type="button" value="����" id="myButton5" class="a">
			<input type="button" value="�¾�" id="myButton6" class="a">
			<input type="button" value="����" id="myButton7" class="a">
			<input type="button" value="����" id="myButton8" class="a">
	</div>

	<!-- ���� ���� ���� 3�� �� 2�� -->
	<div class="city1">
			<input type="button" value="��������" class="Gangwondo">
			<input type="button" value="��⵵��" class="Gyeonggido">
			<input type="button" value="��󳲵���" class="Gyeongsangnamdo">
			<input type="button" value="���ϵ���" class="Gyeongsangbukdo">
			<input type="button" value="����" id="myButton29" class="a">
			<input type="button" value="�뱸" id="myButton152" class="a">
			<input type="button" value="����" id="myButton153" class="a">
			<input type="button" value="�λ�" id="myButton3" class="a">
		
	</div>

	<!-- ���� ���� ���� 3���� 2�� ������ ��ư -->
	<div class="Gangwondodiv" id="Gangwondodiv">
		<!-- ������ ��ư ���� 1�� -->
		<div id="gangwon1">
			<input type="button" value="����" id="myButton8" class="a">
			<input type="button" value="��" id="myButton9" class="a">
			<input type="button" value="����" id="myButton10" class="a">
			<input type="button" value="��ô" id="myButton11" class="a">
			<input type="button" value="����" id="myButton12" class="a">
			<input type="button" value="�籸" id="myButton13" class="a">
			<input type="button" value="���" id="myButton14" class="a">
			<input type="button" value="����" id="myButton15" class="a">
		</div>
		
		<!-- ������ ��ư ���� 2�� -->
		<div id="gangwon2">
			<input type="button" value="����" id="myButton16" class="a">
			<input type="button" value="����" id="myButton17" class="a">
			<input type="button" value="����" id="myButton18" class="a">
			<input type="button" value="ö��" id="myButton19" class="a">
			<input type="button" value="��õ" id="myButton20" class="a">
			<input type="button" value="�¹�" id="myButton21" class="a">
			<input type="button" value="��â" id="myButton22" class="a">
			<input type="button" value="ȫõ" id="myButton23" class="a">
		</div>
		
		<!-- ������ ��ư ���� 3�� -->
		<div id="gangwon3">
			<input type="button" value="ȭõ" id="myButton24" class="a">
			<input type="button" value="Ⱦ��" id="myButton25" class="a">
		</div>
		
	</div>

	<!-- ���� ���� ���� 3���� 2�� ��⵵ ��ư -->
	<div class="Gyeonggidodiv" id="Gyeonggidodiv">
		<!-- ��⵵ ��ư ���� 1�� -->
		<div id="gyeongi1">
			<input type="button" value="����" id="myButton25" class="a">
			<input type="button" value="���" id="myButton26" class="a">
			<input type="button" value="��õ" id="myButton27" class="a">
			<input type="button" value="����" id="myButton28" class="a">
			<input type="button" value="����" id="myButton29" class="a">
			<input type="button" value="����" id="myButton30" class="a">
			<input type="button" value="����" id="myButton31" class="a">
			<input type="button" value="����" id="myButton32" class="a">
		</div>
		
		<!-- ��⵵ ��ư ���� 2�� -->
		<div id="gyeongi2">
			<input type="button" value="������" id="myButton33" class="a">
			<input type="button" value="����õ" id="myButton34" class="a">
			<input type="button" value="��õ" id="myButton35" class="a">
			<input type="button" value="����" id="myButton36" class="a">
			<input type="button" value="����" id="myButton37" class="a">
			<input type="button" value="����" id="myButton38" class="a">
			<input type="button" value="�Ȼ�" id="myButton39" class="a">
			<input type="button" value="�ȼ�" id="myButton40" class="a">
		</div>
		
		<!-- ��⵵ ��ư ���� 3�� -->
		<div id="gyeongi3">
			<input type="button" value="�Ⱦ�" id="myButton41" class="a">
			<input type="button" value="����" id="myButton42" class="a">
			<input type="button" value="����" id="myButton5" class="a">
			<input type="button" value="����" id="myButton43" class="a">
			<input type="button" value="��õ" id="myButton44" class="a">
			<input type="button" value="����" id="myButton45" class="a">
			<input type="button" value="����" id="myButton46" class="a">
		</div>
		
	</div>

	<!-- ���� ���� ���� 3���� 2�� ��󳲵� ��ư -->
	<div class="Gyeongsangnamdodiv" id="Gyeongsangnamdodiv">
		<!-- ��󳲵� ��ư ���� 1�� -->
		<div id="gyeongnam1">
			<input type="button" value="����" id="myButton47" class="a">
			<input type="button" value="��â" id="myButton48" class="a">
			<input type="button" value="��" id="myButton49" class="a">
			<input type="button" value="����" id="myButton50" class="a">
			<input type="button" value="����" id="myButton51" class="a">
			<input type="button" value="����" id="myButton52" class="a">
			<input type="button" value="�о�" id="myButton53" class="a">
			<input type="button" value="��õ" id="myButton54" class="a">
		</div>
		
		<!-- ��󳲵� ��ư ���� 2�� -->
		<div id="gyeongnam2">
			<input type="button" value="��û" id="myButton55" class="a">
			<input type="button" value="���" id="myButton56" class="a">
			<input type="button" value="�Ƿ�" id="myButton57" class="a">
			<input type="button" value="����" id="myButton7" class="a">
			<input type="button" value="����" id="myButton58" class="a">
			<input type="button" value="â��" id="myButton59" class="a">
			<input type="button" value="â��" id="myButton60" class="a">
			<input type="button" value="�뿵" id="myButton61" class="a">
		</div>
		
		<!-- ��󳲵� ��ư ���� 3�� -->
		<div id="gyeongnam3">
			<input type="button" value="�ϵ�" id="myButton62" class="a">
			<input type="button" value="�Ծ�" id="myButton63" class="a">
			<input type="button" value="�Ծ�" id="myButton64" class="a">
			<input type="button" value="��õ" id="myButton65" class="a">
		</div>
		
	</div>

	<!-- ���� ���� ���� 3���� 2�� ���ϵ� ��ư -->
	<div class="Gyeongsangbukdodiv" id="Gyeongsangbukdodiv">
		<!-- ���ϵ� ��ư ���� 1�� -->
		<div id="gyeongbuk1">
			<input type="button" value="���" id="myButton66" class="a">
			<input type="button" value="����" id="myButton4" class="a">
			<input type="button" value="���" id="myButton67" class="a">
			<input type="button" value="����" id="myButton68" class="a">
			<input type="button" value="����" id="myButton69" class="a">
			<input type="button" value="��õ" id="myButton70" class="a">
			<input type="button" value="����" id="myButton71" class="a">
			<input type="button" value="��ȭ" id="myButton72" class="a">
		</div>
		
		<!-- ���ϵ� ��ư ���� 2�� -->
		<div id="gyeongbuk2">
			<input type="button" value="����" id="myButton73" class="a">
			<input type="button" value="����" id="myButton74" class="a">
			<input type="button" value="�ȵ�" id="myButton75" class="a">
			<input type="button" value="����" id="myButton76" class="a">
			<input type="button" value="����" id="myButton77" class="a">
			<input type="button" value="����" id="myButton78" class="a">
			<input type="button" value="��õ" id="myButton79" class="a">
			<input type="button" value="��õ" id="myButton80" class="a">
		</div>
		
		<!-- ���ϵ� ��ư ���� 3�� -->
		<div id="gyeongbuk3">
			<input type="button" value="�︪" id="myButton81" class="a">
			<input type="button" value="����" id="myButton82" class="a">
			<input type="button" value="�Ǽ�" id="myButton83" class="a">
			<input type="button" value="û��" id="myButton84" class="a">
			<input type="button" value="û��" id="myButton85" class="a">
			<input type="button" value="ĥ��" id="myButton86" class="a">
			<input type="button" value="����" id="myButton87" class="a">
		</div>
		
	</div>

	<!-- ���� ���� ���� 3�� �� 3�� -->
	<div class="city2">
	
			<input type="button" value="����" id="myButton1" class="a">
			<input type="button" value="���" id="myButton88" class="a">
			<input type="button" value="��õ" id="myButton89" class="a">
			<input type="button" value="���󳲵���" class="Jeollanamdo">
			<input type="button" value="����ϵ���" class="Jeollabukdo">
			<input type="button" value="����" id="myButton2" class="a">
			<input type="button" value="��û������" class="Chungcheongnamdo">
			<input type="button" value="��û�ϵ���" class="Chungcheongbukdo">
	
	</div>
	
	<!-- ���� ���� ���� 3���� 3�� ���󳲵� ��ư -->
	<div class="Jeollanamdodiv" id="Jeollanamdodiv">
		<!-- ���󳲵� ��ư ���� 1�� -->
		<div id="jeollanam1">
			<input type="button" value="����" id="myButton90" class="a">
			<input type="button" value="����" id="myButton91" class="a">
			<input type="button" value="�" id="myButton92" class="a">
			<input type="button" value="����" id="myButton93" class="a">
			<input type="button" value="����" id="myButton94" class="a">
			<input type="button" value="����" id="myButton95" class="a">
			<input type="button" value="���" id="myButton96" class="a">
			<input type="button" value="����" id="myButton97" class="a">
		</div>
		
		<!-- ���󳲵� ��ư ���� 2�� -->
		<div id="jeollanam2">
			<input type="button" value="����" id="myButton98" class="a">
			<input type="button" value="����" id="myButton99" class="a">
			<input type="button" value="��õ" id="myButton100" class="a">
			<input type="button" value="�ž�" id="myButton101" class="a">
			<input type="button" value="����" id="myButton102" class="a">
			<input type="button" value="����" id="myButton103" class="a">
			<input type="button" value="����" id="myButton104" class="a">
			<input type="button" value="�ϵ�" id="myButton105" class="a">
		</div>
		
		<!-- ���󳲵� ��ư ���� 3�� -->
		<div id="jeollanam3">
			<input type="button" value="�强" id="myButton106" class="a">
			<input type="button" value="����" id="myButton107" class="a">
			<input type="button" value="����" id="myButton108" class="a">
			<input type="button" value="����" id="myButton109" class="a">
			<input type="button" value="�س�" id="myButton110" class="a">
			<input type="button" value="ȭ��" id="myButton111" class="a">
		</div>
		
	</div>

	<!-- ���� ���� ���� 3���� 3�� ����ϵ� ��ư -->
	<div class="Jeollabukdodiv" id="Jeollabukdodiv">
		<!-- ����ϵ� ��ư ���� 1�� -->
		<div id="jeollabuk1">
			<input type="button" value="��â" id="myButton112" class="a">
			<input type="button" value="����" id="myButton113" class="a">
			<input type="button" value="����" id="myButton114" class="a">
			<input type="button" value="����" id="myButton115" class="a">
			<input type="button" value="����" id="myButton116" class="a">
			<input type="button" value="�ξ�" id="myButton117" class="a">
			<input type="button" value="��â" id="myButton118" class="a">
			<input type="button" value="����" id="myButton119" class="a">
		</div>
		
		<!-- ����ϵ� ��ư ���� 2�� -->
		<div id="jeollabuk2">
			<input type="button" value="�ͻ�" id="myButton120" class="a">
			<input type="button" value="�ӽ�" id="myButton121" class="a">
			<input type="button" value="���" id="myButton122" class="a">
			<input type="button" value="����" id="myButton123" class="a">
			<input type="button" value="����" id="myButton124" class="a">
			<input type="button" value="����" id="myButton125" class="a">
		</div>
	</div>

	<!-- ���� ���� ���� 3���� 3�� ��û���� ��ư -->
	<div class="Chungcheongnamdodiv" id="Chungcheongnamdodiv">
		<!-- ��û���� ��ư ���� 1�� -->
		<div id="chungnam1">
			<input type="button" value="����" id="myButton126" class="a"> 
			<input type="button" value="�ݻ�" id="myButton127" class="a"> 
			<input type="button" value="���" id="myButton128" class="a"> 
			<input type="button" value="����" id="myButton129" class="a"> 
			<input type="button" value="����" id="myButton130" class="a"> 
			<input type="button" value="�ο�" id="myButton131" class="a"> 
			<input type="button" value="����" id="myButton132" class="a"> 
			<input type="button" value="��õ" id="myButton133" class="a"> 
		</div>
		
		<!-- ��û���� ��ư ���� 2�� -->
		<div id="chungnam2">
			<input type="button" value="�ƻ�" id="myButton134" class="a"> 
			<input type="button" value="����" id="myButton135" class="a"> 
			<input type="button" value="õ��" id="myButton136" class="a"> 
			<input type="button" value="û��" id="myButton137" class="a"> 
			<input type="button" value="�¾�" id="myButton6" class="a"> 
			<input type="button" value="ȫ��" id="myButton138" class="a"> 
			<input type="button" value="���" id="myButton139" class="a"> 
		</div>
		
	</div>

	<!-- ���� ���� ���� 3���� 3�� ��û�ϵ� ��ư -->
	<div class="Chungcheongbukdodiv" id="Chungcheongbukdodiv">
			<!-- ��û�ϵ� ��ư ���� 1�� -->
			<div id="chungbuk1">
				<input type="button" value="����" id="myButton140" class="a">
				<input type="button" value="�ܾ�" id="myButton141" class="a">
				<input type="button" value="����" id="myButton142" class="a">
				<input type="button" value="����" id="myButton143" class="a">
				<input type="button" value="��õ" id="myButton144" class="a">
				<input type="button" value="����" id="myButton145" class="a">
				<input type="button" value="��õ" id="myButton146" class="a">
				<input type="button" value="��õ" id="myButton147" class="a">
			</div>
			
			<!-- ��û�ϵ� ��ư ���� 2�� -->
			<div id="chungbuk2">
				<input type="button" value="û��" id="myButton148" class="a">
				<input type="button" value="û��" id="myButton149" class="a">
				<input type="button" value="����" id="myButton150" class="a">
				<input type="button" value="����" id="myButton151" class="a">
			</div>
			
	</div>
	
</div><!-- end wrap class ����� ��-->
				
				
			</div>

			<!-- ������ �� -->
			<div id="menu2" class="tab-pane fade">
				
				<div class="wrap">

	<!-- ���� ���� ���� 3�� �� 1�� -->
	<div class="city0">
			<input type="button" value="�ֿ䵵��" id=majorcitymark>
			<input type="button" value="����" id="myButton1" blass="b">
			<input type="button" value="����" id="myButton2" blass="b">
			<input type="button" value="�λ�" id="myButton3" blass="b">
			<input type="button" value="����" id="myButton4" blass="b">
			<input type="button" value="����" id="myButton5" blass="b">
			<input type="button" value="�¾�" id="myButton6" blass="b">
			<input type="button" value="����" id="myButton7" blass="b">
			<input type="button" value="����" id="myButton8" blass="b">
	</div>
	
	<!-- ���� ���� ���� 3�� �� 2�� -->
	<div class="city1">
			<input type="button" value="��������" class="Gangwondo2">
			<input type="button" value="��⵵��" class="Gyeonggido2">
			<input type="button" value="��󳲵���" class="Gyeongsangnamdo2">
			<input type="button" value="���ϵ���" class="Gyeongsangbukdo2">
			<input type="button" value="����" id="myButton29" class="b">
			<input type="button" value="�뱸" id="myButton152" class="b">
			<input type="button" value="����" id="myButton153" class="b">
			<input type="button" value="�λ�" id="myButton3" class="b">
		
	</div>
	
	<!-- ���� ���� ���� 3���� 2�� ������ ��ư -->
	<div class="Gangwondodiv2" id="Gangwondodiv2">
		<!-- ������ ��ư ���� 1�� -->
		<div id="gangwon1">
			<input type="button" value="����" id="myButton8" class="b">
			<input type="button" value="��" id="myButton9" class="b">
			<input type="button" value="����" id="myButton10" class="b">
			<input type="button" value="��ô" id="myButton11" class="b">
			<input type="button" value="����" id="myButton12" class="b">
			<input type="button" value="�籸" id="myButton13" class="b">
			<input type="button" value="���" id="myButton14" class="b">
			<input type="button" value="����" id="myButton15" class="b">
		</div>
		
		<!-- ������ ��ư ���� 2�� -->
		<div id="gangwon2">
			<input type="button" value="����" id="myButton16" class="b">
			<input type="button" value="����" id="myButton17" class="b">
			<input type="button" value="����" id="myButton18" class="b">
			<input type="button" value="ö��" id="myButton19" class="b">
			<input type="button" value="��õ" id="myButton20" class="b">
			<input type="button" value="�¹�" id="myButton21" class="b">
			<input type="button" value="��â" id="myButton22" class="b">
			<input type="button" value="ȫõ" id="myButton23" class="b">
		</div>
		
		<!-- ������ ��ư ���� 3�� -->
		<div id="gangwon3">
			<input type="button" value="ȭõ" id="myButton24" class="b">
			<input type="button" value="Ⱦ��" id="myButton25" class="b">
		</div>
		
	</div>
	
	<!-- ���� ���� ���� 3���� 2�� ��⵵ ��ư -->
	<div class="Gyeonggidodiv2" id="Gyeonggidodiv2">
		<!-- ��⵵ ��ư ���� 1�� -->
		<div id="gyeongi1">
			<input type="button" value="����" id="myButton25" class="b">
			<input type="button" value="���" id="myButton26" class="b">
			<input type="button" value="��õ" id="myButton27" class="b">
			<input type="button" value="����" id="myButton28" class="b">
			<input type="button" value="����" id="myButton29" class="b">
			<input type="button" value="����" id="myButton30" class="b">
			<input type="button" value="����" id="myButton31" class="b">
			<input type="button" value="����" id="myButton32" class="b">
		</div>
		
		<!-- ��⵵ ��ư ���� 2�� -->
		<div id="gyeongi2">
			<input type="button" value="������" id="myButton33" class="b">
			<input type="button" value="����õ" id="myButton34" class="b">
			<input type="button" value="��õ" id="myButton35" class="b">
			<input type="button" value="����" id="myButton36" class="b">
			<input type="button" value="����" id="myButton37" class="b">
			<input type="button" value="����" id="myButton38" class="b">
			<input type="button" value="�Ȼ�" id="myButton39" class="b">
			<input type="button" value="�ȼ�" id="myButton40" class="b">
		</div>
		
		<!-- ��⵵ ��ư ���� 3�� -->
		<div id="gyeongi3">
			<input type="button" value="�Ⱦ�" id="myButton41" class="b">
			<input type="button" value="����" id="myButton42" class="b">
			<input type="button" value="����" id="myButton5" class="b">
			<input type="button" value="����" id="myButton43" class="b">
			<input type="button" value="��õ" id="myButton44" class="b">
			<input type="button" value="����" id="myButton45" class="b">
			<input type="button" value="����" id="myButton46" class="b">
		</div>
		
	</div>
	
	<!-- ���� ���� ���� 3���� 2�� ��󳲵� ��ư -->
	<div class="Gyeongsangnamdodiv2" id="Gyeongsangnamdodiv2">
		<!-- ��󳲵� ��ư ���� 1�� -->
		<div id="gyeongnam1">
			<input type="button" value="����" id="myButton47" class="b">
			<input type="button" value="��â" id="myButton48" class="b">
			<input type="button" value="��" id="myButton49" class="b">
			<input type="button" value="����" id="myButton50" class="b">
			<input type="button" value="����" id="myButton51" class="b">
			<input type="button" value="����" id="myButton52" class="b">
			<input type="button" value="�о�" id="myButton53" class="b">
			<input type="button" value="��õ" id="myButton54" class="b">
		</div>
		
		<!-- ��󳲵� ��ư ���� 2�� -->
		<div id="gyeongnam2">
			<input type="button" value="��û" id="myButton55" class="b">
			<input type="button" value="���" id="myButton56" class="b">
			<input type="button" value="�Ƿ�" id="myButton57" class="b">
			<input type="button" value="����" id="myButton7" class="b">
			<input type="button" value="����" id="myButton58" class="b">
			<input type="button" value="â��" id="myButton59" class="b">
			<input type="button" value="â��" id="myButton60" class="b">
			<input type="button" value="�뿵" id="myButton61" class="b">
		</div>
		
		<!-- ��󳲵� ��ư ���� 3�� -->
		<div id="gyeongnam3">
			<input type="button" value="�ϵ�" id="myButton62" class="b">
			<input type="button" value="�Ծ�" id="myButton63" class="b">
			<input type="button" value="�Ծ�" id="myButton64" class="b">
			<input type="button" value="��õ" id="myButton65" class="b">
		</div>
		
	</div>
	
	<!-- ���� ���� ���� 3���� 2�� ���ϵ� ��ư -->
	<div class="Gyeongsangbukdodiv2" id="Gyeongsangbukdodiv2">
		<!-- ���ϵ� ��ư ���� 1�� -->
		<div id="gyeongbuk1">
			<input type="button" value="���" id="myButton66" class="b">
			<input type="button" value="����" id="myButton4" class="b">
			<input type="button" value="���" id="myButton67" class="b">
			<input type="button" value="����" id="myButton68" class="b">
			<input type="button" value="����" id="myButton69" class="b">
			<input type="button" value="��õ" id="myButton70" class="b">
			<input type="button" value="����" id="myButton71" class="b">
			<input type="button" value="��ȭ" id="myButton72" class="b">
		</div>
		
		<!-- ���ϵ� ��ư ���� 2�� -->
		<div id="gyeongbuk2">
			<input type="button" value="����" id="myButton73" class="b">
			<input type="button" value="����" id="myButton74" class="b">
			<input type="button" value="�ȵ�" id="myButton75" class="b">
			<input type="button" value="����" id="myButton76" class="b">
			<input type="button" value="����" id="myButton77" class="b">
			<input type="button" value="����" id="myButton78" class="b">
			<input type="button" value="��õ" id="myButton79" class="b">
			<input type="button" value="��õ" id="myButton80" class="b">
		</div>
		
		<!-- ���ϵ� ��ư ���� 3�� -->
		<div id="gyeongbuk3">
			<input type="button" value="�︪" id="myButton81" class="b">
			<input type="button" value="����" id="myButton82" class="b">
			<input type="button" value="�Ǽ�" id="myButton83" class="b">
			<input type="button" value="û��" id="myButton84" class="b">
			<input type="button" value="û��" id="myButton85" class="b">
			<input type="button" value="ĥ��" id="myButton86" class="b">
			<input type="button" value="����" id="myButton87" class="b">
		</div>
		
	</div>

	<!-- ���� ���� ���� 3�� �� 3�� -->
	<div class="city2">
			<input type="button" value="����" id="myButton1" class="b">
			<input type="button" value="���" id="myButton88" class="b">
			<input type="button" value="��õ" id="myButton89" class="b">
			<input type="button" value="���󳲵���" class="Jeollanamdo2">
			<input type="button" value="����ϵ���" class="Jeollabukdo2">
			<input type="button" value="����" id="myButton2" class="b">
			<input type="button" value="��û������" class="Chungcheongnamdo2">
			<input type="button" value="��û�ϵ���" class="Chungcheongbukdo2">
	
	</div>
	
	<!-- ���� ���� ���� 3���� 3�� ���󳲵� ��ư -->
	<div class="Jeollanamdodiv2" id="Jeollanamdodiv2">
		<!-- ���󳲵� ��ư ���� 1�� -->
		<div id="jeollanam1">
			<input type="button" value="����" id="myButton90" class="b">
			<input type="button" value="����" id="myButton91" class="b">
			<input type="button" value="�" id="myButton92" class="b">
			<input type="button" value="����" id="myButton93" class="b">
			<input type="button" value="����" id="myButton94" class="b">
			<input type="button" value="����" id="myButton95" class="b">
			<input type="button" value="���" id="myButton96" class="b">
			<input type="button" value="����" id="myButton97" class="b">
		</div>
		
		<!-- ���󳲵� ��ư ���� 1�� -->
		<div id="jeollanam2">
			<input type="button" value="����" id="myButton98" class="b">
			<input type="button" value="����" id="myButton99" class="b">
			<input type="button" value="��õ" id="myButton100" class="b">
			<input type="button" value="�ž�" id="myButton101" class="b">
			<input type="button" value="����" id="myButton102" class="b">
			<input type="button" value="����" id="myButton103" class="b">
			<input type="button" value="����" id="myButton104" class="b">
			<input type="button" value="�ϵ�" id="myButton105" class="b">
		</div>
		
		<!-- ���󳲵� ��ư ���� 3�� -->
		<div id="jeollanam3">
			<input type="button" value="�强" id="myButton106" class="b">
			<input type="button" value="����" id="myButton107" class="b">
			<input type="button" value="����" id="myButton108" class="b">
			<input type="button" value="����" id="myButton109" class="b">
			<input type="button" value="�س�" id="myButton110" class="b">
			<input type="button" value="ȭ��" id="myButton111" class="b">
		</div>
		
	</div>
	
	<!-- ���� ���� ���� 3���� 3�� ����ϵ� ��ư -->
	<div class="Jeollabukdodiv2" id="Jeollabukdodiv2">
		<!-- ����ϵ� ��ư ���� 1�� -->
		<div id="jeollabuk1">
			<input type="button" value="��â" id="myButton112" class="b">
			<input type="button" value="����" id="myButton113" class="b">
			<input type="button" value="����" id="myButton114" class="b">
			<input type="button" value="����" id="myButton115" class="b">
			<input type="button" value="����" id="myButton116" class="b">
			<input type="button" value="�ξ�" id="myButton117" class="b">
			<input type="button" value="��â" id="myButton118" class="b">
			<input type="button" value="����" id="myButton119" class="b">
		</div>
		
		<!-- ����ϵ� ��ư ���� 2�� -->
		<div id="jeollabuk2">
			<input type="button" value="�ͻ�" id="myButton120" class="b">
			<input type="button" value="�ӽ�" id="myButton121" class="b">
			<input type="button" value="���" id="myButton122" class="b">
			<input type="button" value="����" id="myButton123" class="b">
			<input type="button" value="����" id="myButton124" class="b">
			<input type="button" value="����" id="myButton125" class="b">
		</div>
	</div>
	
	<!-- ���� ���� ���� 3���� 3�� ��û���� ��ư -->
	<div class="Chungcheongnamdodiv2" id="Chungcheongnamdodiv2">
		<!-- ��û���� ��ư ���� 1�� -->
		<div id="chungnam1">
			<input type="button" value="����" id="myButton126" class="b"> 
			<input type="button" value="�ݻ�" id="myButton127" class="b"> 
			<input type="button" value="���" id="myButton128" class="b"> 
			<input type="button" value="����" id="myButton129" class="b"> 
			<input type="button" value="����" id="myButton130" class="b"> 
			<input type="button" value="�ο�" id="myButton131" class="b"> 
			<input type="button" value="����" id="myButton132" class="b"> 
			<input type="button" value="��õ" id="myButton133" class="b"> 
		</div>
		
		<!-- ��û���� ��ư ���� 2�� -->
		<div id="chungnam2">
			<input type="button" value="�ƻ�" id="myButton134" class="b"> 
			<input type="button" value="����" id="myButton135" class="b"> 
			<input type="button" value="õ��" id="myButton136" class="b"> 
			<input type="button" value="û��" id="myButton137" class="b"> 
			<input type="button" value="�¾�" id="myButton6" class="b"> 
			<input type="button" value="ȫ��" id="myButton138" class="b"> 
			<input type="button" value="���" id="myButton139" class="b"> 
		</div>
		
	</div>
	
	<!-- ���� ���� ���� 3���� 3�� ��û�ϵ� ��ư -->
	<div class="Chungcheongbukdodiv2" id="Chungcheongbukdodiv2">
			<!-- ��û�ϵ� ��ư ���� 1�� -->
			<div id="chungbuk1">
				<input type="button" value="����" id="myButton140" class="b">
				<input type="button" value="�ܾ�" id="myButton141" class="b">
				<input type="button" value="����" id="myButton142" class="b">
				<input type="button" value="����" id="myButton143" class="b">
				<input type="button" value="��õ" id="myButton144" class="b">
				<input type="button" value="����" id="myButton145" class="b">
				<input type="button" value="��õ" id="myButton146" class="b">
				<input type="button" value="��õ" id="myButton147" class="b">
			</div>
			
			<!-- ��û�ϵ� ��ư ���� 2�� -->
			<div id="chungbuk2">
				<input type="button" value="û��" id="myButton148" class="b">
				<input type="button" value="û��" id="myButton149" class="b">
				<input type="button" value="����" id="myButton150" class="b">
				<input type="button" value="����" id="myButton151" class="b">
			</div>
			
	</div>
	
</div><!-- end wrap class ������ �� -->
				
			</div>

			<!-- ������ �� -->
			<div id="menu3" class="tab-pane fade ">
				<div class="wrap">
	
	<!-- ���� ���� ���� 3�� �� 1�� -->
	<div class="city0">
			<input type="button" value="�ֿ䵵��" id=majorcitymark>
			<input type="button" value="����" id="myButton1" class="c">
			<input type="button" value="����" id="myButton2" class="c">
			<input type="button" value="�λ�" id="myButton3" class="c">
			<input type="button" value="����" id="myButton4" class="c">
			<input type="button" value="����" id="myButton5" class="c">
			<input type="button" value="�¾�" id="myButton6" class="c">
			<input type="button" value="����" id="myButton7" class="c">
			<input type="button" value="����" id="myButton8" class="c">
	</div>

	<!-- ���� ���� ���� 3�� �� 2�� -->
	<div class="city1">
			<input type="button" value="��������" class="Gangwondo3">
			<input type="button" value="��⵵��" class="Gyeonggido3">
			<input type="button" value="��󳲵���" class="Gyeongsangnamdo3">
			<input type="button" value="���ϵ���" class="Gyeongsangbukdo3">
			<input type="button" value="����" id="myButton29" class="c">
			<input type="button" value="�뱸" id="myButton152" class="c">
			<input type="button" value="����" id="myButton153" class="c">
			<input type="button" value="�λ�" id="myButton3" class="c">
		
	</div>
	
	<!-- ���� ���� ���� 3���� 2�� ������ ��ư -->
	<div class="Gangwondodiv3" id="Gangwondodiv3">
		
		<!-- ������ ��ư ���� 1�� -->
		<div id="gangwon1">
			<input type="button" value="����" id="myButton8" class="c">
			<input type="button" value="��" id="myButton9" class="c">
			<input type="button" value="����" id="myButton10" class="c">
			<input type="button" value="��ô" id="myButton11" class="c">
			<input type="button" value="����" id="myButton12" class="c">
			<input type="button" value="�籸" id="myButton13" class="c">
			<input type="button" value="���" id="myButton14" class="c">
			<input type="button" value="����" id="myButton15" class="c">
		</div>
		
		<!-- ������ ��ư ���� 2�� -->
		<div id="gangwon2">
			<input type="button" value="����" id="myButton16" class="c">
			<input type="button" value="����" id="myButton17" class="c">
			<input type="button" value="����" id="myButton18" class="c">
			<input type="button" value="ö��" id="myButton19" class="c">
			<input type="button" value="��õ" id="myButton20" class="c">
			<input type="button" value="�¹�" id="myButton21" class="c">
			<input type="button" value="��â" id="myButton22" class="c">
			<input type="button" value="ȫõ" id="myButton23" class="c">
		</div>
		
		<!-- ������ ��ư ���� 3�� -->
		<div id="gangwon3">
			<input type="button" value="ȭõ" id="myButton24" class="c">
			<input type="button" value="Ⱦ��" id="myButton25" class="c">
		</div>
		
	</div>
	
	<!-- ���� ���� ���� 3���� 2�� ��⵵ ��ư -->
	<div class="Gyeonggidodiv3" id="Gyeonggidodiv3">
		
		<!-- ��⵵ ��ư ���� 1�� -->
		<div id="gyeongi1">
			<input type="button" value="����" id="myButton25" class="c">
			<input type="button" value="���" id="myButton26" class="c">
			<input type="button" value="��õ" id="myButton27" class="c">
			<input type="button" value="����" id="myButton28" class="c">
			<input type="button" value="����" id="myButton29" class="c">
			<input type="button" value="����" id="myButton30" class="c">
			<input type="button" value="����" id="myButton31" class="c">
			<input type="button" value="����" id="myButton32" class="c">
		</div>
		
		<!-- ��⵵ ��ư ���� 2�� -->
		<div id="gyeongi2">
			<input type="button" value="������" id="myButton33" class="c">
			<input type="button" value="����õ" id="myButton34" class="c">
			<input type="button" value="��õ" id="myButton35" class="c">
			<input type="button" value="����" id="myButton36" class="c">
			<input type="button" value="����" id="myButton37" class="c">
			<input type="button" value="����" id="myButton38" class="c">
			<input type="button" value="�Ȼ�" id="myButton39" class="c">
			<input type="button" value="�ȼ�" id="myButton40" class="c">
		</div>
		
		<!-- ��⵵ ��ư ���� 3�� -->
		<div id="gyeongi3">
			<input type="button" value="�Ⱦ�" id="myButton41" class="c">
			<input type="button" value="����" id="myButton42" class="c">
			<input type="button" value="����" id="myButton5" class="c">
			<input type="button" value="����" id="myButton43" class="c">
			<input type="button" value="��õ" id="myButton44" class="c">
			<input type="button" value="����" id="myButton45" class="c">
			<input type="button" value="����" id="myButton46" class="c">
		</div>
		
	</div>
	
	<!-- ���� ���� ���� 3���� 2�� ��󳲵� ��ư -->
	<div class="Gyeongsangnamdodiv3" id="Gyeongsangnamdodiv3">
		
		<!-- ��󳲵� ��ư ���� 1�� -->
		<div id="gyeongnam1">
			<input type="button" value="����" id="myButton47" class="c">
			<input type="button" value="��â" id="myButton48" class="c">
			<input type="button" value="��" id="myButton49" class="c">
			<input type="button" value="����" id="myButton50" class="c">
			<input type="button" value="����" id="myButton51" class="c">
			<input type="button" value="����" id="myButton52" class="c">
			<input type="button" value="�о�" id="myButton53" class="c">
			<input type="button" value="��õ" id="myButton54" class="c">
		</div>
		
		<!-- ��󳲵� ��ư ���� 2�� -->
		<div id="gyeongnam2">
			<input type="button" value="��û" id="myButton55" class="c">
			<input type="button" value="���" id="myButton56" class="c">
			<input type="button" value="�Ƿ�" id="myButton57" class="c">
			<input type="button" value="����" id="myButton7" class="c">
			<input type="button" value="����" id="myButton58" class="c">
			<input type="button" value="â��" id="myButton59" class="c">
			<input type="button" value="â��" id="myButton60" class="c">
			<input type="button" value="�뿵" id="myButton61" class="c">
		</div>
		
		<!-- ��󳲵� ��ư ���� 3�� -->
		<div id="gyeongnam3">
			<input type="button" value="�ϵ�" id="myButton62" class="c">
			<input type="button" value="�Ծ�" id="myButton63" class="c">
			<input type="button" value="�Ծ�" id="myButton64" class="c">
			<input type="button" value="��õ" id="myButton65" class="c">
		</div>
		
	</div>

	<!-- ���� ���� ���� 3���� 2�� ���ϵ� ��ư -->
	<div class="Gyeongsangbukdodiv3" id="Gyeongsangbukdodiv3">
		
		<!-- ���ϵ� ��ư ���� 1�� -->
		<div id="gyeongbuk1">
			<input type="button" value="���" id="myButton66" class="c">
			<input type="button" value="����" id="myButton4" class="c">
			<input type="button" value="���" id="myButton67" class="c">
			<input type="button" value="����" id="myButton68" class="c">
			<input type="button" value="����" id="myButton69" class="c">
			<input type="button" value="��õ" id="myButton70" class="c">
			<input type="button" value="����" id="myButton71" class="c">
			<input type="button" value="��ȭ" id="myButton72" class="c">
		</div>
		
		<!-- ���ϵ� ��ư ���� 2�� -->
		<div id="gyeongbuk2">
			<input type="button" value="����" id="myButton73" class="c">
			<input type="button" value="����" id="myButton74" class="c">
			<input type="button" value="�ȵ�" id="myButton75" class="c">
			<input type="button" value="����" id="myButton76" class="c">
			<input type="button" value="����" id="myButton77" class="c">
			<input type="button" value="����" id="myButton78" class="c">
			<input type="button" value="��õ" id="myButton79" class="c">
			<input type="button" value="��õ" id="myButton80" class="c">
		</div>
		
		<!-- ���ϵ� ��ư ���� 3�� -->
		<div id="gyeongbuk3">
			<input type="button" value="�︪" id="myButton81" class="c">
			<input type="button" value="����" id="myButton82" class="c">
			<input type="button" value="�Ǽ�" id="myButton83" class="c">
			<input type="button" value="û��" id="myButton84" class="c">
			<input type="button" value="û��" id="myButton85" class="c">
			<input type="button" value="ĥ��" id="myButton86" class="c">
			<input type="button" value="����" id="myButton87" class="c">
		</div>
		
	</div>

	<!-- ���� ���� ���� 3�� �� 3�� -->
	<div class="city2">
	
			<input type="button" value="����" id="myButton1" class="c">
			<input type="button" value="���" id="myButton88" class="c">
			<input type="button" value="��õ" id="myButton89" class="c">
			<input type="button" value="���󳲵���" class="Jeollanamdo3">
			<input type="button" value="����ϵ���" class="Jeollabukdo3">
			<input type="button" value="����" id="myButton2" class="c">
			<input type="button" value="��û������" class="Chungcheongnamdo3">
			<input type="button" value="��û�ϵ���" class="Chungcheongbukdo3">
	
	</div>
	
	<!-- ���� ���� ���� 3���� 3�� ���󳲵� ��ư -->
	<div class="Jeollanamdodiv3" id="Jeollanamdodiv3">
		
		<!-- ���󳲵� ��ư ���� 1�� -->
		<div id="jeollanam1">
			<input type="button" value="����" id="myButton90" class="c">
			<input type="button" value="����" id="myButton91" class="c">
			<input type="button" value="�" id="myButton92" class="c">
			<input type="button" value="����" id="myButton93" class="c">
			<input type="button" value="����" id="myButton94" class="c">
			<input type="button" value="����" id="myButton95" class="c">
			<input type="button" value="���" id="myButton96" class="c">
			<input type="button" value="����" id="myButton97" class="c">
		</div>
		
		<!-- ���󳲵� ��ư ���� 2�� -->
		<div id="jeollanam2">
			<input type="button" value="����" id="myButton98" class="c">
			<input type="button" value="����" id="myButton99" class="c">
			<input type="button" value="��õ" id="myButton100" class="c">
			<input type="button" value="�ž�" id="myButton101" class="c">
			<input type="button" value="����" id="myButton102" class="c">
			<input type="button" value="����" id="myButton103" class="c">
			<input type="button" value="����" id="myButton104" class="c">
			<input type="button" value="�ϵ�" id="myButton105" class="c">
		</div>
		
		<!-- ���󳲵� ��ư ���� 3�� -->
		<div id="jeollanam3">
			<input type="button" value="�强" id="myButton106" class="c">
			<input type="button" value="����" id="myButton107" class="c">
			<input type="button" value="����" id="myButton108" class="c">
			<input type="button" value="����" id="myButton109" class="c">
			<input type="button" value="�س�" id="myButton110" class="c">
			<input type="button" value="ȭ��" id="myButton111" class="c">
		</div>
		
	</div>
	
	<!-- ���� ���� ���� 3���� 3�� ����ϵ� ��ư -->
	<div class="Jeollabukdodiv3" id="Jeollabukdodiv3">
		
		<!-- ����ϵ� ��ư ���� 1�� -->
		<div id="jeollabuk1">
			<input type="button" value="��â" id="myButton112" class="c">
			<input type="button" value="����" id="myButton113" class="c">
			<input type="button" value="����" id="myButton114" class="c">
			<input type="button" value="����" id="myButton115" class="c">
			<input type="button" value="����" id="myButton116" class="c">
			<input type="button" value="�ξ�" id="myButton117" class="c">
			<input type="button" value="��â" id="myButton118" class="c">
			<input type="button" value="����" id="myButton119" class="c">
		</div>
		
		<!-- ����ϵ� ��ư ���� 2�� -->
		<div id="jeollabuk2">
			<input type="button" value="�ͻ�" id="myButton120" class="c">
			<input type="button" value="�ӽ�" id="myButton121" class="c">
			<input type="button" value="���" id="myButton122" class="c">
			<input type="button" value="����" id="myButton123" class="c">
			<input type="button" value="����" id="myButton124" class="c">
			<input type="button" value="����" id="myButton125" class="c">
		</div>
	</div>
	
	<!-- ���� ���� ���� 3���� 3�� ��û���� ��ư -->
	<div class="Chungcheongnamdodiv3" id="Chungcheongnamdodiv3">
		
		<!-- ��û���� ��ư ���� 1�� -->
		<div id="chungnam1">
			<input type="button" value="����" id="myButton126" class="c"> 
			<input type="button" value="�ݻ�" id="myButton127" class="c"> 
			<input type="button" value="���" id="myButton128" class="c"> 
			<input type="button" value="����" id="myButton129" class="c"> 
			<input type="button" value="����" id="myButton130" class="c"> 
			<input type="button" value="�ο�" id="myButton131" class="c"> 
			<input type="button" value="����" id="myButton132" class="c"> 
			<input type="button" value="��õ" id="myButton133" class="c"> 
		</div>
		
		<!-- ��û���� ��ư ���� 2�� -->
		<div id="chungnam2">
			<input type="button" value="�ƻ�" id="myButton134" class="c"> 
			<input type="button" value="����" id="myButton135" class="c"> 
			<input type="button" value="õ��" id="myButton136" class="c"> 
			<input type="button" value="û��" id="myButton137" class="c"> 
			<input type="button" value="�¾�" id="myButton6" class="c"> 
			<input type="button" value="ȫ��" id="myButton138" class="c"> 
			<input type="button" value="���" id="myButton139" class="c"> 
		</div>
		
	</div>
	
	<!-- ���� ���� ���� 3���� 3�� ��û�ϵ� ��ư -->
	<div class="Chungcheongbukdodiv3" id="Chungcheongbukdodiv3">
			
			<!-- ��û�ϵ� ��ư ���� 1�� -->
			<div id="chungbuk1">
				<input type="button" value="����" id="myButton140" class="c">
				<input type="button" value="�ܾ�" id="myButton141" class="c">
				<input type="button" value="����" id="myButton142" class="c">
				<input type="button" value="����" id="myButton143" class="c">
				<input type="button" value="��õ" id="myButton144" class="c">
				<input type="button" value="����" id="myButton145" class="c">
				<input type="button" value="��õ" id="myButton146" class="c">
				<input type="button" value="��õ" id="myButton147" class="c">
			</div>
			
			<!-- ��û�ϵ� ��ư ���� 2�� -->
			<div id="chungbuk2">
				<input type="button" value="û��" id="myButton148" class="c">
				<input type="button" value="û��" id="myButton149" class="c">
				<input type="button" value="����" id="myButton150" class="c">
				<input type="button" value="����" id="myButton151" class="c">
			</div>
			
	</div>
	
</div><!-- end wrap class ������ ��-->
			</div>
		</div>


		<!-- 	����� ������ �������� �����ϸ� ������ִ� �� 	-->
		<!-- ����� ��°��� -->
		<input type="text" class="liststart" name="liststart" placeholder="�����" readonly="readonly" />

		<!-- ������ ��°��� -->
		<input type="text" class="listthrough" name="listthrough"  placeholder="������" readonly="readonly"> 
		
		<!-- ������ ��°��� -->
		<input type="text" class="listarrival" name="listarrival"  placeholder="������" readonly="readonly" />
		
		</br> 
		
		
		<!-- �������� �� ������ ��ư ����  -->
		
		<div class="threerow">
		
			<!-- �������� �� -->
			<label class="lbtitle">��������</label>
			<!-- �������� �Է¶� -->
			<input type="text" class="traveltitle" name="traveltitle" placeholder="15�ڳ��� �Է����ּ���.">

			<!-- ������ �˾� -->
			
			<!-- ������ �˾���ư -->
			<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">������</button>
			
		</div><!-- threerow -->
		
			<!-- Modal -->
			<!-- ������ ��ư Ŭ���� ������ ȭ�� -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">
	
					<!-- Modal content-->
					<div class="modal-content">
						
						<!-- ������ �˾� ��� -->
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h3 class="modal-title">������ �˻�</h3>
						</div>
						
						<!-- ������ �˾� �ٵ�(������ ���̵� �˻� �� ��°���) -->
						<div class="modal-body">
							
							<!-- ������ ���̵� �˻� ���� -->
							<div class="input-group">
								<input id="modalsearchplace" type="text" class="form-control"placeholder="Search ID..">
								<span class="input-group-btn">
									<button id="modalsearchbtn" class="btn btn-default"
										type="button">Search</button>
								</span>
							</div>
							
							<!--/input-group  -->
							<!-- 	 �˾�â���� �˻��� ���̵� ������ִ� ���    -->
							<div class="col-md-13">
								<input type="textarea" id="idlist" name="idlist" readonly>
								<input type="button" value="O" id="okbtn">
								<input type="button" value="X" id="cancelbtn">
							</div>
	
						</div><!-- end input-group class -->
	
						<!-- ������ �˾� Ǫ�� (Ŭ�����ư) -->
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal"
								id="ftclosebtn">Close</button>
						</div>
						
					</div><!-- end modal-content class -->
				</div><!-- end modal-dialog class -->
			</div><!-- end myModal id -->
			
		<!--	��߳�¥ ������¥ ����	-->
		<div class="input-group input-group-lg" id="datediv">
			<span class="input-group-addon" id="sizing-addon1">��߳�¥</span>
			<input type="text" id="startdate" name="startdate" class="form-control" placeholder="����" aria-describedby="sizing-addon1">
			<span class="input-group-addon" id="sizing-addon1">������¥</span>
			<input type="text" id="arrivaldate" name="arrivaldate" class="form-control" placeholder="����" aria-describedby="sizing-addon1">
		</div>
		
	</form><!-- end contnsubform -->
	</div><!-- end container class -->

</body>
</html>
