class Tower.Controller extends Tower.Class
  @include  Tower.Support.Callbacks
  @extend   Tower.Support.EventEmitter
  @include  Tower.Support.EventEmitter
  
  @instance: ->
    @_instance ||= new @
    
  @metadata: ->
    @_metadata ||= {}
  
  constructor: ->
    @constructor._instance = @
    @headers              = {}
    @status               = 200
    @request              = null
    @response             = null
    @params               = {}
    @query                = {}
    @resourceName         = @constructor.resourceName()
    @resourceType         = @constructor.resourceType()
    @collectionName       = @constructor.collectionName()
    @formats              = _.keys(@constructor.mimes())
    
    if @constructor._belongsTo
      @hasParent          = true
    else
      @hasParent          = false

require './controller/callbacks'
require './controller/helpers'
require './controller/instrumentation'
require './controller/params'
require './controller/redirecting'
require './controller/rendering'
require './controller/resourceful'
require './controller/responder'
require './controller/responding'

Tower.Controller.include Tower.Controller.Callbacks
Tower.Controller.include Tower.Controller.Helpers
Tower.Controller.include Tower.Controller.Instrumentation
Tower.Controller.include Tower.Controller.Params
Tower.Controller.include Tower.Controller.Redirecting
Tower.Controller.include Tower.Controller.Rendering
Tower.Controller.include Tower.Controller.Resourceful
Tower.Controller.include Tower.Controller.Responding

module.exports = Tower.Controller
