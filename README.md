

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

# PIll Mate ๐ ์๊ฐ 
 - ์ฝํ ์ญ์ทจ๋ฅผ ํธํ๊ฒ ๋ณต์ฉํ  ์ ์๋๋ก ๋์์ฃผ๊ณ   
 - ์ฝ๊ตญ์ ์์ฝํ ์ ๋ณด๋ฅผ ์ ๊ณต๋ฐ์ ์ ์๋ ์ฌ์ฉ์ ํธ์๋ฅผ ์ํ ์๋น์ค 

 
# ํ๋ก์ ํธ ๊ตฌ์กฐ 
 ```
lib
	**ใด components**
		(๋ฒํผ, ์ปฌ๋ฌ, ๋ผ์ฐํธ ์ ๋๋ฉ์ด์, ์ฌ์ด์ฆ, ํ๋ง)
	**ใด config**
		(hive box name.. ๋ฑ)
	**ใด models**
		(๋ชจ๋ธ ๋ฐ์ดํฐ)
	**ใด repositories**
		(hive CRUD)
	**ใด pages**
		(ํ์ด์ง)
	**ใด services**
		(์๋น์ค ๋ก์ง)
```

## 1) create medicine screen(์ฐธ๊ณ ์ฉ ์คํฌ๋ฆฐ) 
  

  ![initial](https://adbrdev.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F9790ca0d-ece9-4cf8-9158-0598f1258868%2FUntitled.png?table=block&id=5c3aec00-e3cb-497a-8e24-6f9fc4d91086&spaceId=e6d84797-ce36-4dfc-abe5-8623d02aeeeb&width=2000&userId=&cache=v2)
**UI**

- ์ฝ ์ถ๊ฐ์ฐฝ ์ข๋ฃ button
- ์ฝ ์ฌ์ง ์ถ๊ฐ button
- ์ฝ ์ด๋ฆ  input
- ๋ค์ button

**์กฐ๊ฑด**

- `์ฝ ์ฌ์ง ์ถ๊ฐ button` ํด๋ฆญ์ [์ฌ์ง์ดฌ์]
- `์ฝ  ์ด๋ฆ input` hint text
= ๋ณต์ฉํ  ์ฝ ์ด๋ฆ์ ๊ธฐ์ํด์ฃผ์ธ์.
- `์ฝ  ์ด๋ฆ input` label text
= ์ฝ ์ด๋ฆ
- `๋ค์ button` ํ์ฑํ ์กฐ๊ฑด: ์ฝ ์ด๋ฆ ์๋ ฅ ํ
- `๋ค์ button` ํด๋ฆญ์ "create medicine 

screen2

**UI**

- ๋ค๋ก๊ฐ๊ธฐ button
- ๋นผ๊ธฐ button + timepicker button
- ์๋ ์๊ฐ ์ถ๊ฐ button
- ์๋ฃ button

**์กฐ๊ฑด**

- `๋ค๋ก๊ฐ๊ธฐ button` ํด๋ฆญ์ "create medicine screen 2" ์ฐฝ์ผ๋ก ์ด๋
- default times: 08:00 + 13:00 + 19:00
- `๋นผ๊ธฐ button` ํด๋ฆญ์ ํด๋น ์๋ ์๊ฐ์์ ์ญ์ 
- `timepicker button` ํด๋ฆญ์ bottom sheet  ํธ์ถ
- `๋ณต์ฝ ์๋ฆผ ์๊ฐ ์ถ๊ฐ button` ํด๋ฆญ์ default value:  "now"
- `์๋ฃ button` ํด๋ฆญ์ ํ๋ฉด ์ข๋ฃ ํ, timeline ํธ์ถ
    - ์ฝ ๋ฐ์ดํฐ ์ถ๊ฐ
    - ์๋ ์ค์ 

![initial](https://adbrdev.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fa3f2da7b-ec93-4e85-a045-e959602650dc%2FUntitled.png?table=block&id=79315fe7-14fa-4099-9dcb-49060e290f44&spaceId=e6d84797-ce36-4dfc-abe5-8623d02aeeeb&width=670&userId=&cache=v2)


screen2 > bottom sheet

**UI**

- timepicker
- ์ทจ์ button
- ์ ํ button

**์กฐ๊ฑด**

- `์ทจ์ button` ํด๋ฆญ์ ๋ฐํ ์ํธ ๋๊ฐ๊ธฐ
- `์ ํ button` ํด๋ฆญ์ ์กฐ๊ฑด ์ฒดํฌ:
์๊ฐ ์ค๋ณต ๋  ๊ฒฝ์ฐ ์ถ๊ฐ ์๋๋๋ก ์ฒ๋ฆฌ

![Untitled](https://adbrdev.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fca5531ae-9f96-4c87-a439-46592500d723%2FUntitled.png?table=block&id=6a9f4a65-5ac7-4a0e-bf9d-658faaa9a3b9&spaceId=e6d84797-ce36-4dfc-abe5-8623d02aeeeb&width=660&userId=&cache=v2)
## 2) today screen

- text emoji
    
    ```
    ๐ 08:30
    โ 22:05 โ 20:19
    ```
    

![**1 ํ์๋ผ์ธ์ฐฝ (์ฝ ๋ณต์ฉ ์ )**](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/94bf9878-4be6-43b2-a3de-0e9da27681d7/Untitled.png)

**1 ํ์๋ผ์ธ์ฐฝ (์ฝ ๋ณต์ฉ ์ )**

![1 ํ์๋ผ์ธ์ฐฝ (์ฝ ๋ณต์ฉ ํ)](https://adbrdev.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fc0404c4c-8f9b-4989-8710-985f5910a89f%2FUntitled.png?table=block&id=d2e4b3c4-1fe7-4e06-b622-f3505eb4ebc4&spaceId=e6d84797-ce36-4dfc-abe5-8623d02aeeeb&width=670&userId=&cache=v2)

![1 ํ์๋ผ์ธ์ฐฝ 
ํ์๋ผ์ธ์ฐฝ โ ํ์ผ โ ์ฌ์ง ์ด๋ฏธ์ง ํด๋ฆญ์ (2) ํธ์ถ](https://adbrdev.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F94bf9878-4be6-43b2-a3de-0e9da27681d7%2FUntitled.png?table=block&id=be82d267-59a9-4337-a4ea-87baabfe6a0c&spaceId=e6d84797-ce36-4dfc-abe5-8623d02aeeeb&width=670&userId=&cache=v2)

1 ํ์๋ผ์ธ์ฐฝ 
ํ์๋ผ์ธ์ฐฝ โ ํ์ผ โ ์ฌ์ง ์ด๋ฏธ์ง ํด๋ฆญ์ (2) ํธ์ถ

![1 ํ์๋ผ์ธ์ฐฝ (์ฝ ๋ณต์ฉ ์ )
ํ์๋ผ์ธ์ฐฝ โ ์ฝ ๋ณต์ฉ ์๊ฐ ์๋ ฅ ๋ฒํผ(์ง๊ธ | ์๊น) ํด๋ฆญ์ (3) bottom sheet ์ถ๋ ฅ](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/94bf9878-4be6-43b2-a3de-0e9da27681d7/Untitled.png)

1 ํ์๋ผ์ธ์ฐฝ (์ฝ ๋ณต์ฉ ์ )
ํ์๋ผ์ธ์ฐฝ โ ์ฝ ๋ณต์ฉ ์๊ฐ ์๋ ฅ ๋ฒํผ(์ง๊ธ | ์๊น) ํด๋ฆญ์ (3) bottom sheet ์ถ๋ ฅ

![**2 ์ฝ ์ฌ์ง ํฌ๊ฒ๋ณด๊ธฐ์ฐฝ**
](https://adbrdev.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Febed29f0-9b07-4098-a7e4-61fddc039d0c%2FUntitled.png?table=block&id=bcee044c-6f53-4058-9740-ab969c387a29&spaceId=e6d84797-ce36-4dfc-abe5-8623d02aeeeb&width=670&userId=&cache=v2)

**2 ์ฝ ์ฌ์ง ํฌ๊ฒ๋ณด๊ธฐ์ฐฝ**

![**3 ์๊ฐ์ค์  ๋ฐํ์ํธ**
](https://adbrdev.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F94bf9878-4be6-43b2-a3de-0e9da27681d7%2FUntitled.png?table=block&id=7002cf83-5d0d-4b46-84ec-5146b4a18a7d&spaceId=e6d84797-ce36-4dfc-abe5-8623d02aeeeb&width=670&userId=&cache=v2)
