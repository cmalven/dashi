root = exports ? this

root.Dashboards = new Meteor.Collection('dashboards')
root.PanelOptions = new Meteor.Collection('panelOptions')
root.Panels = new Meteor.Collection('panels')
root.Messages = new Meteor.Collection('messages')