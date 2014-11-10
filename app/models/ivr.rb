class Ivr < Extension

  dataset_module do
    def ivrs
      filter(app: 'NoOp', appdata: 'IVR')
    end
  end

  set_dataset(self.ivrs)

  def before_validation
    set_default_attributes
    super
  end

  def targets
    data.select{ |x| x.app == 'GoTo' && x.appdata != 'end,s,1' }.map do |target|
      { context: target.appdata.split(',').first, code: target.exten }
    end
  end

  def media
    media_object
    if @media_object
      @media_object.appdata.match(/media=(.*)/){ |m| return File.basename(m[1]) }
    end
  end

  def media=(path)
    media_object
    @media_object ||= self.class.new(
      context: context, exten: 'setvariables', priority: variables.size+1, app: 'Set'
    )
    @media_object.appdata = "media=#{path}"
    # puts @media_object.inspect
    @media_object.save
    @media_object
  end

  def variables
    data.select{ |x| x.exten == 'setvariables' && x.app == 'Set' }
  end

  def media_object
    variables.each do |x|
      @media_object ||= x if x.appdata =~ /media=(.*)/
    end
    @media_object
  end

  private

  def data
    # Use Extension here to prevent default filter been applied
    @data ||= Extension.where(context: context).to_a
  end

  def set_default_attributes
    if exten.nil? && priority.nil? && app.nil? && appdata.nil?
      self.exten = 's'
      self.priority = 1
      self.app = 'NoOp'
      self.appdata = 'IVR'
    end
  end
end
