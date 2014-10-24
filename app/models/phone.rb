class Phone < Extension

  dataset_module do
    def phones
      filter(appdata: 'PHONE')
    end
  end

end
