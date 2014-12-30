class CallQueue < Extension

  dataset_module do
    def call_queues
      filter(app: 'NoOp', appdata: 'QUEUE')
    end
  end

  set_dataset(self.call_queues)

  def default_variables
    { qtimeout: 60 }
  end
end
