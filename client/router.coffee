root = exports ? this

Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'

Router.map ->

  @route 'index',
    path: '/'
    template: 'index'
    onBeforeAction: ->
      Session.set('dashboard_id', null)
      @next()
    waitOn: ->
      return Meteor.subscribe('dashboards', Session.get('dashboard_id'))
    data: ->
      {
        dashboards: Dashboards.find()
      }
  
  @route 'dashboard_show',
    path: '/dashboard/:_id'
    template: 'dashboard_show'
    onBeforeAction: ->
      Session.set('dashboard_id', @params._id)
      root.panelManager or= new PanelManager()
      @next()
    waitOn: ->
      return Meteor.subscribe('dashboards', Session.get('dashboard_id'))
    data: ->
      dashboardId = Session.get('dashboard_id')

      {
        panels: Panels.find({dashboard_id: dashboardId}, {sort: {panel_order: 1}})
      }
    onStop: ->
      panelManager?._destroyPackery()