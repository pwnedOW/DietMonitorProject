<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
	<meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <link href="../css/base.css" rel="stylesheet">
    <link href="../css/common.css" rel="stylesheet">
    <link href="../css/board.css" rel="stylesheet">
    <script type="text/javascript" src="../script/header.js"></script>
    <script type="text/javascript" src="../script/common.js"></script>

    <title>foodIngredients</title>
</head>
<body>
	<header id="header">
        <div class="header_inner header_sub">
            <jsp:include page="../common/header.jsp" />
        </div>
    </header>
	

    <div class="sub_content"></div>

    <section class="sub_title">
        <div class="inner">
            <div class="wrap">
                <h1 class="title">나의 하루 섭취 식품</h1>
                <div class="route wrap">
                    <a href="./index.html"><img class="home center" src="../images/sub/icon/material-home.svg"
                            alt="홈 아이콘"></a>
                    <div class="route_info wrap">
                        <a href="./foodSearchList"><span class="dap1">마이페이지</span></a>
                        <a href="./myIntakeFood"><span class="dap2">나의 하루 섭취 식품</span></a>
                    </div>
                </div>
            </div>

        </div>

    </section>


    <section class="table_menu">
        <div class="inner">
            <div class="wrap">
                <p class="reference">
                    ※ 아래 표를 클릭하시면 해당 식품의 영양정보가 나와요
                </p>

                <button class="board_btn wrap">
                    <img src="../images/sub/icon/material-install-desktop.svg" alt="">
                    <p class="ml10">나의 영양성분 기록 저장</p>
                </button>

            </div>


            <table class="new_tbl_board tbl_boards tb01 mt20 mb20">
                <colgroup>
                    <col style="width: 10%;">
                    <col style="width: 30%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                    <col style="width: 10%;">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">식품명</th>
                        <th scope="col">식품대분류</th>
                        <th scope="col">섭취량(g)</th>
                        <th scope="col">에너지(Kcal)</th>
                        <th scope="col">하루 섭취<br>식품 등록</th>
                    </tr>
                </thead>
                
                <tbody>
                	<c:forEach var="diet" items="${dailyDiet}" varStatus="status">
	                    <tr onclick="">
	                        <td>${status.count}</td>
	                        <td>${diet.foodName}</td>
	                        <td>${diet.mainCategoryName}</td>
	                        <td>${diet.foodIntake}</td>
	                        <td>${diet.kcal}</td>
	                        <td>
	                        	<form action="/deleteDiet" method="POST">
	                        		<input type="hidden" name="logNo" value="${diet.logNo}">
		                            <button class="board_td_btn wrap" type="submit">
		                                <img src="../images/sub/icon/feather-x-box.svg" alt="">
		                                <p>등록취소</p>
		                            </button>
	                            </form>
	                        </td>
	
	                    </tr>
					
	                    <tr class="tr_event">
	                        <td class="more_information" colspan="6">
	                            <div class="wrap">
	                                <img  class="slider-left" data-target=".nutrient${status.count}" src="../images/sub/icon/slider/slider-left.svg" alt="">
	                                <div class="more_nutrient">
	                                    <ul class="nutrient nutrient${status.count} wrap">
	                                        <li class="more_item wrap">
	                                            <p class="title">에너지(kcal)</p>
	                                            <p class="info">${diet.kcal}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">수분(g)</p>
	                                            <p class="info">${diet.water}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">단백질(g)</p>
	                                            <p class="info">${diet.protein}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">지방(g)</p>
	                                            <p class="info">${diet.fat}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">탄수화물(g)</p>
	                                            <p class="info">${diet.carbohydrate}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">당류(g)</p>
	                                            <p class="info">${diet.sugars}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">식이섬유(g)</p>
	                                            <p class="info">${diet.dietaryFiber}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">칼슘(mg)</p>
	                                            <p class="info">${diet.calcium}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">철(mg)</p>
	                                            <p class="info">${diet.ironContent}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">인(mg)</p>
	                                            <p class="info">${diet.phosphorus}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">칼륨(mg)</p>
	                                            <p class="info">${diet.potassium}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">나트륨(mg)</p>
	                                            <p class="info">${diet.sodium}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">비타민A(μg RAE)</p>
	                                            <p class="info">${diet.vitaminA}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">레티놀(μg)</p>
	                                            <p class="info">${diet.retinol}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">베타카로틴(μg)</p>
	                                            <p class="info">${diet.betaCarotene}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">티아민(mg)</p>
	                                            <p class="info">${diet.thiamine}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">리보플라빈(mg)</p>
	                                            <p class="info">${diet.riboflavin}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">니아신(mg)</p>
	                                            <p class="info">${diet.niacin}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">비타민C(mg)</p>
	                                            <p class="info">${diet.vitaminC}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">비타민D(μg)</p>
	                                            <p class="info">${diet.vitaminD}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">콜레스테롤(mg)</p>
	                                            <p class="info">${diet.cholesterol}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">포화지방산(g)</p>
	                                            <p class="info">${diet.saturatedFat}</p>
	                                        </li>
	                                        <li class="more_item wrap">
	                                            <p class="title">트랜스지방산(g)</p>
	                                            <p class="info">${diet.transFat}</p>
	                                        </li>
	                                    </ul>
	                                </div>
	
	
	                                <img  class="slider-right" data-target=".nutrient${status.count}" src="../images/sub/icon/slider/slider-right.svg" alt="">
	                            </div>
	                        </td>
	                    </tr>
					</c:forEach>
                </tbody>
            </table>
            <button class="common_btn mb80" type="submit">전체등록 취소</button>

    </section>


    <section class="table_menu" id="section1">
        <div class="inner">
            <div class="wrap">
                <p class="table_menu_sub">등록 식품 영양성분 함량 합계</p>

                <div class="pagenation_btn wrap">
                    <div class="slider_prev">
                        <img src="../images/sub/icon/slider/slider-left.svg" alt="">
                    </div>
                    <div class="slider_next">
                        <img src="../images/sub/icon/slider/slider-right.svg" alt="">
                    </div>
                </div>

            </div>

            <div class="table_inner">
                <table class="new_tbl_board tbl_boards tb01 mt20 mb60">
                    <colgroup>
                        <col style="width: 10%;">
                        <col style="width: 15%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 7%;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">에너지(kcal)</th>
                            <th scope="col">수분(g)</th>
                            <th scope="col">단백질(g)</th>
                            <th scope="col">지방(g)</th>
                            <th scope="col">탄수화물(g)</th>
                            <th scope="col">당류(g)</th>
                            <th scope="col">식이섬유(g)</th>
                            <th scope="col">칼슘(mg)</th>
                            <th scope="col">철(mg)</th>
                            <th scope="col">인(mg)</th>
                            <th scope="col">칼륨(mg)</th>
                            <th scope="col">나트륨(mg)</th>
                            <th scope="col">비타민A(μg RAE)</th>
                            <th scope="col">레티놀(μg)</th>
                            <th scope="col">베타카로틴(μg)</th>
                            <th scope="col">티아민(mg)</th>
                            <th scope="col">리보플라빈(mg)</th>
                            <th scope="col">니아신(mg)</th>
                            <th scope="col">비타민C(mg)</th>
                            <th scope="col">비타민D(μg)</th>
                            <th scope="col">콜레스테롤(mg)</th>
                            <th scope="col">포화지방산(g)</th>
                            <th scope="col">트랜스지방산(g)</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <tr onclick="">
                            <td>${totalNutrient.kcal}</td>
                            <td>${totalNutrient.water}</td>
                            <td>${totalNutrient.protein}</td>
                            <td>${totalNutrient.fat}</td>
                            <td>${totalNutrient.carbohydrate}</td>
                            <td>${totalNutrient.sugars}</td>
                            <td>${totalNutrient.dietaryFiber}</td>
                            <td>${totalNutrient.calcium}</td>
                            <td>${totalNutrient.ironContent}</td>
                            <td>${totalNutrient.phosphorus}</td>
                            <td>${totalNutrient.potassium}</td>
                            <td>${totalNutrient.sodium}</td>
                            <td>${totalNutrient.vitaminA}</td>
                            <td>${totalNutrient.retinol}</td>
                            <td>${totalNutrient.betaCarotene}</td>
                            <td>${totalNutrient.thiamine}</td>
                            <td>${totalNutrient.riboflavin}</td>
                            <td>${totalNutrient.niacin}</td>
                            <td>${totalNutrient.vitaminC}</td>
                            <td>${totalNutrient.vitaminD}</td>
                            <td>${totalNutrient.cholesterol}</td>
                            <td>${totalNutrient.saturatedFat}</td>
                            <td>${totalNutrient.transFat}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
    </section>

    <section class="table_menu" id="section2">
        <div class="inner">
            <div class="wrap">
                <p class="table_menu_sub">일일 권장량 대비 비교</p>

                <div class="pagenation_btn wrap">
                    <div class="slider_prev">
                        <img src="../images/sub/icon/slider/slider-left.svg" alt="">
                    </div>
                    <div class="slider_next">
                        <img src="../images/sub/icon/slider/slider-right.svg" alt="">
                    </div>
                </div>

            </div>

            <div class="table_inner">
                <table class="new_tbl_board tb01 mt20 mb60">
                    <colgroup>
                        <col style="width: 10%;">
                        <col style="width: 15%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 7%;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">에너지(kcal)</th>
                            <th scope="col">수분(g)</th>
                            <th scope="col">단백질(g)</th>
                            <th scope="col">지방(g)</th>
                            <th scope="col">탄수화물(g)</th>
                            <th scope="col">당류(g)</th>
                            <th scope="col">식이섬유(g)</th>
                            <th scope="col">칼슘(mg)</th>
                            <th scope="col">철(mg)</th>
                            <th scope="col">인(mg)</th>
                            <th scope="col">칼륨(mg)</th>
                            <th scope="col">나트륨(mg)</th>
                            <th scope="col">비타민A(μg RAE)</th>
                            <th scope="col">레티놀(μg)</th>
                            <th scope="col">베타카로틴(μg)</th>
                            <th scope="col">티아민(mg)</th>
                            <th scope="col">리보플라빈(mg)</th>
                            <th scope="col">니아신(mg)</th>
                            <th scope="col">비타민C(mg)</th>
                            <th scope="col">비타민D(μg)</th>
                            <th scope="col">콜레스테롤(mg)</th>
                            <th scope="col">포화지방산(g)</th>
                            <th scope="col">트랜스지방산(g)</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <tr onclick="">
                            <td>100</td>
                            <td>0.2</td>
                            <td>0.2</td>
                            <td>0.2</td>
                            <td>
                            	<div class="wrap_jc">
		                                    <img src="../images/sub/icon/data_up_down/akar-arrow-up.svg" alt="">
		                                    <p class="ml10 blue">0.2</p>
	                            </div>
                            </td>
                            <td>0.2</td>
                            <td>0.2</td>
                            <td>
	                            <div class="wrap_jc">
	                                    <img src="../images/sub/icon/data_up_down/akar-arrow-down.svg" alt="">
	                                    <p class="ml10 red">0.2</p>
	                            </div>
                            </td>
                            <td>0.2</td>
                            <td>0.2</td>
                            <td>0.2</td>
                            <td>0.2</td>
                            <td>0.2</td>
                            <td>0.2</td>
                        </tr>
                    </tbody>
                </table>
            </div>
    </section>

    <section class="decibal_title mb80">
        <div class="inner">
            <div class="info">
                <span class="blue_style">에너지(kcal),</span>
                <span class="blue_style">탄수화물(g),</span>
                <span class="blue_style">지방(g)</span>
                <span class="text">섭취가 너무 적어요.</span>
            </div>
            <div class="wrap mb50">
                <p class="text">부족한 영양성분의 상세 설명과 추천 식품이 궁금하시다면 해당 영양성분의 상세보기를 눌러주세요.</p>
                <div class="page_nation wrap">
                    <div class="slide_prev">
                        <img src="../images/sub/icon/slider/akar-chevron-left-small.svg" alt="">
                    </div>
                    <div class="slide_stop">
                        <img src="../images/sub/icon/slider/akar-two-line-vertical.svg" alt="">
                    </div>
                    <div class="slide_next">
                        <img src="../images/sub/icon/slider/akar-chevron-right-small.svg" alt="">
                    </div>
                </div>
            </div>

            <div class="slide_cont_box swiper-container">
                <div class="swiper-wrapper">
                    <div class="slide_box wrap">
                        <div class="box swiper-slide">
                            <div class="title_food">에너지(kcal)</div>
                            <div class="info">
                                <div class="info_title">에너지가 부족할 경우</div>
                                <div class="info_detail">
                                    하루종일 힘이없다. 칼로리는 우리 몸이 움직이고
                                    활동하는데 필요한 에너지이다. 하루 섭취 칼로리
                                    가 너무 적다는 것은 기름 없는 자동차나 마찬가...
                                </div>
                            </div>
                            <div class="more">상세보기</div>
                        </div>
                    </div>

                    <div class="slide_box wrap">
                        <div class="box swiper-slide">
                            <div class="title_food">에너지(kcal)</div>
                            <div class="info">
                                <div class="info_title">에너지가 부족할 경우</div>
                                <div class="info_detail">
                                    하루종일 힘이없다. 칼로리는 우리 몸이 움직이고
                                    활동하는데 필요한 에너지이다. 하루 섭취 칼로리
                                    가 너무 적다는 것은 기름 없는 자동차나 마찬가...
                                </div>
                            </div>
                            <div class="more">상세보기</div>
                        </div>
                    </div>

                    <div class="slide_box wrap">
                        <div class="box swiper-slide">
                            <div class="title_food">에너지(kcal)</div>
                            <div class="info">
                                <div class="info_title">에너지가 부족할 경우</div>
                                <div class="info_detail">
                                    하루종일 힘이없다. 칼로리는 우리 몸이 움직이고
                                    활동하는데 필요한 에너지이다. 하루 섭취 칼로리
                                    가 너무 적다는 것은 기름 없는 자동차나 마찬가...
                                </div>
                            </div>
                            <div class="more">상세보기</div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </section>

    <div class="popup">
        <div class="box">
            <div class="close">
                <img src="../images/sub/icon/close-x.svg" alt="">
            </div>
            <div class="title">에너지가 부족할 경우 나타나는 현상</div>
            <div class="info">
                하루종일 힘이없다. 칼로리는 우리 몸이 움직이고 활동하는데 필요한 에너지이다. 하루 섭취 칼로리가 너무 적다는 것은
                기름 없는 자동차나 마찬가지 하루종일 힘이없다. 
                칼로리는 우리 몸이 움직이고 활동하는데 필요한 에너지이다. 하루 섭취 칼로리가 너무 적다는 것은 기름 없는 자동차나
                마찬가지 하루종일 힘이없다. 칼로리는 우리 몸이 움직이고 활동하는데 필요한 에너지이다. 하루 섭취 칼로리가 너무 적
                다는 것은 기름 없는 자동차나 마찬가지 하루종일 힘이없다. 칼로리는 우리 몸이 움직이고 활동하는데 필요한 에너지이다.
                칼로리는 우리 몸이 움직이고 활동하는데 필요한 에너지이다. 하루 섭취 칼로리가 너무 적다는 것은 기름 없는 자동차나
                마찬가지 하루종일 힘이없다. 칼로리는 우리 몸이 움직이고 활동하는데 필요한 에너지이다. 다다다다다다다다
            </div>

            <div class="wrap_s mt40 mb30">
                <img src="../images/sub/icon/Icon fa-solid-star.svg" alt="">
                <p class="popup_title">일일 권장량 대비 부족 영양소 별 추천 검색</p>
            </div>
            <ul class="tag_inner wrap_s">
                <li class="tag">#햄버거</li>
                <li class="tag">#아이스크림</li>
                <li class="tag">#햄버거</li>
                <li class="tag">#아이스크림</li>
                <li class="tag">#아이스크림</li>
                <li class="tag">#햄버거</li>
            </ul>
        </div>
    </div>


   <jsp:include page="../common/footer.jsp" />
</body>
</html>