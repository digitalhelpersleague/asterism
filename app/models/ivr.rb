class Ivr < Extension

  dataset_module do
    def ivrs
      filter(app: 'NoOp', appdata: 'IVR')
    end
  end

  set_dataset(self.ivrs)

  def targets
    relatives.select{ |x| x.app == 'GoTo' && x.appdata != 'end,s,1' }.map do |target|
      { context: target.appdata.split(',').first, code: target.exten }
    end
  end

  # TODO: finish transitions with Hangup sub

  def targets=
    # TODO: targets assignation
    # relatives_dataset.find_or_create(...)
    # TODO: finish with (priority: last, app: 'GoTo', appdata: 'end,s,1')
  end

  def medium
    # FIXME: variables.find_by_key('media').first[:media] rescue nil
    # TODO: maybe we need Medium model here?
  end

  def medium=(file)
    medium = Medium.create(file: file)
    set_variable(:medium, medium.file)
  end

  private

  def set_default_attributes
    if exten.nil? && priority.nil? && app.nil? && appdata.nil?
      self.exten = 's'
      self.priority = 1
      self.app = 'NoOp'
      self.appdata = 'IVR'
    end
  end

  def default_variables
    { waittimeout: 0 }
  end
end
