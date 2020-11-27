<%@ page contentType="text/html; charset=UTF-8"%>

<div class="row col-md-12 col-lg-6 mb-4">



          <div>
            <ul class="nav">

              <li class="nav-item mr-3">
                <div class="dropdown">
                  <button id="btn111" class="btn btn-light" type="button" data-toggle="dropdown" aria-haspopup="true">

                    <span class="row">
                      	정렬
                      <i class="material-icons">
                        keyboard_arrow_down
                      </i>
                    </span>

                  </button>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="javascript:addTag('최근 인기순',1);">최근 인기순</a>
                    <a class="dropdown-item" href="javascript:addTag('역대 인기순',1);">역대 인기순</a>
                    <a class="dropdown-item" href="javascript:addTag('최신순',1);">최신순</a>
                  </div>
                </div>
              </li>

              <li class="nav-item mr-3">
                <div class="dropdown">
                  <button class="btn btn-light" type="button" data-toggle="dropdown" aria-haspopup="true" >
                    <span class="row">
                      	주거형태
                      <i class="material-icons">
                        keyboard_arrow_down
                      </i>
                    </span>
                  </button>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="javascript:addTag('원룸','type');">원룸</a>
                    <a class="dropdown-item" href="javascript:addTag('아파트','type');">아파트</a>
                    <a class="dropdown-item" href="javascript:addTag('빌라','type');">빌라</a>
                    <a class="dropdown-item" href="javascript:addTag('단독주택','type');">단독주택</a>
                    <a class="dropdown-item" href="javascript:addTag('상업공간','type');">상업공간</a>
                    <a class="dropdown-item" href="javascript:addTag('사무공간','type');">사무공간</a>
                    <a class="dropdown-item" href="javascript:addTag('기타','type');">기타</a>
                  </div>
                </div>
              </li>

              <li class="nav-item mr-3">
                <div class="dropdown">
                  <button class="btn btn-light" type="button" data-toggle="dropdown" aria-haspopup="true">
                    <span class="row">
                      	평수
                      <i class="material-icons">
                        keyboard_arrow_down
                      </i>
                    </span>
                  </button>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="javascript:addTag('10평 미만','size');">10평 미만</a>
                    <a class="dropdown-item" href="javascript:addTag('10평대','size');">10평대</a>
                    <a class="dropdown-item" href="javascript:addTag('20평대','size');">20평대</a>
                    <a class="dropdown-item" href="javascript:addTag('30평대','size');">30평대</a>
                    <a class="dropdown-item" href="javascript:addTag('40평대','size');">40평대</a>
                    <a class="dropdown-item" href="javascript:addTag('50평대 이상','size');">50평대 이상</a>
                  </div>
                </div>
              </li>

              <li class="nav-item mr-3">
                <div class="dropdown">
                  <button class="btn btn-light" type="button" data-toggle="dropdown" aria-haspopup="true">
                    <span class="row">
                      	스타일
                      <i class="material-icons">
                        keyboard_arrow_down
                      </i>
                    </span>
                  </button>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="javascript:addTag('모던','style');">모던</a>
                    <a class="dropdown-item" href="javascript:addTag('북유럽','style');">북유럽</a>
                    <a class="dropdown-item" href="javascript:addTag('빈티지','style');">빈티지</a>
                    <a class="dropdown-item" href="javascript:addTag('내추럴','style');">내추럴</a>
                  </div>
                </div>
              </li>

            </ul>
          </div>
        </div>