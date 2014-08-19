class Visitor < ActiveRecord::Base
  has_no_table
  column :favorite, :string
  column :comment, :string
  validates_presence_of :favorite
  IMAGE_LABELS = ['San Francisco', 'Sydney', 'Paris']
  
  def update_spreadsheet
    puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    connection = GoogleDrive.login(Rails.application.secrets.gmail_username, Rails.application.secrets.gmail_password)
    puts connection
    puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    ss = connection.spreadsheet_by_title('Rails-bootstrap-tut')
    if ss.nil?
      ss = connection.create_spreadsheet('Rails-bootstrap-tut')
    end
    ws = ss.worksheets[0]
    last_row = 1 + ws.num_rows
    ws[last_row, 1] = Time.now
    ws[last_row, 2] = self.favorite
    ws[last_row, 3] = self.comment
    ws.save
    
  end
  
end