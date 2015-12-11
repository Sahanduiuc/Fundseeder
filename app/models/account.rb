class Account < ActiveRecord::Base
  belongs_to :type_name

  has_attached_file :file
  validates_attachment :file,
                       presence: true,
                       content_type: { content_type: 'text/plain' },
                       size: { in: 0..10.kilobytes }
  validates :file_file_name, :format => { :with => /(^.+_(Account)_\d+\.txt$)|(^.+_Activity_\d+\.txt$)|(^.+_Position_\d+\.txt$)|(^.+_Security_\d+\.txt$)/, message: 'wrong file' }

  after_create :parse_file_name

  def parse_file_name
    f_name = File.basename self.file_file_name, '.*'
    f_name = f_name.split '_'

    self.acc_id = f_name[0]
    self.type_name = TypeName.find_or_create_by(name: f_name[1])
    self.date = Date.parse f_name[2]
    self.save
  end
end
