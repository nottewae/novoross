@app.controller 'AdminController' ,($scope,$http,$log,$rootScope)->
  $scope.data={
    is_admin:false
  }
  $scope.setBig=(image,e)->
    $("#big-image").attr('src',image)
    $("#delete_big").attr('data-image_id',$(e.target).attr('data-id'))
  $scope.setAdmin=()->
    $rootScope.data.is_admin=true
  $scope.desetAdmin=()->
    $rootScope.data.is_admin=false
  $scope.deleteImage=(e)->
    $log.info e
    obj=e.target
    id=$(obj).attr('data-image_id')
    $log.info id
    $http({method: 'GET', url: '/delete_photo/'+id}).success (data)->
      window.location.reload()
  $scope.getAdmin=()->
    return $rootScope.data.is_admin
  $scope.deleteBlog=(e)->
    id=$(e.target).attr('data-id')
    $http({method: 'GET', url: '/ajax/delete_post/'+id}).success (data)->
      window.location.href="/"

  $scope.getEmail=()->
    return $rootScope.data.user_email
  $scope.setEmail=(email)->
    $rootScope.data.user_email=email
  $scope.log=()->
    $log.info $rootScope.data
  $scope.logout=()->
    $http({method: 'GET', url: '/ajax/logout'}).success (data)->


      $scope.desetAdmin()
      window.location.reload()
      return
  $scope.init=(params)->
    unless $rootScope.data
      $rootScope.data={}
    $rootScope.data.is_admin=params.is_admin
    $rootScope.data.user_email=params.email
    $log.info $rootScope
  $scope.login_data={}
  $scope.login=()->
$(document).ready ()->
  $("#login_form").on "ajax:success", (e, data, status, xhr) ->
    console.log data
    scope= angular.element("#AdminController").scope()
    scope2= angular.element("#AdminController2").scope()
    scope3= angular.element("#AdminController3").scope()
    if data.is_admin

      scope.$apply('setAdmin()')
      scope.$apply('setEmail("'+data.email+'")')
      scope2.$apply('setAdmin()')
      scope2.$apply('setEmail("'+data.email+'")')
      scope3.$apply('setAdmin()')
      scope3.$apply('setEmail("'+data.email+'")')
      $("#myModal").modal('hide')
      window.location.reload()
    else

      scope.$apply('desetAdmin()')
      scope2.$apply('desetAdmin()')
      scope3.$apply('desetAdmin()')
    scope.$apply('log()')
    scope2.$apply('log()')
    $("#login_form").find('input[name=authenticity_token]').val(data.new_aut)
    $("#blog_form").find('input[name=authenticity_token]').val(data.new_aut)
  $("#logout_link").on "ajax:success", (e, data, status, xhr) ->
    scope= angular.element("#AdminController").scope()
    scope2= angular.element("#AdminController2").scope()
    scope3= angular.element("#AdminController3").scope()
    scope.$apply('desetAdmin()')
    scope2.$apply('desetAdmin()')
    scope3.$apply('desetAdmin()')
    scope.$apply('log()')
    scope2.$apply('log()')
    $("#login_form").find('input[name=authenticity_token]').val(data.new_aut)
    $("#blog_form").find('input[name=authenticity_token]').val(data.new_aut)
    $(':input','#login_form')
    .not(':button, :submit, :reset, :hidden')
    .val('')
    .removeAttr('checked')
    .removeAttr('selected')
  $('#blog_form').on "ajax:success",(e, data, status, xhr)->
    if data.id and $("body").find("#blog_"+data.id).length>0
      $("body").find("#blog_"+data.id).html(data.prev_text)
    else
      window.location.reload()
    $("#newPost").modal('hide')
  $("a").click ()->
    window.location.href=$(this).attr('href')
