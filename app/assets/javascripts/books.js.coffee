# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  jQuery('.following-user').click ->
    jQuery.ajax
      type: 'post'
      url: '/users/follow'
      data: { id: jQuery(@).attr('value') }
      error: (data) ->
        alert('关注失败：' + data.responseText)
      success: (data) ->
        alert('关注成功')
  jQuery('.unfollowing-user').click ->
    jQuery.ajax
      type: 'post'
      url: '/users/unfollow'
      data: { id: jQuery(@).attr('value') }
      error: (data) ->
        alert('取消关注失败：' + data.responseText)
      success: (data) ->
        alert('取消关注成功')




