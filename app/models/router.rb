class Router < Extension

  dataset_module do
    def routers
      filter(app: 'NoOp', appdata: 'ROUTER')
    end
  end

  set_dataset(self.routers)

  def validate
    super
    validates_unique [:context, :exten, :app, :appdata]
  end

  def before_validation
    set_default_data
    super
  end

  def before_destroy
    routes_selector.delete
    super
  end

  def after_save
    save_routes
    super
  end

  def routes
    @routes ||= routes_selector.to_a
  end

  def routes=(new_routes)
    @routes = new_routes.map do |route|
      { context: context,
        exten: route[:exten],
        priority: route[:priority],
        app: 'GoTo',
        appdata: '${EXTEN},s,1'
      }
    end
    @routes_changed = true
    save_routes unless changed_columns.any? # Force routes saving
  end

  private

  def set_default_data
    if exten.nil? && priority.nil? && app.nil? && appdata.nil?
      self.exten = 's'
      self.priority = 1
      self.app = 'NoOp'
      self.appdata = 'ROUTER'
    end
  end

  def save_routes
    return if !routes_changed?
    db.transaction do
      routes_selector.delete
      @routes.each do |route|
        self.class.create(route)
      end
      @routes = nil
      @routes_changed = nil
    end
  end

  def routes_changed?
    @routes_changed
  end

  def routes_selector
    self.class.unfiltered.where(context: context)
                         .exclude(app: 'NoOp', appdata: 'ROUTER')
  end

end
