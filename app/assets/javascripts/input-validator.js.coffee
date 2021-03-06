#客户端输入数据验证，配置不需要更改。使用0.5.4版本和jquery 1.9+
#注意jquery选择器要form#id,精确选出要验证的form元素
$(document).on "page:change", ->
  $.fn.bootstrapValidator.DEFAULT_OPTIONS = $.extend null, $.fn.bootstrapValidator.DEFAULT_OPTIONS,
    message: 'The field is not valid'
    feedbackIcons:
      valid: 'glyphicon glyphicon-ok'
      invalid: 'glyphicon glyphicon-remove'
      validating: 'glyphicon glyphicon-refresh'


#用户登录页面
  $('form#user_login').bootstrapValidator
    fields:
      'email':
        validators:
          notEmpty:
            message: '请输入邮箱帐号'
          emailAddress:
            message: '请填写格式正确的邮箱'
      'password':
        validators:
          notEmpty:
            message: '请填写密码'
          stringLength:
            min: 8
            max: 128
            message: '密码长度不对'
#用户注册页面
  $('form#new_user').bootstrapValidator
    fields:
      'user[email]':
        validators:
          notEmpty:
            message: '请输入邮箱帐号'
          emailAddress:
            message: '请填写格式正确的邮箱'
          remote:
            message: '该邮箱已被注册！'
            url: '/users/check_available'
      'user[password]':
        validators:
          notEmpty:
            message: '请填写密码'
          stringLength:
            min: 8
            max: 128
            message: '密码长度需大于8位'
          identical:
            field: 'user[password_confirmation]'
            message: '请再次输入以确认密码'
      'user[password_confirmation]':
        validators:
          notEmpty:
            message: '请再次输入以确认密码'
          identical:
            field: 'user[password]'
            message: '两次输入的密码不一致，请重新输入'
      'user[name]':
        validators:
          notEmpty:
            message: '请务必填写您的姓名'
      'user[phone_number]':
        validators:
          notEmpty:
            message: '请填写手机或电话号码'
          regexp:
            regexp: /^[+,\d][\s,\d,-]{9,20}$/
            message: '请正确输入手机或电话号码！'
      'user[avatar]':
        validators:
          file: 
            extension: 'jpg,jpeg,png,bmp,gif,tif,tiff'
            type: 'image/jpeg,image/png,image/tiff,image/gif,image/x-ms-bmp'
            maxSize: 2048 * 1024
            message: '上传图片格式须为jpg、jpeg、png、tiff、gif、bmp之一，且文件小于2MB'








