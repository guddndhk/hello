<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>

	<p>
	<p>���� ����Ʈ ù��° �׽�Ʈ</p>
	<button id="check_module" type="button">���� ����Ʈ ù��° �׽�Ʈ</button>



	<script>
		$("#check_module").click(function() {
			var IMP = window.IMP; // ��������
			IMP.init('imp18633009');
			
			IMP.request_pay({
				//pg : 'inicis',
				pg : 'kakao',
				/*
				'kakao':īī������,
				html5_inicis':�̴Ͻý�(��ǥ�ذ���)
				'nice':���̽�����
				'jtnet':����Ƽ��
				'uplus':LG���÷���
				'danal':�ٳ�
				'payco':������
				'syrup':�÷�����
				'paypal':������
				 */
				pay_method : 'card',
				/*
				'samsung':�Ｚ����,
				'card':�ſ�ī��,
				'trans':�ǽð�������ü,
				'vbank':�������,
				'phone':�޴����Ҿװ���
				 */
				merchant_uid : 'merchant_' + new Date().getTime(),
				
				name : '�ֹ���:�����׽�Ʈ',
				
				amount : 100,
				
				buyer_email : 'nava@naver.com',
				buyer_name : '�׽�Ʈ',
				buyer_tel : '010-1234-5678',
				buyer_addr : '����Ư����',
				buyer_postcode : '111-111',
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			
				
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '������ �Ϸ�Ǿ����ϴ�.';
					msg += '����ID : ' + rsp.imp_uid;
					msg += '���� �ŷ�ID : ' + rsp.merchant_uid;
					msg += '���� �ݾ� : ' + rsp.paid_amount;
					msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
				} else {
					var msg = '������ �����Ͽ����ϴ�.';
					msg += '�������� : ' + rsp.error_msg;
				}
				alert(msg);
			});
		});
	</script>


</body>
</html>