class Audio < ActiveRecord::Base
  has_attachment :storage => :file_system, :path_prefix => 'media/audio', 
                 :max_size => 8.megabytes,
                 :content_type => ['audio/aiff', 'audio/x-aiff', 'audio/basic',
                                   'audio/mp3', 'audio/x-mp3', 'audio/mpeg',
                                   'audio/wav', 'audio/x-wav']
  validates_as_attachment
  
  has_many :jobs, :as => :processable
  
  after_create :create_conversion_job
  
  def create_conversion_job
    self.jobs.create!
  end
  
  def convert
    system("ffmpeg -i #{public_filename} -ab 128k #{public_filename}.converted.mp3")
  end
  
  def process!
    convert
  end
end
