@rism.filter 'highlightPhrase', -> (text, phrase) ->
  return text if !phrase || !text
  start_position = text.toLowerCase().indexOf(phrase.toLowerCase())
  return text if start_position <= -1
  end_position = start_position + phrase.length
  return text.substr(0, start_position) +
    '<span class="highlight">' +
      text.substr(start_position, phrase.length) +
   '</span>' + text.substr(end_position, text.length - end_position)
