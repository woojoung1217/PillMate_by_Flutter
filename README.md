

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



#

# PILL MATE 💊 소개 
 - 약품 섭취를 편하게 복용할 수 있도록 도와주고  
 - 약국에 의약품 정보를 제공받을 수 있는 사용자 편의를 위한 서비스 

 
# 프로젝트 구조 
 ```
lib
	**ㄴ components**
		(버튼, 컬러, 라우트 애니메이션, 사이즈, 테마)
	**ㄴ config**
		(hive box name.. 등)
	**ㄴ models**
		(모델 데이터)
	**ㄴ repositories**
		(hive CRUD)
	**ㄴ pages**
		(페이지)
	**ㄴ services**
		(서비스 로직)
```

## 1) create medicine screen
  

  ![initial](https://adbrdev.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F9790ca0d-ece9-4cf8-9158-0598f1258868%2FUntitled.png?table=block&id=5c3aec00-e3cb-497a-8e24-6f9fc4d91086&spaceId=e6d84797-ce36-4dfc-abe5-8623d02aeeeb&width=2000&userId=&cache=v2)
**UI**

- 약 추가창 종료 button
- 약 사진 추가 button
- 약 이름  input
- 다음 button

**조건**

- `약 사진 추가 button` 클릭시 [사진촬영]
- `약  이름 input` hint text
= 복용할 약 이름을 기입해주세요.
- `약  이름 input` label text
= 약 이름
- `다음 button` 활성화 조건: 약 이름 입력 후
- `다음 button` 클릭시 "create medicine 
