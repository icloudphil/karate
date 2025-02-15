Feature: web-browser automation

Background:
   * configure driver = { type: 'chrome' }

Scenario: try to login to github
    and then do a google search

  Given driver 'https://github.com/login'
  And input('#login_field', 'dummy')
  And input('#password', 'world')
  When submit().click("input[name=commit]")
  Then match html('.flash-error') contains 'Incorrect username or password.'
  
  Given driver 'https://google.com'
  And input("input[name=q]", 'karate dsl')
  When submit().click("input[name=btnI]")
  # this may fail depending on which part of the world you are in !
  Then waitForUrl('https://github.com/karatelabs/karate')
