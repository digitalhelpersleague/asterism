class Medium < Sequel::Model
  mount_uploader :file, MediumUploader

  #has_and_belongs_to_many :ivrs
end
