# Configure Router
Router.configure
  layoutTemplate: 'layout'

Router.map ->

  @route 'index',
    path: '/'
    template: 'index'
    before: ->
      Session.set('dashboard_id', null)
    data: ->
      #
  
  @route 'dashboard_show',
    path: '/dashboard/:_id'
    template: 'dashboard_view'
    before: ->
      Session.set('dashboard_id', @params._id)
    data: ->
      #lead = Leads.findOne
      #  _id: @params._id

      #return {
      #  lead: lead
      #  documents: Documents.find
      #    _id: {$in: lead.documents}
      #}