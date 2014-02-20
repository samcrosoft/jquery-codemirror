(($jQ)->

  PLUGIN_NAME           = "codemirror"
  _ATTR_PREFIX          = "code-mirror"
  _ATTR_JOIN_CHARACTER  = "-"
  _DEFAULT_SETTINGS =
    'mode' : 'javascript'
    'lineNumbers' : on
    'runmode' : off

  _ATTR_OPTIONS = [
    'mode'
    'runmode']


  ###
  build the settings here
###
  _buildSettings = (oOptions = {}) ->
    return $jQ.extend _DEFAULT_SETTINGS, oOptions

  ###
  build the unique objects set from html data attributes
###
  _buildHTMLOptions = (oObject) ->
    aOptions = {}
    for item, i in _ATTR_OPTIONS
      sAttrName = [_ATTR_PREFIX, item].join _ATTR_JOIN_CHARACTER
      sAttrVal = $(oObject).data sAttrName
      if typeof sAttrName isnt "undefined" and typeof sAttrVal isnt "undefined"
        aOptions[item] = sAttrVal

    return aOptions

    return

  ###
  create the plugin
###
  $jQ.fn[PLUGIN_NAME] = (oOptions = {}) ->
    oCodeMirrorObject     = @
    oSettings             = _buildSettings(oOptions)

    @each () ->
      oHTMLAttrSettings = _buildHTMLOptions(@)
      oUniqueSetting = $jQ.extend oSettings, oHTMLAttrSettings
      # create the instance here
      oCodeMirrorObject = CodeMirror.fromTextArea @, oUniqueSetting
      return

    # return the object
    return oCodeMirrorObject

)(jQuery)