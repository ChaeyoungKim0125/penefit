<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<script>
  Kakao.init('7fc4637ef75ce5e0c13bf113d0284ba6'); // ����Ϸ��� ���� JavaScript Ű �Է�
</script>

<a id="kakao-login-btn" href="javascript:loginWithKakao()">
  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
    alt="īī�� �α��� ��ư" />
</a>
<p id="token-result"></p>
<button class="api-btn" onclick="sendToMe()" style="visibility:hidden">������ �޽��� ������</button>

<script>
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'https://developers.kakao.com/tool/demo/oauth',
      state: 'sendme_feed',
      scope: 'talk_message', // �� ���� �׸� ���� �� ����� ���� �ʿ�
    });
  }

  function sendToMe() {
    Kakao.API.request({
      url: '/v2/api/talk/memo/default/send',
      data: {
        template_object: {
          object_type: 'feed',
          content: {
            title: '���� ġ�� ����',
            description: '#���� #���� #���� #ī�� #������ #�Ұ���',
            image_url:
              'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
            link: {
              // [�� ���ø����̼�] > [�÷���] ���� ����� ����Ʈ �����ΰ� ��ġ�ؾ� ��
              mobile_web_url: 'https://http://localhost:8082',
              web_url: 'https://http://localhost:8082',
            },
          },
          social: {
            like_count: 286,
            comment_count: 45,
            shared_count: 845,
          },
          buttons: [
            {
              title: '������ ����',
              link: {
                mobile_web_url: 'https://http://localhost:8082',
                web_url: 'https://http://localhost:8082',
              },
            },
            {
              title: '������ ����',
              link: {
                mobile_web_url: 'https://developers.kakao.com',
                web_url: 'https://developers.kakao.com',
              },
            },
          ],
        },
      },
    })
      .then(function(res) {
        alert('success: ' + JSON.stringify(res));
      })
      .catch(function(err) {
        alert('error: ' + JSON.stringify(err));
      });
  }

  // �Ʒ��� ���� ���� UI �ڵ��Դϴ�.
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      document.querySelector('#token-result').innerText = 'login success, ready to send a message';
      document.querySelector('button.api-btn').style.visibility = 'visible';
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
</script>
</body>
</html>