<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    
    <title>문의 답변</title>
<body> 
    <!-- hidden -->
    
    <input type="hidden" name="questionNo" id="questionNo"  value= "${questionNo }" />
    <input type="hidden" name="regId" id="regId" value="${sessionScope.member.memberId}"/>
    
    <div class="container-fluid my-5">
        <div class="row">
            <div class="col-6">
            
                <!--- Form Begins -->
                <section class="card" id="answerForm">
                <div class="card-header" >
                </div>
                <div class="card-body">
                    <div class="tab-content" >
                        <div class="tab-pane fade show active"  role="tabpanel" aria-labelledby="posts-tab">
                            <div class="form-group">
                                <textarea class="form-control" id="answer" rows="3" placeholder="문의에 대한 답변을 달아주세요"></textarea>
                            </div>
                        </div>
                </div>
                <div class="text-right">
                    <button type="button" class="btn btn-primary" id="doInsertBtn">답변등록</button>
                </div>
                </div>
                </section>
                <!--- Form Ends -->

                <!--contents begins -->
                <section class="card mt-4">
                    <div id="answerList" class="border p-2">
                    </div>
                </section>
                <!--contents  end -->
            </div>
        </div>
    </div>
  <!-- d -->

</body>
</html>